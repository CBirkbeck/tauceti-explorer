# LLHLM23: local models, generic Breuil–Mézard and Serre weights

**Partial extraction checkpoint, issue #1254.** Codex — codex-hjdg0j continues the full-paper extraction by Codex — codex-7e92bd. The result contains 350 inventory entries (2 library, 3 planned, 345 missing), 15 routes, 25 API/test groups referencing all 83 inventoried definitions, and 35 source findings. Reading coverage and inventory routing are not proof-input closure: the explicit gaps below prevent a `complete` verdict. No Lean implementation or independent verification of the findings is claimed.

The machine-readable companion is [PAPER-LE-LEHUNG-LEVIN-ETAL-23.result.json](PAPER-LE-LEHUNG-LEVIN-ETAL-23.result.json). Its `items` contain the mathematical statements and locators; `sourceData.appendixB` preserves the computational equations and every normalization-table row. IDs N/U/M/K/P/G/B/V/A/Q follow the main-paper sections; Z denotes an explicitly extracted external input. L denotes an exact pinned-library theorem. E1–E35 are source findings, a separate namespace.

## What the paper establishes

For unramified local fields and sufficiently generic tame inertial types, the paper compares potentially crystalline deformation geometry to explicit differential local models. The comparison is sensitive to Hodge bounds, the coefficient field's ramification index, completion and the choice of inertial presentation. The models are flat closures of characteristic-zero flag varieties inside an affine Grassmannian; they differ from the naive differential intersections.

Theorem 7.3.2 has two levels. A numerical depth bound gives a noncanonical closed immersion of completed charts. A further nonzero integral polynomial in the inertial parameters gives the regular-chart isomorphism and **domain-or-zero versal rings at semisimple residual points**. Warning 7.3.3 prevents treating this as a canonical globally glued diagram over the integers. Appendix B exhibits a dense branching locus, so arbitrary residual points must not inherit the domain conclusion.

Theorem 7.4.2 identifies reduced crystalline component support with the Serre weights in the reduction of the corresponding algebraic/tame type. Its strong bound is `max{2(h+1), 4n+h}` for regular Hodge weights in `[0,h]`. Component membership implies Herzig-predicted membership under the specified numerical bound; the converse additionally uses the fixed-point polynomials. Obvious weights have a separate implication that does not need those polynomials.

Sections 8–9 assemble these facts with patching. Generic geometric and versal Breuil–Mézard cycles are effective and canonical with their specified support and semisimple pullbacks. For a finite set of dominant weights containing zero, stronger shifted polynomial genericity gives the small-weight equations, including virtual tame Weil–Deligne types. The virtual coefficients may be negative. These BM equations extend to sufficiently generic semisimplifications of wild representations; this does not extend the domain theorem to wild points. Arbitrary finite type sets do not by themselves give uniqueness of every BM cycle.

The global Serre theorem assumes the definite-unitary CM setting, `F+ != Q`, split and unramified p-adic places, `p` not dividing `2n`, residual automorphy, adequacy over `F(zeta_p)`, and tame polynomial-generic local parameters. Appendix A permits arbitrary away-from-p level. The modularity-lifting theorem also retains polarization, semisimple residual p-adic restrictions, the adjoint fixed-field condition and an appropriate residual automorphic lift. Its change-of-weight relaxation comes afterwards.

## Sources and reading boundaries

The primary source is the [author-hosted Springer PDF](https://math.rice.edu/~bl70/LocModels.pdf), *Inventiones mathematicae* 231 (2023), 1277–1488, DOI `10.1007/s00222-022-01163-4`. Downloaded 23 September 2026, it has 212 PDF pages and SHA-256 `e56478796d15c938b864447d4b48d928ee749b95644df15e1e9055bdf9a142dd`. The inherited codex-7e92bd checkpoint records reading all pages, proofs and the bibliography; extracted-text trouble spots were inspected as images, including the rotated Table 1. Locators use PDF pages rather than an invented offset to journal pagination.

[arXiv v2](https://arxiv.org/abs/2007.05398v2), dated 15 June 2022, has SHA-256 `3cdae0b192d3ba8d75391fbd2bf40264e23c9d9c69d536ad30b50dddda0d61af`. Only selected PDF pages 24, 28, 35, 38 and 69, with incidental pages 96 and 115, were compared. The corresponding errors persist there; this is not a claim to have read the entire preprint twice. The author's paper listing showed no correction link for this article. The publisher page timed out twice, so its corrections listing was not inspected. `known: new` means no correction was located in the recorded searches, not a claim of priority.

External primary material actually inspected:

- [Weight elimination in Serre-type conjectures](https://math.rice.edu/~bl70/WEpaper.pdf), published PDF pages 8, 37, 67–68: the correct opposition anti-homomorphism and the exact formal-smoothness/obvious-weight-propagation statements. SHA-256 `dbf6f1d12f7ea47e2f4185e5d4e17b4ee3dfbd789022ee9168da2a265fec5a15`.
- [Shapes and shadows](https://math.rice.edu/~bl70/Shadows.pdf), PDF pages 23–24: the earlier fields-of-norms formula corrected explicitly by LLHLM23. SHA-256 `0437985ba4ccc24dfe9ee3cd2feb47e56a4c5e5964169f9092bc96882b868ef0`.
- [Emerton–Gee v4](https://arxiv.org/abs/1908.07185v4), PDF pages 126–129, 163–164 and 181; all nine pages of the [authors' errata](https://www.ma.imperial.ac.uk/~tsg/Index_files/moduli-errata.pdf). The respective hashes are `4eba204b702b18f939d781fb118c06183badc51a216c94b0e607d98c58044005` and `fe9687ddfc4ddc11ee7436b6da1a80630dae8d59e4bb80e0a3cfbf27355bfe0c`. The corrected exhaustion argument, coefficient-field assumption and unramified-character conventions are part of the import contract.
- [Boixeda Alvarez v3](https://arxiv.org/abs/1910.04780v3), all 17 pages as text and pages 8–9 as images, SHA-256 `170a547678f7676744bafc1f2cfddc8898bf05379b99ab0c28ba880c1cfcc7ad`. The Type A characteristic-zero fixed-point theorem is extracted as Z01. Dense matrix formulas and its auxiliary inputs still need a complete transcription/proof audit; three clear proof-display slips are recorded as E29–E31.

The prerequisite list distinguishes inspected inputs from the unread queue. Elkik, BLGGT and Khare–Wintenberger II now have the precise reading records and extracted adapters below. Primary bibliographic pages were also checked for Deligne–Lusztig, Caraiani–Levin, Pyvovarov and CEGGPS; that does not establish reading their proofs.

## Library and ownership audit

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Broad searches of both pinned Lean trees are preserved in `libraryAudit.searches`. The advanced Deligne–Lusztig, Serre-weight, Kisin, Emerton–Gee, inertial-type, affine-flag and Elkik packages were not found by these searches. The positive Deligne–Lusztig text hit was a GL2 nonsplit-torus file, not the representation construction. Tau Ceti's Young-symmetrizer Weyl module assumes a Q-algebra; it does not supply the integral/mod-p module used here.

Existing finite Coxeter, root-system, dimension and coefficient-ring atoms remain reusable. The two newly extracted atomic items L01/L02 are marked library only after reading their declarations; no advanced package is marked built from a name match. The complete item-by-item declaration/adapter audit remains open. Broad negative searches alone do not show every constituent lemma is absent.

The relevant reviewed rows of AUDIT17 (deformation/patching algebra), AUDIT13 (classical algebraic modular forms) and AUDIT21 (Satake geometry) were inspected. The audit file had no rows for LocalGaloisDeformationRings, FiniteFlatGroupsAndIntegralPadicHodgeTheory or PotentialAutomorphyInfrastructure at the audited snapshot; no reviewed negative verdict is invented for them. The corresponding current roadmap descriptions were read directly.

Ownership was refreshed at atlas commit `384cf15`, including LLHLM20 checkpoint PR #2197. Existing candidate IDs are reused even when they have not become accepted stage records. Such items remain `missing`, not falsely `planned` in a nonexistent accepted layer.

The important boundaries are:

- Integral PZ and universal-loop geometry stays with `GeometricSatakeLocalModelsPartII`; differential equations and true-monodromy comparisons go to `LocalGaloisDeformationRingsPartIIMonodromyModels`.
- Existing `LocalGaloisDeformationRings:L7` supplies bounded-height lattice moduli, tame descent/gauges and fixed-type deformation rings. The new comparison does not duplicate the unrestricted-ring normality candidate or the rank-two potentially Barsotti–Tate candidate.
- Affine orders and admissible pairs reuse `RootSystemsPartIIDominanceAndDemazure`. Finite reductive modular theory reuses the newly proposed `ModularRepresentationsOfFiniteReductiveGroups`; PA.1 and `ReductiveGroupsIntegralRepresentationsPartII` supply shared integral rational-module foundations that must be reconciled once.
- The Emerton–Gee foundation is shared with `WeightZeroCrystallineLiftingRings`. Its weight-zero endpoint is not a prerequisite of the common stack/component stages.
- Exact patching functors and Appendix A use the existing all-rank CEGGPS candidate. General patching algebra and global polarized deformation data remain in their established roadmaps.
- `GenericGL3SerreWeightsAndLattices` is reused for the common all-rank BM/Serre foundation while retaining its specialized GL3 lattice endpoint. Its legacy ID does not imply that the common foundation is restricted to rank three. The proposed widening needs final ownership/dependency review.
- The final lifting theorem reuses `PolarizedAutomorphyLifting`.

Whole-roadmap arrows would hide a cycle. The required **phase order** is finite-group/tame Kisin foundations; weak potentially diagonalizable patching and its local nonvanishing criterion; generic monodromy comparison and domains; minimal rank-one BM; arbitrary-level weak patching construction and its separate detectability proof; global Serre weights; change-of-weight modularity lifting. Appendix A's detectability uses the domain theorem, whereas the early weak patching existence used to prove that theorem does not. GL3 integral-lattice conclusions must not be used to construct their own initial patching functor.

## Continuation: approximation and the two tensor products

Codex — codex-hjdg0j freshly read the published LLHLM23 PDF pages 68–69 and 78–81, concentrating on Proposition 3.3.9, the end of Theorem 3.7.1 and Lemma 3.7.2. This is a bounded continuation of the earlier full-paper reading. The following original proofs were read, including their standing conventions:

| Source | Actual reading | SHA-256 of downloaded PDF |
| --- | --- | --- |
| [Elkik (1973)](https://numdam.org/item/10.24033/asens.1258.pdf) | PDF3–7, printed554–558: §0.1–0.2, Lemma1 and its complete proof; printed556 also rendered | 74ddbf6a04ca9fb4e6b9ef0da537231045a293d56242571749cda079349d40c5 |
| [BLGGT](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf) | PDF95–98, printed595–598: affinoid conventions, LemmaA.1.1 and completion examples | c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b |
| [Khare–Wintenberger II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | PDF4–6 conventions and PDF8–10, including Proposition2.2 and its full proof | 53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4 |

Elkik's original setting is Noetherian. Its presentation-dependent ideal is the sum of conductor-weighted Jacobian minors, not simply the full-row Jacobian of an arbitrary redundant presentation. Z03 gives this definition, base-change inclusion, evaluation, smooth-locus and uniform-witness APIs. Z04 isolates the finite adjugate/Taylor calculation. Z05 keeps the original arbitrary-ideal statement with bounded parameter torsion and n > max(2h,h+k).

U24 needs complete parameter-torsionfree test rings that need not be Noetherian. Z06 therefore extracts only the I=A specialization: the algebraic correction uses cancellation instead of the Noetherian torsion cutoff. If the residual vanishes modulo t^m and the evaluated Jacobian ideal contains t^r, the correction lies in t^(m-r), and the new residual vanishes modulo t^(2m-2r). For m>2r, the witness persists by a unit adjustment and the recurrence has the exact solution m_j=2r+2^j(m_0-2r). Completeness and separatedness give the exact solution. No arbitrary-ideal non-Noetherian version is asserted.

Z07 chooses the full universal Jacobian ideal as the base-change witness H_B and chooses r from the fixed Noetherian universal presentation: smoothness after inverting v gives v^r in the sum of the equation and Jacobian ideals. Evaluating at an approximate zero and absorbing the equation error into a unit gives the required t^r witness. Thus N=2r+1 works uniformly in the test ring. The linear equation t^r X=t^m shows why agreement modulo t^m would be an incorrect strengthening.

Theorem 3.7.1 uses two different completions. Z11 records KWII in its original finite-p-adic-field scope. Z12 extracts its **domain conclusion** over a general complete DVR: at each rational generic point, the regular local completion is a power series ring over the fraction field. Saturated powers J_n=P^n R[1/π]∩R have zero intersection; Chevalley's theorem makes them cofinal toward the maximal-ideal topology. Their quotients are finite free over the DVR. The completed tensor embeds, through these quotients and their generic jets, into the joint power series ring. This requires retractions to the coefficient DVR. The ramified quadratic example in the tests shows failure without them. Generic regularity of an arbitrary tensor over an imperfect field is not included in this extracted conclusion.

Z08–Z10 and Z14 instead treat the completed **affinoid** tensor product. BLGGT defines geometric connectedness by finite field extensions and assumes a finite extension of Q_l. Its product proof uses two rational fibers in allegedly disjoint open-and-closed pieces; their common product point contradicts disjointness. Z14 records the same proof over a complete nonarchimedean field, with the exact Nullstellensatz, finite scalar-extension and rational-fiber comparisons still requiring supplier closure. Z10 supplies the connected normal algebra with a rational point used by LLHLM23: finite Galois extension acts transitively on components, whereas the rational point fixes a component; inseparable extensions are handled by universal homeomorphisms. Z13 combines connectedness with the product's independently established regularity and the flat formal models' torsionfreeness. Smoothness of the original generic charts must be retained when checking that regularity.

The existing AdicSpacesPartII:R0 and F0 own these analytic product/completion interfaces; DeformationAndDerivedPatchingAlgebra:R03.1 owns the complete local coefficient tensors. SchemeAndStackFoundations:SF.4 receives the approximation lemmas. The upstream AdicSpaces carrier is imported. No competing roadmap is added.

At the pinned Tau Ceti commit, the actual declarations TauCeti.connectedSpace_primeSpectrum_iff_idempotent_eq_zero_or_one and TauCeti.geometricallyConnected_tensorProduct were read in full, alongside Mathlib's scheme-level definition. L01 supplies the idempotent criterion in U42. L02 concerns the ordinary algebraic tensor and does not discharge the completed affinoid theorem or the finite-extension convention comparison. Normality/completion, Chevalley, formal regular local structure and affinoid fiber supplier contracts remain explicit gaps.

Exact Fraction/integer checks passed for 576 precision-recurrence steps, 210 scalar Newton corrections, 175 examples of precision loss, and five tensor zero-divisor identities. They check the stated bounds and counterexample; they do not prove the general approximation or tensor theorems. The reproducible code is included below.

## Computational checks and their limits

Exact integer/Fraction regressions checked 2,500 opposition product pairs and the central-character, missing tensor-factor, contraction, tame-unipotent and genericity counterexamples. The later component theorem's bound was checked against the repaired earlier bound on 2,431 regular Hodge tuples in ranks 2–5 with maximum weight at most 10. These tests support the recorded repairs; they are not Lean proofs.

For Appendix B, SymPy 1.14.0 over `Q(a,b)` verified:

1. Every listed special-fibre component ideal annihilates the three chart equations.
2. Ten table ideals annihilate all seven normalization relations; the double-cover row retains the inherited quadratic equation in W, as it should for an ideal in the normalization quotient.
3. All seven normalization relations vanish after substituting `W=-t*d21/c22` in the chart's fraction field.
4. `t^3` lies in the Jacobian ideal in the chart quotient.

These calculations do not certify minimality/primality, scheme multiplicities or all specializations over `Z[a,b,1/P]`. The localized integer certificates and the exceptional Groebner cases remain explicit obligations. In particular, a computation over `Q(a,b)` may invert additional parameter polynomials.

Several short, reproducible mathematical regressions are worth preserving:

- E2/E3: for GL2/F7 with eta=(1,0), the lowest-alcove Serre presentation `(1,(3,0))` has central exponent 2; residual inertia with mu=(2,0) has determinant exponent 3. This fixes the omitted eta and the residual sign independently.
- E4: for GL2/F11, lambda=(1,1), type translation `(5,0)` and residual translation `(7,1)`, the prescribed admissible pair exists but central exponents 5 and 7 forbid the printed untensored intersection. Tensoring by W(lambda) restores exponent 7.
- E15: for GL2/F19, lambda=(6,0) and `R_s(7,0)` with s the transposition, the printed 6-generic bound permits the constituent `F(6,6)`. It is not 1-deep, so its component is outside Definition 4.6.1's domain. The safe bound is `max(2n,h_lambda+n-1)`. In Theorem 7.4.2, `h_lambda <= h`, and `max(2n,h_lambda+n−1) <= max(2(h+1),4n+h)`, so the stated later bound covers the repair directly.
- E19: an unramified Frobenius matrix `[[1,1],[0,1]]` over F5 is tame and nonsplit. Generic multiplicity-free inertia needs a separate argument before the semisimple proof applies.
- E25: p=11, a=3, b=8 lies on the allowed localized parameter locus. The actual exceptional coefficient `(a-b)(a-1)-1` is zero; the printed alternative is 6.
- E26: p=101 and mu=(90,30,0) give shifted positive-root differences 61,31,92. The weight is 5-deep but not 10-deep, although the printed raw cyclic polynomial is nonzero. This refutes that sufficient-polynomial assertion, not the comparison theorem itself under explicit 10-depth.

## Remaining work

This is a checkpoint because the extraction cannot yet support the protocol's no-gap completion standard. In particular, a routed inventory is not a substitute for exact imported theorem statements. Continue with the structured `gaps` and the handoff: finish primary inputs, split bundled results, complete the atom audit and phase dependencies, and refine the grouped APIs into declaration-level plans. The general conjectures in §8 and §9 must remain labelled conjectural.

The remaining uniform CAS certificates are also mathematical proof obligations, not evidence that the source statements are false. Do not silently turn an unverified computation into a new source error.

## Proposed routes

### 1. RootSystemsPartIIDominanceAndDemazure

Reuse the affine combinatorics candidate already proposed by HE18, HE21, KPZ26 and Zhu17. The finite-root and Coxeter infrastructure at the pins does not supply the extended affine, central-coset, upper-arrow and admissible-pair package.

Reuse RootSystemsPartIIDominanceAndDemazure, preserving its existing HE18/HE21/KPZ/Zhu obligations. Add the extended affine group with central directions, eta-shifted p-dot action, length, Bruhat and upper-arrow orders, regular alcoves, admissibility, reduced products and admissible pairs of LLHLM23 §2.1. Prove the equivalent criteria of Proposition2.1.6 with lambda+eta in both translation bounds, and Corollary2.1.7 modulo X0; supply the reversed restricted-factor version. Opposition is an order equivalence and an anti-homomorphism, not a homomorphism for the same target multiplication. Derive numerical and polynomial genericity transport with the actual loss under small factors. Import finite root data and Coxeter length/order from Root systems (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems); do not duplicate their implementation. Export the affine combinatorics to the modular representation and local-model owners. Test rank one, GL2 central translations, an explicit noncommuting star product and empty nonregular admissible subsets. Suggested file: TauCeti/RepresentationTheory/RootSystems/Affine/AdmissiblePairs.lean. Planets: Admissible pairs; Alcove depth; Affine opposition.

Items: N02, N03, N04, N05, N06, N07, N08, N09, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N24, N26, M10.

### 2. PotentialAutomorphyInfrastructure

Integral Weyl/dual Weyl modules and the relevant linkage machinery already lie in PA.1. The finite reductive modular owner imports this coefficient-module interface and reconciles it with ReductiveGroupsIntegralRepresentationsPartII; characteristic-zero Young symmetrizers are insufficient.

Layers: `PotentialAutomorphyInfrastructure:PA.1`.

Items: N22.

### 3. ModularRepresentationsOfFiniteReductiveGroups

Reuse the LLHLM20 candidate merged in PR2197. Add the all-rank generic finite-group combinatorics without building a second finite reductive representation roadmap.

Reuse ModularRepresentationsOfFiniteReductiveGroups from PAPER-LE-LEHUNG-LEVIN-ETAL-20. Retain its GL3 lattice/Ext obligations, but put the present all-rank common foundation before those specialized consumers. Import Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), RootSystemsPartIIDominanceAndDemazure, and integral Weyl modules from PotentialAutomorphyInfrastructure PA.1, coordinating the common rational-module carrier with ReductiveGroupsIntegralRepresentationsPartII. Build good Deligne–Lusztig pairs, sign-normalized characteristic-zero representations, reduction in the Grothendieck group, restricted Serre weights, compatible central lifts, lowest-alcove presentations, outer weights and covering. Prove LLHLM23 Propositions2.3.7–2.3.12 and2.6.2–2.6.6 under their explicit numerical bounds. Correct Proposition2.6.4 to retain tensor W(lambda). The Herzig recipe imports tame inertia/type realization from LocalGaloisDeformationRings and SmoothRepresentationsPartII; it must not assume any global Serre conjecture. Distinguish constituent sets from multiplicities and covering from an arbitrary linkage relation. Test determinant twists in GL2/F11, quotienting by (p-pi)X0, the p19 constituent-depth counterexample and the covering length/equality criterion. Suggested file: TauCeti/RepresentationTheory/FiniteReductive/GenericSerreWeights.lean. Planets: Lowest-alcove presentations; Deligne–Lusztig constituents; Herzig weights; Serre-weight covering.

Items: N01, N23, N25, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71.

### 4. SmoothRepresentationsPartII

Reuse the existing smooth representation Part II; it already receives depth-zero Deligne–Lusztig types from Newton–Thorne and local type theory from Fintzen/Bushnell–Henniart. These are local K-types, not the modular finite-group reduction theorem.

Extend the existing SmoothRepresentationsPartII proposal. Construct Weil–Deligne inertial parameters with their Weil extension and nilpotent operator, the componentwise dominance order on inertia-isotypic Jordan partitions, and the sigma(tau) of LLHLM23 Theorem2.5.4. Split occurrence-implies-dominance, exact-type multiplicity one, and the converse for generic representations; maximal monodromy is required for the final multiplicity-one converse. Prove Proposition2.5.5 for a simultaneous compatible choice of types, using Bushnell–Kutzko, Schneider–Zink and Pyvovarov. Import Smooth representations of local groups (SmoothRepresentationsOfLocalGroups SR.0–SR.2), classical LLC from EndoscopicTransferAndUnitaryTraceComparison ET.6, and Deligne–Lusztig representations from ModularRepresentationsOfFiniteReductiveGroups. Construct the virtual Shotton type when needed by the BM consumer; it may have negative Grothendieck coefficients. Test zero versus maximal monodromy and GL2 principal-series versus Steinberg. Suggested file: TauCeti/RepresentationTheory/Smooth/InertialTypes.lean. Planets: Inertial type; Monodromy dominance; Type multiplicity one.

Items: N56, N57, N58, N59, N60, N61.

### 5. LocalGaloisDeformationRings

L7 owns arbitrary-rank bounded-height Frobenius lattice moduli and their maps to fixed Hodge/inertial-type deformation rings. Add these explicit tame-descent, gauge and residual local-model source obligations there; reserve the true-monodromy polynomial comparison and generic domain theorem for the distinct Part II below. Ordinary lifts use the existing local ordinary infrastructure.

Layers: `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:R08.1`, `LocalGaloisDeformationRings:R08.3`.

Items: N49, N50, N51, N52, N53, N54, N55, K01, K02, K03, K04, K05, K06, K07, K08, K09, K10, K11, K12, K13, K14, K15, K16, K17, K18, K19, K20, K21, K22, K23, K24, K25, K26, K27, K28, K29, K30, K31, K32, K33, K34, K35, K36, K37, K38, K39, K40, K41, K42, K43, K44, P01, P02, P14.

### 6. GeometricSatakeLocalModelsPartII

Reuse the KP18/KPZ26/Kisin–Zhou integral local-model proposal for the underlying universal loop spaces, Schubert varieties and coordinates. Differential equations and Galois comparison are not part of this base-geometry route.

Reuse GeometricSatakeLocalModelsPartII and its integral Pappas–Zhu base geometry. Add LLHLM23 universal GLn Iwahori over Spec Z[v], completed positive/full/negative loop functors, fpqc Grassmannian, determinant/height bounds, affine-element charts, square-zero Lie splitting and the explicit finite-type chart equations. Retain the functorial Noetherian/completeness assumptions and distinguish sheaf quotients from quotients of R-points. Prove formal etaleness, bounded open immersions, global Schubert orbit projections and the reduced admissible special fibre of the underlying PZ model. These import the affine Weyl owner and ReductiveGroupsPartII parahoric group schemes; no differential local model is automatically reduced. In Proposition3.2.8 allow empty nonpivot coefficient ranges, correcting the printed all-entry nonemptiness assertion. Test n=2, z=1, h=0: the identity matrix exists despite empty off-diagonal ranges. Suggested file: TauCeti/Geometry/LocalModels/UniversalIwahoriCharts.lean. Planets: Universal Iwahori; Negative-loop chart; Pappas–Zhu local model.

Items: U01, U02, U03, U04, U05, U06, U07, U09, U10, U11, U12, U13, U14, U17, M01, M12, M13, M14, M15, M16, M17.

### 7. SchemeAndStackFoundations

Reuse the general deformation/birational, descent and cycle owners for Artinian point criteria, normalization, contraction, generic spreading, Elkik approximation and generic-point-length cycles. The source is a set of precise additional obligations, not a claim that the broad roadmap has already decomposed their proofs.

Layers: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`.

Items: U08, U24, U26, U29, U32, U33, U34, U35, U36, U37, U38, G14, G19, G20, B07, Z03, Z04, Z05, Z06, Z07.

### 8. DeformationAndDerivedPatchingAlgebra

Complete local coefficient tensors, depth, support and patching algebra are shared infrastructure. U43 now imports the original KWII theorem and its domain-only complete-DVR adapter, Z11–Z12. The affinoid completed product has its own AdicSpacesPartII route. Exact supplier contracts remain open.

Layers: `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `DeformationAndDerivedPatchingAlgebra:R03.6`.

Items: U42, U43, P03, Z11, Z12.

### 9. WeightZeroCrystallineLiftingRings

Reuse the Emerton–Gee foundational portion already required by the weight-zero lifting candidate; do not introduce a second representation stack or component labelling.

Reuse WeightZeroCrystallineLiftingRings from PAPER-BOXER-CALEGARI-GEE-ETAL-25. Its common initial stages own the Noetherian formal stack of etale (phi,Gamma)-modules, algebraic reduced stack, crystalline and potentially crystalline closed formal substacks, versal framed deformation rings, component dimensions and Serre-weight labelling. LLHLM23 consumes those stages before any weight-zero generic-reducedness or automorphy endpoint, so no dependency cycle is introduced. Use Emerton–Gee arXiv:1908.07185v4 with the current author errata: E contains K, universal unramified Frobenius coefficient has prescribed norm, boundary characters require unramified twists, and Theorem5.5.12 uses the replacement induction. Theorem6.5.1 gives component dimension [K:Qp]n(n-1)/2; regular Hodge stacks have total dimension one plus that. Translate the dual/det^(n-1) Serre labels and the opposite Hodge sign used by LLHLM23. Import SchemeAndStackFoundations, FiniteFlatGroupsAndIntegralPadicHodgeTheory and LocalGaloisDeformationRings L7. Suggested file: TauCeti/NumberTheory/Galois/EmertonGee/Components.lean. Planets: Galois representation stack; Serre-labelled component; Crystalline versal ring.

Items: G12, G13, G15, G16, G32.

### 10. CompletedCohomologyAndLocalGlobalCompatibilityPartIIPatchedGLdDensity

Reuse the CEGGPS all-rank patching candidate. The extra source obligation is the exact weak/detectable/minimal functor interface and arbitrary away-from-p-level construction, not another abstract patching roadmap.

Reuse CompletedCohomologyAndLocalGlobalCompatibilityPartIIPatchedGLdDensity and its CEGGPS construction. Add LLHLM23 Definition6.2.1 as distinct interfaces: nonzero exact weak functor with maximal Cohen–Macaulay type evaluations, weak minimal rank at most one, potentially diagonalizable, detectable on obvious weights, and minimal rank exactly one for a specified type set. Prove Propositions6.2.3–6.2.9 before using generic domain geometry to upgrade weak minimality. Add AppendixA construction for arbitrary away-from-p level: polarized deformation data, adequate auxiliary primes, diamond groups, projectors, ultrafilter modules, exact Pontryagin-dual functor and the support theorem. Keep g=q-[F+:Q]n(n-1)/2. Import GlobalGaloisDeformations G7, DeformationAndDerivedPatchingAlgebra R03.1/R03.3/R03.5/R03.6, PotentialAutomorphyInfrastructure PA.4 and CompletedCohomologyPartII CC.1–CC.3/CC.8. Share these pre-lattice functor stages with GenericGL3SerreWeightsAndLattices. Exactness and MCM do not imply rank one; minimality and detectability remain explicit. Suggested file: TauCeti/NumberTheory/Automorphy/PatchingFunctors.lean. Planets: Weak patching functor; Detectability; Arbitrary-level patching.

Items: P04, P05, P06, P07, P08, P09, P10, P11, P12, P13, P15, P16, A01, A02, A03, A04, A16, A17, A18, A19, A20, A21, A22, A23, A24.

### 11. GlobalGaloisDeformations

The polarized group, local conditions, Selmer tangent complex, framed global ring and adequate Taylor–Wiles primes are already the direction of G7 and the specified deformation layers. This source adds the exact fixed-multiplier tangent and generator formulas, with corrections E22–E24.

Layers: `GlobalGaloisDeformations:R04.1`, `GlobalGaloisDeformations:R04.2`, `GlobalGaloisDeformations:R04.3`, `GlobalGaloisDeformations:R04.5`, `GlobalGaloisDeformations:G7`.

Items: A05, A06, A07, A08, A09, A10, A11, A12, A13, A14, A15.

### 12. PolarizedAutomorphyLifting

Reuse the polarized definite-unitary automorphy-lifting candidate from Boxer–Calegari–Gee, Fakhruddin–Khare–Patrikis and Newton–Thorne. Add the polynomial-generic domain specialization, rather than creating another automorphy endpoint.

Reuse PolarizedAutomorphyLifting. Add LLHLM23 Theorem9.2.1 with every standing CM, split-at-p and unramified-at-p assumption: a finitely ramified polarized lift r, regular potentially crystalline local type (lambda+eta,tau), polynomial-generic tame tau, semisimple residual restrictions at p, adequate residual image over F(zeta_p), zeta_p not in the adjoint fixed field, and a residual RACSDC automorphic lift with matching weight and K-types. The conclusion is automorphy of r with the specified weight and type. The genericity polynomial depends on the weight bounds and coefficient ramification, not on p. Import LocalGaloisDeformationRingsPartIIMonodromyModels for domain-or-zero versal rings at semisimple points and the all-rank CEGGPS patching candidate for support. Prove Remark9.2.2 only after the generic Serre-weight theorem supplies change of weight; do not make that weaker initial-weight hypothesis part of the first theorem. Preserve existing Thorne/BLGGT targets and normalization adapters. Suggested file: TauCeti/NumberTheory/Automorphy/GenericLocalDomains.lean. Planets: Generic local domain; Polarized modularity lifting.

Items: V12, V13.

### 13. GenericGL3SerreWeightsAndLattices

Reuse and broaden the pre-lattice common stages of the LLHLM20 candidate to the all-rank generic Breuil–Mezard/Serre theory. Keep its specialized GL3 integral-lattice endpoint separate; the legacy candidate id does not restrict the shared foundation to rank three.

Reuse GenericGL3SerreWeightsAndLattices from LLHLM20, broadening its common pre-lattice foundation to LLHLM23 §§8–9 in arbitrary rank; retain its rank-three lattice conclusions with their own stronger hypotheses. Import finite-group constituents and covering from ModularRepresentationsOfFiniteReductiveGroups, representation stack components from WeightZeroCrystallineLiftingRings, local monodromy comparisons from LocalGaloisDeformationRingsPartIIMonodromyModels, generic-point-length cycles from SchemeAndStackFoundations SF.5, and the exact weak/minimal functors from the existing all-rank CEGGPS patching candidate. Build geometric and versal BM interfaces, component-meeting testing sets, irrelevant weights, relative spanning systems, truncation idempotents, rational inversion and effectivity descent. Theorem8.3.5 needs rank-one minimal patching and component-meeting points. Theorem8.4.10 gives canonical supported generic cycles via semisimple pullbacks; polynomial-type equations alone have uniqueness only in the stronger Proposition8.6.5 range. Corollary8.5.2 allows wild residual representations with sufficiently generic semisimplification, and virtual tame WD types with signed coefficients; it does not extend the tame domain theorem. For finite Lambda containing zero retain all shifted polynomial and depth bounds. Prove the unit leading coefficient, triangular integral basis and the corrected defect recursion excluding the target weight. Finally prove Theorem9.1.6 for automorphic residual definite-unitary data, F+ not Q, p not dividing 2n, split unramified p-places, adequate image over F(zeta_p), and tame polynomial-generic local parameters, allowing arbitrary away-from-p level. Separate general conjectures from these proved cases. Order common patching and generic BM before GL3 lattice consumers to avoid a globalization/lattice cycle. Suggested files: TauCeti/NumberTheory/Galois/GenericBreuilMezard.lean and TauCeti/NumberTheory/Automorphy/GenericSerreWeights.lean. Planets: Breuil–Mézard cycle; Minimal patching; Generic Serre weights; Defect recursion.

Items: B01, B02, B03, B04, B05, B06, B08, B09, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19, B20, B21, B22, B23, B24, B25, B26, B27, B28, B29, B30, B31, B32, B33, B34, B35, B36, B37, V01, V02, V03, V04, V05, V06, V07, V08, V09, V10, V11.

### 14. LocalGaloisDeformationRingsPartIIMonodromyModels

L7 supplies bounded-height lattices and fixed-type rings; the new theorem family is the comparison with differential local models, their generic unibranchness, component geometry and true-monodromy approximation. This differs from the existing unrestricted-ring normality and rank-two Barsotti–Tate candidates.

Build on LocalGaloisDeformationRings L7, importing its bounded-height Kisin stacks, tame descent, gauge bases and fixed-type lifting rings. Import integral PZ/loop geometry from GeometricSatakeLocalModelsPartII, affine admissibility from RootSystemsPartIIDominanceAndDemazure, modular finite-group theory from ModularRepresentationsOfFiniteReductiveGroups, scheme normalization/Elkik lemmas from SchemeAndStackFoundations, completed-tensor algebra from DeformationAndDerivedPatchingAlgebra and the common Emerton–Gee foundation from WeightZeroCrystallineLiftingRings. Construct the universal differential locus, naive intersections and flat closures separately. Prove flag generic fibres, contracting chart actions, spreading of normality and product unibranchness with the ramification-index bound; give the Type A affine Springer fixed-point input its own source-bound leaf. Develop residual differential cells, intrinsic C_(w,omega), Serre labels and torus lifts with all genericity bounds, including the corrected Theorem4.6.2 bound max(2n,h_lambda+n-1). Construct analytic monodromy, the convergent recurrence, true flat-closure ideal and basis-dependent truncated ideal; prove the precision containment before Elkik comparison. The exact endpoint is Theorem7.3.2 for regular lambda_j in [0,h]^n and unramified local fields: numerical N_sing gives a noncanonical closed immersion, and a nonzero integral polynomial depending on the Hodge set and coefficient ramification gives the completed regular chart isomorphism and domain-or-zero versal rings at semisimple residual points. Do not claim global canonical gluing or wild-point domains. Prove Theorem7.4.2 component support under max{2(h+1),4n+h}-depth and Proposition7.4.7 with its separate fixed-point polynomial hypothesis. Include the rank-three AppendixB chart, localized equations, normalization and dense branching locus as concrete tests; uniform CAS identities need certificates. Suggested files: TauCeti/NumberTheory/Galois/LocalModels/Differential.lean, Monodromy.lean and GenericComparison.lean. Planets: Differential local model; True monodromy; Generic local-model comparison; Serre-labelled component; Rank-three normalization.

Items: U15, U16, U18, U19, U20, U21, U22, U23, U25, U27, U28, U30, U31, U39, U40, U41, M02, M03, M04, M05, M06, M07, M08, M09, M11, M18, M19, M20, M21, M22, M23, M24, M25, M26, M27, M28, M29, M30, M31, M32, M33, M34, M35, M36, M37, G01, G02, G03, G04, G05, G06, G07, G08, G09, G10, G11, G17, G18, G21, G22, G23, G24, G25, G26, G27, G28, G29, G30, G31, G33, G34, G35, G36, G37, Q01, Q02, Q03, Q04, Q05, Q06, Q07, Q08, Q09, Q10, Q11, Q12, Z01, Z02.

### 15. AdicSpacesPartII

The affinoid completed-tensor, rational-fiber and regular-product interfaces belong to the existing analytic product owner. They differ from complete local coefficient tensors in R03.1. Import the upstream AdicSpaces carrier; add the precise missing product statements, preserving finite-extension geometric connectedness and the regularity supplied by smooth generic charts.

Layers: AdicSpacesPartII:R0, AdicSpacesPartII:F0.

Items: Z08, Z09, Z10, Z13, Z14.

## Recorded source findings

These findings await independent review. Their full locator, quotation/formula, correction, evidence, scope and correction-search record are in `sourceIssues`. An existing correct formulation is distinguished from an erratum of the present paper.

### E1 — misprint (a stated result)

Published PDF33, following Definition 2.1.9; arXiv v2 PDF24

Printed: `"isomorphism" of partially ordered groups, with (t_nu w)^*=w^-1 t_nu.`

Use an order-preserving anti-isomorphism; equivalently a group isomorphism into the opposite group, with (xy)^*=y^*x^*.

For GL2, s=(12), nu=(1,0), (t_nu s)^*=t_(0,1)s whereas (t_nu)^*s^*=t_(1,0)s. Exact integer semidirect-product computation verifies the reversed-product law on 2500 pairs. The cited 2019 source explicitly calls the map an antihomomorphism and proves order preservation.

Known correction: Correct formulation already in Le–Le Hung–Levin, Weight elimination in Serre-type conjectures, Definition2.1.2 and Lemma2.1.3, published PDF8/printed2440, https://math.rice.edu/~bl70/WEpaper.pdf

### E2 — misprint (a stated result)

Published PDF38, Lemma2.2.4; arXiv v2 PDF28

Printed: `w1 t_omega modulo W_a.`

Use the coset of t_(omega-eta) w1, as prescribed by (2.7); the missing eta shift is essential.

GL2 over F7, w1=1, omega=(3,0) yields F(omega-eta)=F(2,0), of central exponent2 modulo6. The printed coset gives3. The earlier formula (2.7) gives2.

Known correction: new

### E3 — misprint (a stated result)

Published PDF47 Remark2.4.2, residual determinant formula; PDF48 Lemma2.4.4 residual paragraph; arXiv v2 PDF35

Printed: `(zeta-eta|_Z) composed with baromega_1.`

In the residual compatibility formula use zeta+eta|_Z. Keep the different E-valued and F-valued compatibility definitions themselves.

For GL2/F7, s=1, mu=(2,0), eta=(1,0), the 1-generic residual type has inertia diag(baromega_1^3,1). Its determinant exponent is3; zeta=2, so the printed minus gives1.

Known correction: new

### E4 — error (a stated result)

Published PDF53 Proposition2.6.4; arXiv v2 PDF38

Printed: `W?(rhobar) intersect JH(barsigma(tau)).`

The left side must be W?(rhobar) intersect JH(barsigma(tau) tensor W(lambda)). Keep the right-hand presentation criterion.

GL2/F11, eta=(1,0), lambda=(1,1), w(tau)=t_(5,0), w(rhobar)=t_(7,1), w=w1=1, w2=w_h t_(-1,-1), omega=(7,1). Both presentations are2-generic and lambda-compatible, and the right-side equalities and arrow relations hold. The printed left side is empty by central characters7 versus5 modulo10; tensoring by det changes5 to7. The proof and both subsequent corollaries use precisely that tensor.

Known correction: new

### E5 — misprint (the proof)

Published PDF53 Corollary2.6.5 proof; arXiv v2 PDF38

Printed: `w=w2.`

The equality forced in this step is w=w1; w2=t_(-w0 lambda) w_h w.

The witnesses in E4 have w=w1=1 but w2=t_(-1,-2)s, which is not1. The corrected equality gives the obvious-weight criterion needed for the conclusion.

Known correction: new

### E6 — misprint (the proof)

Published PDF32 Proposition2.1.6 proof, first paragraph

Printed: `w2^-1 w0 w1 <= t_(barw1^-1 eta).`

Replace eta on this symmetric upper bound by lambda+eta.

The statement contains both lambda+eta bounds. The preceding nonsymmetric bound has lambda+eta, and applying the stated symmetric argument cannot discard lambda.

Known correction: new

### E7 — error (a stated result)

Published PDF60, sentence after Proposition3.2.8

Printed: `h+nu_j-[i>j]-[i<w(j)] >= 0 for all i,j as a necessary nonemptiness condition.`

Allow empty nonpivot coefficient ranges. Require only each pivot to occur: h+nu_j-[w(j)>j]>=0 for all j; these also give the distinguished point at t=0.

For n=2,w=1,nu=0,h=0, A=I satisfies the chart equations and determinant condition. Both off-diagonal coefficient ranges are empty and their upper bounds are-1. The printed necessary condition rejects this existing chart.

Known correction: new

### E8 — misprint (the proof)

Published PDF72 Lemma3.4.7 proof, coordinate expansion

Printed: `N(nu_j-[i>j]-k)+mu_i-mu_w(j).`

For the displayed one-parameter subgroup the coefficient weight is N(nu_j-[i>j]-k)+mu_w(j)-mu_i. Reverse both mu signs in the expansion and ensuing discussion.

Substitute the chosen D=Ad(w^-1)(r^mu) into Lemma3.4.6: the left diagonal factor is r^-mu_i and the right factor is r^mu_w(j). For n2,w1,nu0,mu(1,0),N2, i2,j1,k-1 the actual weight is+1, while the printed weight is-1. Corrected weights contract every nonpivot coordinate.

Known correction: new

### E9 — error (a stated result)

Published PDF70 Remark3.4.3(2)

Printed: `Y Noetherian and excellent: unibranch at y iff completed local ring is a domain.`

Require the local ring to be reduced, or apply the domain assertion to the completion of its reduction. For excellent local rings the branch-count result alone does not supply reducedness.

The excellent ring k[epsilon]/epsilon^2 is unibranch by Definition3.4.2 but is already complete and is not a domain. The intended local models here are integral/reduced. Stacks Tag0C2E, Lemma15.110.8, read on2026-09-23, preserves branch counts rather than eliminating nilpotents.

Known correction: new

### E10 — gap (the proof)

Published PDF76 Proposition3.5.2 proof, lifting to U3

Printed: `Spec R -> U3 is obtained from completeness of R.`

First pass, if necessary, to a finite unramified faithfully flat complete DVR extension giving a residue-field point of the étale cover, then use the henselian lifting property and descend flatness/normality.

The finite étale cover Z3[x]/(x^2+1) of Spec Z3 has no Z3-point, since x^2+1 has no zero modulo3. Completeness does not create the missing residue-field point. This is a proof gap, not a counterexample to the proposition.

Known correction: new

### E11 — misprint (the proof)

Published PDF74 Lemma3.5.8, statement and proof opening

Printed: `f:Spec R -> U; M_R=M times_(X times S,f) (X times U).`

Use f:Spec R -> X times U and M_R=M times_(X times S) Spec R. In the proof, shrink the parameter base S to obtain geometric normality of its fibers, as in Lemma3.5.7.

U is an étale S-scheme and does not carry the required chosen value of v from X. The printed fiber product is not over Spec R and therefore cannot have the asserted property of the DVR specialization.

Known correction: new

### E12 — misprint (the proof)

Published PDF61 Lemma3.3.1 proof

Printed: `h(v g' g^-1+g D g^-1); dh/dv in L^+M.`

Append h^-1 to the displayed conjugated summand and use v dh/dv in L^+M for the integral derivative term.

Leibniz gives v(hg)'(hg)^-1=v h'h^-1+Ad(h)(v g'g^-1). For h=I+v E21, h'=E21 is not in the lower-v-divisible Iwahori Lie module, but v h' is.

Known correction: new

### E13 — misprint (a stated result)

Published PDF85 Corollary4.2.12

Printed: `degree d_{alpha,w}.`

The coefficient polynomial has degree at most d_{alpha,w}, with the stated zero convention for negative bounds.

The identity element gives the zero coefficient polynomial even for a nonnegative bound, and a nonleading coordinate may vanish. The preceding paragraph already introduces degree bounds.

Known correction: new

### E14 — misprint (the proof)

Published PDF92 Theorem4.3.9 proof, first identification of C

Printed: `C_(w1,w2^-1 s(0)).`

Use C_(w1,s w2^-1(0)), matching the statement and final displayed identity.

Proposition4.3.5 moves the right translation to s w2^-1, in that order; affine translations and Weyl factors do not commute. The first identification reverses their order.

Known correction: new

### E15 — error (a stated result)

Published PDF95–96 Theorem4.6.2; arXiv v2 PDF69

Printed: `max{2n,h_lambda}-generic.`

A sufficient repaired hypothesis is max{2n,h_lambda+n-1}-generic. This both makes all component labels (n-1)-deep and meets Theorem4.3.10.

GL2/F19, eta=(1,0), lambda=(6,0), R=R_s(7,0) with s=(12) has a6-generic presentation mu=(6,0), satisfying the printed bound. The admissible pair w1=1,w2=w_h t_(-5,0) maps to omega=(7,6) and sigma=F(6,6)=det^6, which is not1-deep, so C_sigma^zeta is outside Definition4.6.1. For Theorem7.4.2, every regular Hodge tuple in[0,h] has h_lambda<=h, and max{2n,h_lambda+n-1}<=max{2(h+1),4n+h}. The later theorem's stated stronger bound therefore covers this repair directly.

Known correction: new

### E16 — error (a stated result)

Published PDF105 Lemma5.1.10(c)

Printed: `Y upper triangular modulo v implies Ad(s_j^-1 v^(mu_j+eta_j))(Y) in v^(m+1) Mat_n(R[[v]]).`

Require Y strictly upper triangular modulo v, and apply the adjoint operator to phi(Y). This is the Lie(I_1) analogue of part(a), the version used in Proposition5.2.7.

Y=I satisfies the printed hypothesis and is fixed by conjugation, contradicting the conclusion for m>=0. Strictness alone is insufficient: Y=v E21 can lose valuation under conjugation. Frobenius changes v to v^p, supplying the missing valuation bound.

Known correction: new

### E17 — misprint (the proof)

Published PDF109 Lemma5.2.2 uniqueness proof

Printed: `I_j=A1_j Ad(z_j)(phi(I_(j-1))^-1) A1_j^-1.`

Remove the inverse on phi(I_(j-1)) in this rearranged fixed-point equation and in the subsequent equalities.

PDF108 defines X_j=I_j A1_j Ad(z_j)(phi(I_(j-1))^-1) A1_j^-1. With X=1, solving for I_j gives A1_j Ad(z_j)(phi(I_(j-1))) A1_j^-1. The same contraction proves uniqueness after the repair.

Known correction: new

### E18 — misprint (the proof)

Published PDF112 Proposition5.2.7 proof, description of Lie I1(J)

Printed: `"unipotent upper triangular" modulo v.`

Use strictly upper triangular (nilpotent upper triangular) reduction, including zero diagonal.

A Lie module is an additive module containing zero; a matrix with diagonal ones cannot specify its elements. Linearizing the defining I1 congruence gives strictly upper triangular matrices, agreeing with corrected Lemma5.1.10(c).

Known correction: new

### E19 — error (a stated result)

Published PDF122 opening of §5.5

Printed: `rhobar tame, i.e. rhobar=rhobar^ss.`

Semisimple residual representations are tame; the converse is false in general. Retain explicit semisimplicity where used, or prove the additional generic multiplicity-free inertia condition makes a tame representation semisimple.

The unramified two-dimensional representation with Frobenius [[1,1],[0,1]] over F_p has trivial inertia, hence is tame, but is not semisimple. Later domain statements are proved at semisimple points; generic tame applications need the elementary distinct-inertia-character argument.

Known correction: new

### E20 — misprint (the proof)

Published PDF130 Lemma6.2.8 proof

Printed: `Hodge–Tate weights "increase along the diagonal".`

Under this paper's convention HT(epsilon)=+1, the displayed diagonal characters have weights n-i, hence decrease. Translate the sign when invoking Berger's convention.

The finite-order Teichmüller factors have Hodge–Tate weight0 and chi_i contains epsilon^(n-i). For n2 the successive weights are1,0. The actual lifted characters and conclusion need no reversal.

Known correction: new

### E21 — misprint (the proof)

Published PDF179 equation(8.3)

Printed: `sum_{kappa in W?(rho) intersect JH(barsigma(tau))} [barsigma(tau):kappa] Z_kappa(rho)^gen.`

Exclude kappa=sigma from this subtracted sum.

Exactness gives Z_tau=sum_kappa m_kappa Z_kappa. Isolating m_sigma Z_sigma subtracts only the other terms. As printed the right side is zero and also still depends on the unknown target, defeating the defect induction.

Known correction: new

### E22 — error (a stated result)

Published PDF192 §A.3.3, reduced tangent definition

Printed: `Hom_O(m_A/m_A^2,F) = Hom_C_O(A,F[epsilon]/epsilon^2).`

The relative tangent is Hom_F(m_A/(m_A^2+varpi A),F), or the equivalent relative derivation space.

Take A=O: the printed Hom is one-dimensional because m/m^2 is one-dimensional over F, whereas there is only one O-algebra map O->F[epsilon]/epsilon^2. The base uniformizer must be killed. PropositionA.3.2 already uses an appropriate relative base-ideal quotient.

Known correction: new

### E23 — misprint (a stated result)

Published PDF192 §A.3.3, local lifting tangent identification

Printed: `D^square_rhobar(F[epsilon]/epsilon^2) = C^1(G_L,ad rhobar).`

Use continuous 1-cocycles, Z^1, for framed first-order liftings. For the unrestricted G_n lifting functor the coefficient module is Lie(G_n); ad rhobar on gl_n is the fixed-multiplier version.

Writing a lift as (1+epsilon c(g))rhobar(g), multiplicativity is exactly c(gh)=c(g)+g c(h), not an arbitrary cochain. The following displayed cochain complex uses C^i in its ordinary cochain sense. The distinction between the gl_n adjoint and full Lie(G_n)=gl_n direct-sum gl_1 is stated at the top of the page.

Known correction: new

### E24 — misprint (the proof)

Published PDF199 §A.5, definition of g

Printed: `g=q-[F:Q]n(n-1)/2.`

For T=S use g=q-[F+:Q]n(n-1)/2, as in PropositionA.3.3.

The sum of local degrees [F_v+:Q_p] over p-adic places of F+ is [F+:Q], whereas [F:Q]=2[F+:Q] for the CM extension. The printed number removes twice the required local term, so the cited presentation bound does not justify the claimed surjections. Restoring F+ restores the ensuing balanced-dimension count.

Known correction: new

### E25 — misprint (the proof)

Published PDF205 AppendixB, exception after the Groebner-basis list

Printed: `(a-b)((a-1)-1)=0.`

The exceptional coefficient vanishes when (a-b)(a-1)-1=0.

The coefficient in the eighth displayed polynomial is b((a-b)(a-1)-1), and b is a unit on V. Over F11 take a=3,b=8: every factor defining V is nonzero, the actual coefficient vanishes because (a-b)(a-1)=1, whereas the printed exceptional expression equals6 and is nonzero.

Known correction: new

### E26 — gap (a stated result)

Published PDF208 CorollaryB.0.5, claimed sufficient polynomial

Printed: `P(X,Y,Z)=product_{m=0}^{10}(X-Y-m)(Y-Z-m)(Z-X-m) for the parameter mu.`

State the verified conclusion with the explicit 10-depth hypothesis. To encode that hypothesis by raw-weight polynomial nonvanishing, evaluate a wall-avoidance polynomial at mu+eta, or shift its arguments by eta. The displayed unshifted polynomial does not imply the required depth.

Definition2.1.10(4) evaluates polynomial genericity on the raw tuple. At p101, mu=(90,30,0) has mu+eta=(92,31,0), so all positive differences lie strictly between5 and96 and the presentation is5-generic, but the highest difference92 violates10-depth. The cyclic differences of raw mu are60,30,11 modulo101, making every displayed factor nonzero. This shows a gap in the claimed sufficient polynomial, not a counterexample to the local comparison with the explicit10-depth hypothesis.

Known correction: new

### E27 — misprint (a stated result)

Cited [59], Shapes and shadows (2018), published PDF23–24 §2.3; corrected in LLHLM23 PDF121 §5.5

Printed: `V*(M)=Hom_phi(M,O_E^un,K).`

For finite projective coefficient families use the coefficient-compatible completed base change and then R-linear dual of Frobenius invariants as in LLHLM23 §5.5. The target and completion must retain R.

The 2018 formula lacks the coefficient algebra and completion in its target; it cannot give the claimed rank-n R-representation functor for arbitrary complete local coefficients as written. The current paper explicitly flags that formula as inaccurate and supplies its corrected family version.

Known correction: LLHLM23 §5.5, published PDF121, https://math.rice.edu/~bl70/LocModels.pdf

### E28 — gap (the proof)

Cited input [22], Emerton–Gee, arXiv:1908.07185v4 Theorem5.5.12, PDF163–167; author errata PDF2–9. Used by LLHLM23 §7.4 PDF155–156.

Printed: `"if we produce closed algebraic substacks" whose points "exhaust" those of X_d,red (start of the original proof).`

Use the authors' replacement induction in the current errata. It proves exhaustion, refines the maximally nonsplit locus and its extension-class conditions, and keeps any forward invocation of Theorem6.5.1 in smaller rank. Also impose the corrected coefficient-field and unramified-character conventions on the stack input.

The authors explicitly state that the original constructions were not shown to cover all residual points; the errata supplies a complete replacement proof and explains how to avoid circular dependence on Theorem6.5.1. This affects the proof imported for the Serre-labelled components, not a counterexample to that theorem.

Known correction: Emerton–Gee, Moduli stacks of (phi,Gamma)-modules: errata, https://www.ma.imperial.ac.uk/~tsg/Index_files/moduli-errata.pdf (all nine pages read 2026-09-23).

### E29 — misprint (the proof)

Cited input [1], Boixeda Alvarez arXiv:1910.04780v3, AppendixB.3 PDF9, displayed intersection criterion (PDF image inspected).

Printed: `The displayed lattice intersection is required to be nonzero: "!=0".`

Require the intersection to be zero. Nonemptiness refers to the intersection of the component chart with the attracting open Uy; its lattice transversality condition is a zero vector-space intersection.

LemmaB.1 PDF7 defines the attracting open by zero intersections; PDF11 explicitly describes the required lattice intersection as trivial and the corresponding determinant as nonsingular. The display in PDF9 reverses that condition.

Known correction: The intended zero-intersection criterion is already explicit in the same preprint, LemmaB.1 PDF7 and AppendixB.3 PDF11; no separate correction located.

### E30 — misprint (the proof)

Cited input [1], Boixeda Alvarez arXiv:1910.04780v3, LemmaB.2 PDF8, formula for c-prime (PDF image inspected).

Printed: `Denominator of each factor is s_1-s_(i_(l+1)).`

Use s_(i_1)-s_(i_(l+1)); the first eigenvalue index is the start of the increasing path, not the constant1.

For a length-two path i_1=2,i_2=3, the matrix has coefficient1 at A32, so its inverse must have coefficient-1. The printed coefficient is -(s2-s3)/(s1-s3), unequal for distinct s1,s2,s3, while the corrected formula gives-1. The longer-path corrected formula follows the standard unitriangular inverse recursion; that recursion remains a proof leaf of the imported matrix construction.

Known correction: new

### E31 — misprint (the proof)

Cited input [1], Boixeda Alvarez arXiv:1910.04780v3 AppendixB.5, PDF16–17.

Printed: `The first sentence of PDF17 removes the "first row and the first column".`

Remove the first row and the last column from the displayed matrix on PDF16, up to the cofactor sign; alternatively explicitly permute the final column to the first position before expansion.

The first row of the preceding matrix is (0,...,0,1). Laplace expansion therefore uses its last column. The following displayed smaller matrix is the one obtained from that last-column cofactor. This is a proof-display indexing slip, not a failure of determinant nonvanishing.

Known correction: The following reduced matrix in the same PDF17 already uses the intended cofactor; no separate correction located.

### E32 — misprint (the proof)

Published PDF142, proof of Theorem7.2.2; bibliography PDF210.

Printed: `[23, Theorem4.8.12], [23, Proposition4.8.10], [23, Theorem4.8.14].`

Replace [23] by [22] in these three references.

The paragraph introduces properties established in[22]. The cited numbered results were read in Emerton–Gee arXiv:1908.07185v4 PDF126–129 and give exactly the asserted crystalline-stack construction, versal rings and dimension. Reference[23] is the different 2014 geometric BM paper.

Known correction: Correct source is Emerton–Gee, Moduli stacks of etale(phi,Gamma)-modules and the existence of crystalline lifts, arXiv:1908.07185v4, PDF126–129.

### E33 — misprint (a stated result)

Published PDF195 definition of D_rho^(lambda,tau), used in TheoremA.4.1 PDF196–197; compare§6.1.1 PDF126 and§6.2 PDF127.

Printed: `The local condition for coefficient highest weight lambda is defined using R_rho^(lambda,tau).`

Use Hodge weight lambda+eta. Independently, for a general WD type use the monodromy-dominated quotient as in E34, so the condition is D_rho^(lambda+eta,<=tau).

§6.1.1 explicitly makes the superscript the Hodge type. §6.2 defines sigma(lambda,tau)=V(lambda) tensor sigma(tau) and the associated patched ring using R^(lambda+eta,<=tau). TheoremA.4.1 uses a lattice in the dual of precisely that coefficient type. Already trivial algebraic weight in rank2 corresponds to Hodge weights(1,0), not(0,0). The correction is needed for AppendixA to verify its claimed weak patching axioms.

Known correction: new

### E34 — error (a stated result)

Published PDF195 local deformation condition, TheoremA.4.1 PDF196–197; compare Theorem2.5.4 PDF50.

Printed: `The local condition uses the exact WD type quotient R_rho^(lambda,tau) for an arbitrary Weil–Deligne inertial type tau.`

Use the quotient with WD monodromy <=tau, and the Hodge shift in E33: R_rho^(lambda+eta,<=tau). It coincides with exact type when tau has zero monodromy; equality for arbitrary tau is not implied by occurrence of sigma(tau).

Theorem2.5.4(1) only gives rec(pi)|I<=tau. Its generic converse permits strict inequality: a generic unramified principal series has zero monodromy yet contains sigma(tau_max) for the maximal monodromy type with the same scalar inertia. Thus a K-type cannot impose the printed exact type. The weaker support condition is exactly the one in Definition6.2.1 and the conclusion used in the proof of LemmaA.1.1.

Known correction: new

### E35 — misprint (adjacent source; no mathematical change)

[Elkik (1973)](https://numdam.org/item/10.24033/asens.1258.pdf), printed556/PDF5, last paragraph of the Lemma1 proof: “on peut déduire de (5)” should refer to identity **(4)**. The source has just announced the conductor-weighted Jacobian correction (4), and combines it over the expression for the power of the parameter. Display (5), on the following page, instead gives the conductor relations used to establish that correction. The original rendered page was checked. The Numdam record and an erratum/correction search found no correction of this reference. This is a proposed finding awaiting independent review, not a claim of priority.

## Reproducing the arithmetic regressions

The following uses only Python's standard library.

```python
"""Exact small arithmetic checks for LLHLM23 source corrections; no Lean claim."""
from fractions import Fraction
from itertools import permutations

identity = ((0, 0), (0, 1))

def action(p, v):
    # A permutation acts by permuting basis vectors, hence inverse on coordinates.
    out = [0] * len(p)
    for i, j in enumerate(p):
        out[j] = v[i]
    return tuple(out)

def mul(g, h):
    a, p = g
    b, q = h
    pb = action(p, b)
    return tuple(x+y for x,y in zip(a,pb)), tuple(p[q[i]] for i in range(len(p)))

def inv(g):
    a, p = g
    q = tuple(p.index(i) for i in range(len(p)))
    return action(q, tuple(-x for x in a)), q

def apply(g, x):
    a,p = g
    return tuple(b+c for b,c in zip(a,action(p,x)))

def star(g):
    a,p = g
    q = tuple(p.index(i) for i in range(len(p)))
    return action(q,a),q

trans = lambda a: (tuple(a), (0,1))
s = ((0,0),(1,0))
a = trans((1,0))
assert star(mul(a,s)) != mul(star(a),star(s))
samples=[((i,j),p) for i in range(-2,3) for j in range(-2,3) for p in permutations(range(2))]
assert all(star(mul(g,h)) == mul(star(h),star(g)) for g in samples for h in samples)
print('E1: 2500 reversed-product checks; explicit ordinary-product counterexample passed')

eta=(1,0)
omega=(3,0)
assert (sum(omega)-sum(eta)) % 6 == 2
assert sum(omega) % 6 == 3
print('E2: F7 central exponents are 2 (correct) and 3 (printed)')

mu=(2,0)
assert (sum(mu)+sum(eta)) % 6 == 3
assert (sum(mu)-sum(eta)) % 6 == 1
assert 1 < (mu[0]+eta[0])-(mu[1]+eta[1]) < 7-1
print('E3: 1-generic F7 inertia determinant has exponent 3, not 1')

lam=(1,1)
tau=trans((5,0))
rho=trans((7,1))
wh=mul(s,trans((-1,0)))
w=identity
w1=identity
w2=mul(wh,trans((-1,-1)))
assert apply(w2,(Fraction(1,2),0))[0]-apply(w2,(Fraction(1,2),0))[1] == Fraction(1,2)
assert mul(mul(trans(lam),inv(wh)),w2) == w
assert apply(mul(rho,inv(w1)),(0,0)) == apply(mul(tau,inv(w2)),(0,0)) == (7,1)
assert mul(inv(tau),rho) == trans((2,1))
assert all(2 < abs(v[0]-v[1]) < 11-2 for v in [(5,0),(7,1)])
assert sum((6,1)) == sum(lam)+sum((5,0))
assert (sum((7,1))-sum(eta))%10 == 7
assert sum((5,0))%10 == 5
assert (sum((5,0))+sum(lam))%10 == 7
assert w == w1 and w != w2
print('E4–E5: genericity, compatibility, affine witnesses, central-character mismatch and corrected index passed')

# Identity chart, nu=0,h=0. Nonpivot intervals are empty, while pivot coefficients are1.
for i in range(2):
    for j in range(2):
        upper = -int(i>j)-int(i<j)
        if i==j:
            assert upper == 0
        else:
            assert upper == -1
print('E7: identity chart exists with empty off-diagonal coefficient ranges; printed all-entry bound fails')

# Special-fibre lower-left coordinate in the identity chart.
mu=(1,0)
N=2
i,j,k=1,0,-1
correct=N*(0-int(i>j)-k)+mu[j]-mu[i]
printed=N*(0-int(i>j)-k)+mu[i]-mu[j]
assert correct==1 and printed==-1
print('E8: actual contraction weight +1; printed expansion weight -1')

# Etale residue extension F9/F3 has no F3-point.
assert all((x*x+1)%3 != 0 for x in range(3))
print('E10: completeness does not lift an etale cover without a residue-field point')

# Theorem4.6.2's printed bound does not ensure Definition4.6.1's domain.
p=19
lam=(6,0)
lambda_minus_eta=(5,0)
mu=(6,0)
nu=(7,0)
bound=max(2*2,lam[0]-lam[1])
assert bound==6 and bound < nu[0]-nu[1] < p-bound
wR=mul(trans(nu),s)
w1=identity
w2=mul(wh,trans((-5,0)))
assert mul(mul(trans(lambda_minus_eta),inv(wh)),w2)==w1
assert apply(w2,(Fraction(1,2),0))[0]-apply(w2,(Fraction(1,2),0))[1] > 0
omega=apply(mul(wR,inv(w2)),(0,0))
assert omega==(7,6)
highest_weight=tuple(x-y for x,y in zip(omega,eta))
assert highest_weight==(6,6)
assert not (1 < omega[0]-omega[1] < p-1)
print('Theorem4.6.2: p19, lambda(6,0), 6-generic R gives F(6,6), which is not1-deep')

# Lemma5.1.10(c): Frobenius is needed even after imposing the Lie(I1) hypothesis.
p,m,d=11,2,5
assert m < d < p-m
assert 1-d < m+1
assert p-d >= m+1
print('E16: lower entry v has valuation -4 after conjugation, but phi(v) has valuation6')

# Nontrivial unramified unipotent Frobenius is tame and not semisimple.
p=5
assert 1 % p != 0 and p % p == 0
# (I+E12)^k=I+k E12 and its minimal polynomial is (X-1)^2.
print('E19: a nontrivial unipotent Frobenius of order5 gives a continuous tame counterexample')

# Appendix B's unit locus and actual exceptional coefficient.
p,a,b=11,3,8
unit_factors=[b,b-1,a-1,a-2,a-b,a-b-1,a-b-2]
assert all(x%p for x in unit_factors)
assert (b*((a-b)*(a-1)-1))%p==0
assert ((a-b)*((a-1)-1))%p==6
print('E25: p11,a3,b8 lies on V and distinguishes the two exceptional loci')

# Raw polynomial genericity in Corollary B.0.5 misses the eta shift.
p=101
mu=(90,30,0)
eta3=(2,1,0)
shifted=tuple(x+y for x,y in zip(mu,eta3))
diffs=[shifted[i]-shifted[j] for i in range(3) for j in range(i+1,3)]
assert all(5 < d < p-5 for d in diffs)
assert not all(10 < d < p-10 for d in diffs)
cyclic=[(mu[i]-mu[(i+1)%3])%p for i in range(3)]
assert cyclic==[60,30,11]
assert all((d-k)%p for d in cyclic for k in range(11))
print('E26: p101,mu(90,30,0) passes the printed polynomial and5-depth, but fails10-depth')

# The repaired bound in E15 is covered by Theorem7.4.2's stronger hypotheses.
from itertools import combinations
checked=0
for n in range(2,6):
    for h in range(n-1,11):
        for asc in combinations(range(h+1),n):
            lam=tuple(reversed(asc))
            alg=tuple(lam[i]-(n-1-i) for i in range(n))
            assert list(alg)==sorted(alg,reverse=True)
            h_alg=max(alg)-min(alg)
            assert h_alg+n-1<=h
            assert max(2*n,max(lam)-min(lam)+n-1)<=max(2*(h+1),4*n+h)
            assert max(2*n,h_alg+n-1)<=max(2*(h+1),4*n+h)
            checked+=1
print('E15 scope:',checked,'regular Hodge tuples verify the downstream bound calculation')
```

## Reproducing the Appendix B generic checks

Run with SymPy 1.14.0 from the repository root. This checks the rational generic parameter field only, as explained above.

```python
import sympy as s,json,pathlib,itertools,time
d=json.loads(pathlib.Path('research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-23.result.json').read_text())['sourceData']['appendixB']
a,beta,t,W=s.symbols('a b t W'); vs=s.symbols('c12 c13 d21 c22 d31 d33'); env={str(x):x for x in [a,beta,t,W,*vs]}; parse=lambda x:s.sympify(x,locals=env)
f=list(map(parse,d['chartEquations']));g=list(map(parse,d['partialNormalizationEquations']))
K=s.QQ.frac_field(a,beta)
for i,ideal in enumerate(d['specialFiberMinimalPrimes']):
 G=s.groebner(list(map(parse,ideal)),*vs,domain=K)
 assert all(G.reduce(x.subs(t,0))[1]==0 for x in f),i
print('7 component ideals contain all three special-fiber equations over Q(a,b)',flush=True)
for i,fibres in enumerate(d['normalizationFiberComponents']):
 for j,ideal in enumerate(fibres):
  G=s.groebner(list(map(parse,ideal)),W,*vs,domain=K)
  remainders=[k for k,x in enumerate(g) if G.reduce(x.subs(t,0))[1]!=0]
  assert remainders == ([5] if (i,j)==(3,0) else []),(i,j,remainders)
print('Table1: ten ambient ideals kill all seven equations; the double-cover row retains exactly its quadratic W relation, over Q(a,b)',flush=True)
# Rational substitution verifies all normalization equations in Frac(R).
G=s.groebner(f,t,*vs,domain=K)
for i,x in enumerate(g):
 q=s.cancel(x.subs(W,-t*env['d21']/env['c22']))
 assert G.reduce(s.fraction(q)[0])[1]==0,i
print('7 normalization relations vanish after W=-t*d21/c22 in Frac(R), over Q(a,b)',flush=True)
J=s.Matrix(f).jacobian(vs)
minors=[s.expand(J[:,list(cols)].det()) for cols in itertools.combinations(range(6),3)]
G=s.groebner(f+minors,t,*vs,domain=K)
assert G.reduce(t**3)[1]==0
print('t^3 lies in the Jacobian ideal in the chart quotient over Q(a,b)',flush=True)
print('These checks do not prove minimality, primality, multiplicities, localized integral ideal membership or all specializations.',flush=True)
```

## Inventory index

Statements and hypotheses are in the JSON. This index is a navigation aid, not a completeness certificate.

| ID | Mathematical item | Source locator |
|---|---|---|
| N01 | Coefficient, root and Frobenius conventions | §1.8.1–2, PDF24–28 |
| N02 | Extended affine Weyl datum | §1.8.1, PDF25–26; §2.1.1 |
| N03 | Length, Bruhat and upper-arrow orders | §2.1.1, PDF29–30 |
| N04 | Reduced products of affine elements | Definition2.1.1, PDF30 |
| N05 | Admissible set | Definition2.1.2, PDF30 |
| N06 | Regular alcoves and regular admissible elements | Definition2.1.3, PDF30 |
| N07 | Opposed dominant factors are reduced | Lemma2.1.4, PDF31 |
| N08 | Regular affine-element factorization | Proposition2.1.5, PDF31 |
| N09 | Converse regularity | Proposition2.1.5, PDF31 |
| N10 | Admissibility and upper-arrow criterion | Proposition2.1.6, PDF31–32 |
| N11 | Admissible pairs | Equation(2.2), PDF32 |
| N12 | Admissible-pair parametrization | Corollary2.1.7, PDF32–33 |
| N13 | Reversed restricted-factor parametrization | Remark2.1.8, PDF33 |
| N14 | Dual affine opposition map | Definition2.1.9 and following assertion, PDF33 |
| N15 | Alcove depth | Definition2.1.10, PDF33 |
| N16 | Affine genericity and smallness | Definition2.1.10, PDF33 |
| N17 | Polynomial genericity | Definition2.1.10(4), PDF34 |
| N18 | Genericity and smallness transport | Proposition2.1.12(1), PDF34 |
| N19 | Smallness under products | Proposition2.1.12(2), PDF34 |
| N20 | Smallness under inversion and opposition | Proposition2.1.12(3), PDF34 |
| N21 | Loss of genericity under a small factor | Proposition2.1.12(4), PDF34 |
| N22 | Integral highest-weight and virtual Weyl modules | §2.2, equation(2.3), PDF34–35 |
| N23 | Serre weights and restricted highest weights | §2.2, PDF35 |
| N24 | Shifted p-alcoves and dot action | §2.2, PDF35 |
| N25 | Constituent depth bound | Lemma2.2.1, PDF35–37 |
| N26 | Dominant translate remains in a Weyl polytope | Lemma2.2.2, PDF36 |
| N27 | Algebraic and finite central characters | §2.2, PDF37 |
| N28 | Lowest-alcove presentation of a Serre weight | Equation(2.5), PDF37 |
| N29 | Compatibility of Serre-weight presentations | Equations(2.6)–(2.7), PDF38 |
| N30 | Central character of a lowest-alcove presentation | Lemma2.2.3, PDF38 |
| N31 | Presentations classified by central lifts | Lemma2.2.4, PDF38, corrected E2 |
| N32 | Deligne–Lusztig representations | §2.3, PDF38–39 |
| N33 | Generic Deligne–Lusztig presentation | Definition2.3.1, PDF39 |
| N34 | Generic Deligne–Lusztig irreducibility | §2.3 after Definition2.3.1, PDF39 |
| N35 | Central compatibility of Deligne–Lusztig presentations | §2.3, PDF39 |
| N36 | Deligne–Lusztig presentations and central lifts | Lemma2.3.2, PDF39 |
| N37 | A bounded presentation for every Deligne–Lusztig representation | Lemma2.3.3, PDF40 |
| N38 | Deep constituents force generic types | Lemma2.3.4, PDF40 |
| N39 | Jantzen constituent criterion | Proposition2.3.6, PDF41 |
| N40 | Admissible-pair parametrization of tensor constituents | Proposition2.3.7, PDF41–42 |
| N41 | Depth and central compatibility of tensor constituents | Proposition2.3.7, PDF41–42 |
| N42 | Constituents by translated Bruhat intervals | Proposition2.3.8, PDF42 |
| N43 | Outer constituents | §2.3.1, PDF42 |
| N44 | Outer constituent controls upper-arrow inequalities | Lemma2.3.9, PDF42–43 |
| N45 | Covering relation on Serre weights | Definition2.3.10, PDF43 |
| N46 | Covering criterion by alcove inequalities | Proposition2.3.12(1)–(2), PDF43–45 |
| N47 | Covering criterion by intervals | Proposition2.3.12(1),(3), PDF43–45 |
| N48 | Covering criterion by algebraic modules | Proposition2.3.12(1),(4), PDF43–45 |
| N49 | Tame inertial L-parameters from Weyl data | §2.4, PDF45–46 |
| N50 | Explicit tame inertia characters for GLn | Example2.4.1, equation(2.12), PDF45–46 |
| N51 | Lowest-alcove presentations and the E/F central shift | §2.4, PDF46–47 |
| N52 | Regular and generic tame types | Definition2.4.3, PDF47–48 |
| N53 | Characteristic-zero types and determinant lifts | Lemma2.4.4, first part, PDF48 |
| N54 | Residual types and determinant lifts | Lemma2.4.4, second part, PDF48, corrected E3 |
| N55 | Changing a diagonal tame presentation | Proposition2.4.5, PDF48 |
| N56 | Weil–Deligne inertial parameter | Definition2.5.1, PDF48–49 |
| N57 | Monodromy dominance on inertial types | Definition2.5.3 and preceding paragraph, PDF49–50 |
| N58 | Occurrence of an inertial type bounds monodromy | Theorem2.5.4(1), PDF50 |
| N59 | Exact inertial type has multiplicity one | Theorem2.5.4(2), PDF50 |
| N60 | Generic representations and dominated monodromy | Theorem2.5.4(3), PDF50 |
| N61 | Tame types are constituents of Deligne–Lusztig representations | Proposition2.5.5, PDF50–51 |
| N62 | Herzig involution and predicted weights | Definition2.6.1 and preceding paragraph, PDF52 |
| N63 | Parametrization of Herzig weights | Proposition2.6.2, PDF52 |
| N64 | Depth and compatibility of Herzig weights | Proposition2.6.2, PDF52 |
| N65 | Obvious Serre weights | Definition2.6.3, PDF52 |
| N66 | Relative position of residual and lifted types | §2.6.1, PDF52–53 |
| N67 | Breuil–Mézard weight-intersection criterion | Proposition2.6.4, PDF53, corrected E4 |
| N68 | Affine factorization of equal weight parameters | Proposition2.6.4, last assertion, PDF53 |
| N69 | Extremal intersection is a single obvious weight | Corollary2.6.5, PDF53 |
| N70 | Admissibility produces an obvious common weight | Proposition2.6.6, PDF53–54 |
| N71 | Herzig weights lie in one auxiliary tensor type | Lemma2.6.7, PDF54 |
| U01 | Universal Iwahori group scheme | §3.1, PDF55 |
| U02 | Universal positive and full loop groups | §3.1, PDF55–56 |
| U03 | Universal affine Grassmannian and bounded pieces | §3.1, PDF56 |
| U04 | Negative loop subgroup | Definition3.2.1, PDF56–57 |
| U05 | Unique positive-negative factorization | Lemma3.2.2, PDF57 |
| U06 | Square-zero loop Lie modules | §3.2 before Lemma3.2.3, PDF57–58 |
| U07 | Positive-negative Lie splitting | Lemma3.2.3, PDF58 |
| U08 | Artinian formal etaleness at a point | Definition3.2.4 and Remark3.2.5, PDF58 |
| U09 | Formal etaleness of loop factorization | Lemma3.2.6, PDF58–59 |
| U10 | Affine-element chart functor | Before Lemma3.2.7, PDF59 |
| U11 | Chart torsor and formal etaleness | Lemma3.2.7, PDF60 |
| U12 | Explicit bounded chart equations | Proposition3.2.8, PDF60 |
| U13 | Distinguished chart section | Definition3.2.9, PDF61 |
| U14 | Bounded charts are open | Corollary3.2.10, PDF61 |
| U15 | Universal differential condition | Equation(3.1), PDF61–62 |
| U16 | Descent of the differential condition | Lemma3.3.1, PDF61 |
| U17 | Global Schubert variety and orbit projection | §3.3, PDF62–63 |
| U18 | Naive universal local model | Definition3.3.3, PDF63 |
| U19 | Open differential stratum is a flag variety | Proposition3.3.4, PDF63–65 |
| U20 | Reduced generic universal decomposition | Corollary3.3.5, PDF65 |
| U21 | Universal local model as a closure | Definition3.3.6, PDF65 |
| U22 | Torus fixed points of global Schubert varieties | Lemma3.3.7, PDF66 |
| U23 | Generic universal naive model is smooth | Proposition3.3.8, PDF66–68 |
| U24 | Elkik lifting for a fixed chart presentation | Proposition3.3.9, PDF68–69 |
| U25 | Equal-characteristic closure model | §3.4, PDF69 |
| U26 | Unibranch points and normalization | Definition3.4.2 and Remark3.4.3, PDF69–70 |
| U27 | Extended torus and chart action | §3.4; Lemma3.4.6, PDF70–71 |
| U28 | Contracting chart action | Lemma3.4.7, PDF71–72 |
| U29 | Contraction gives a unibranch vertex | Lemma3.4.8, PDF72 |
| U30 | Equal-characteristic unibranchness after power base change | Proposition3.4.4, PDF70,73 |
| U31 | Normalization fibres in a flat family | Corollary3.4.5, PDF70 |
| U32 | Flatness across a principal divisor | Lemma3.5.4, PDF74 |
| U33 | Generic flatness of a closure family | Lemma3.5.5 and Remark3.5.6, PDF74 |
| U34 | Geometrically S1 special fibres after shrinking | Lemma3.5.7, PDF74 |
| U35 | Codimension-one regularity under uniformizer specialization | Lemma3.5.8, PDF74–75 |
| U36 | Normality spreads to generic DVR specializations | Proposition3.5.2, PDF73–76 |
| U37 | Quasi-finite horizontal subscheme through a section | Proposition3.6.1, PDF76 |
| U38 | Uniform bounded-extension lift of a section | Corollary3.6.2, PDF76–77 |
| U39 | Product universal local model | §3.7, PDF77 |
| U40 | Uniform unibranchness for product specializations | Theorem3.7.1, PDF77–80 |
| U41 | Integral adic chart domain for product models | Theorem3.7.1, last assertion, PDF77–80 |
| U42 | Normalization connectivity controls adic completion | Lemma3.7.2, PDF80 |
| U43 | Completed local product of chart rings is a domain | Theorem3.7.1 proof, PDF79–80; [10] LemmaA.1.1 and [54] Proposition2.2 |
| M01 | Pappas–Zhu GLn Iwahori local model | §4.1, PDF80–81 |
| M02 | Mixed-characteristic differential locus | Equation(4.1), PDF81 |
| M03 | Generic differential stratum is a smooth flag variety | Proposition4.1.1, PDF81–82 |
| M04 | Flat monodromy local model | Definition4.1.2, PDF82 |
| M05 | Naive mixed-characteristic local model | Definition4.1.3, PDF82 |
| M06 | Union of flat Hodge-stratum closures | Equation(4.2), Proposition4.1.5, PDF82 |
| M07 | Flat union and naive model have the same generic fibre | Proposition4.1.6, PDF82–83 |
| M08 | Residue tuple genericity | Definition4.2.2, PDF83 |
| M09 | Differential affine-cell dimension | Theorem4.2.4, PDF83–87 |
| M10 | Smallness of admissible elements | Lemma4.2.5, PDF83 |
| M11 | Top components of the naive special fibre | Corollary4.2.6, PDF84 |
| M12 | Affine root subgroup charts | §4.2, Lemmas4.2.7–8, PDF84–85 |
| M13 | Unipotent affine-cell subgroup and support | Definitions4.2.9,4.2.14, PDF85 |
| M14 | Polynomial coordinates for the cell subgroup | Proposition4.2.10; Corollary4.2.12, PDF85 |
| M15 | Unipotent subgroup parametrizes the Schubert cell | Proposition4.2.13, PDF85 |
| M16 | Support criterion and count | Corollary4.2.15, PDF85–86 |
| M17 | Triangular cell subgroup | Corollary4.2.16, PDF86 |
| M18 | Common zero-parameter differential affine flag | Equation(4.7), PDF88 |
| M19 | Translate differential models to the common flag | Proposition4.3.1, PDF88 |
| M20 | Translated differential cells and their closures | Definition4.3.2, PDF88–89 |
| M21 | Dimension of a translated differential cell | Proposition4.3.4, PDF89 |
| M22 | Remove the second dominant factor | Proposition4.3.5, PDF89–90 |
| M23 | Finite Weyl invariance of differential closures | Proposition4.3.6, PDF90–91 |
| M24 | Intrinsic component indexed by an alcove pair | Equation(4.9), PDF91 |
| M25 | Identify translated closures intrinsically | Theorem4.3.9, PDF92 |
| M26 | Admissible pairs label translated top components | Theorem4.3.10, PDF92 |
| M27 | Torus torsors over the special-fibre flag | §4.4, PDF93 |
| M28 | Product models, components and torsor comparison | §4.5, Proposition4.5.1, PDF94–95 |
| M29 | Component labelled by a Serre weight and central lift | Definition4.6.1, PDF95 |
| M30 | Representation-theoretic component labelling with repaired bound | Theorem4.6.2, PDF95–96 |
| M31 | Fixed points detected by the negative-loop chart | Lemma4.7.1, PDF97 |
| M32 | Obvious fixed points of an intrinsic component | Proposition4.7.2, PDF97 |
| M33 | Polynomial-generic fixed-point saturation | Proposition4.7.3, PDF97–98 |
| M34 | Intrinsic component is unibranch at fixed points | Proposition4.7.5, PDF99 |
| M35 | Obvious weight gives a fixed point | Theorem4.7.6(1), PDF99 |
| M36 | Fixed point implies a predicted weight | Theorem4.7.6(2), PDF99 |
| M37 | Predicted weight gives a fixed point under polynomial genericity | Theorem4.7.6(3), PDF99 |
| K01 | Tame descent coefficient rings | §5.1, PDF99–100 |
| K02 | Integral Iwahori and its pro-unipotent subgroup | §5.1, PDF100–101 |
| K03 | Breuil–Kisin module of bounded height | Definition5.1.1, PDF101 |
| K04 | Tame descent type on Breuil–Kisin modules | Definition5.1.3 and Remark5.1.4, PDF101–102 |
| K05 | Eigenbasis with descent compatibility | Definition5.1.6, PDF102 |
| K06 | Oriented partial Frobenius matrices | Equations(5.1)–(5.4), PDF102–103 |
| K07 | Compatibility with earlier embedding conventions | Remark5.1.7, PDF103–104 |
| K08 | Change of eigenbasis is twisted Frobenius conjugation | Proposition5.1.8, PDF104–105 |
| K09 | Shape of a residual Kisin module | Definition5.1.9, PDF105 |
| K10 | Frobenius contraction on I1 | Lemma5.1.10(a), PDF105 |
| K11 | Higher congruence contraction | Lemma5.1.10(b),(d), PDF105 |
| K12 | Lie I1 Frobenius contraction, corrected | Lemma5.1.10(c), PDF105 |
| K13 | Height-bounded loop spaces | §5.2, equation(5.5), PDF106–107 |
| K14 | Twisted conjugation actions | §5.2, PDF107 |
| K15 | Quotient presentation of the Kisin stack | Proposition5.2.1, PDF107 |
| K16 | Residual straightening of I1 conjugation | Lemma5.2.2, PDF107–109 |
| K17 | Residual Kisin stack as a torus quotient | Corollary5.2.3, PDF109 |
| K18 | Gauge opens and gauge bases | Definitions5.2.4,5.2.6, PDF109–110 |
| K19 | Existence and uniqueness of gauge bases | Proposition5.2.7, PDF110–112 |
| K20 | Local model diagram for bounded-height Kisin modules | Theorem5.3.1, PDF113 |
| K21 | Bounded Hodge-type Kisin substack | §5.3, PDF114 |
| K22 | Pappas–Zhu local model diagram with Hodge bound | Theorem5.3.3, PDF115 |
| K23 | Nonempty Kisin charts are admissible | Corollary5.3.4, PDF115 |
| K24 | Hodge-bound membership detected by shape | Corollary5.3.5, PDF115 |
| K25 | Etale Frobenius modules with descent | §5.4.1, PDF116 |
| K26 | Forget the Kisin lattice and descend | §5.4.1, PDF116 |
| K27 | Properness of the lattice-forgetting map | Proposition5.4.1, PDF116 |
| K28 | Etale Frobenius matrix attached to an eigenbasis | Proposition5.4.2, PDF117 |
| K29 | Generic triviality of Kisin fibres as a closed immersion | Proposition5.4.3, PDF117–119 |
| K30 | Pole elimination for etale isomorphisms | Lemma5.4.4, PDF118 |
| K31 | Pole elimination for infinitesimal isomorphisms | Lemma5.4.5, PDF118 |
| K32 | Translated bounded flags and shifted torus action | §5.4.2, PDF120 |
| K33 | Bounded flag quotient embeds in the etale stack | Proposition5.4.6, PDF120 |
| K34 | Compatibility diagram for different local models | Proposition5.4.7, PDF120–121 |
| K35 | Fields-of-norms anti-equivalence | §5.5, PDF121 |
| K36 | Restriction of tame representations and semisimplification | §5.5, PDF121–122 |
| K37 | Genericity of a residual Galois representation | Definition5.5.1, PDF122 |
| K38 | Semisimple representations from torus-fixed Frobenius matrices | Proposition5.5.2, PDF122 |
| K39 | Shape of a residual representation relative to a type | Definition5.5.4, PDF123 |
| K40 | Semisimple Kisin module | Definition5.5.5 and Remark5.5.6, PDF123 |
| K41 | Semisimple Kisin modules and admissible type position | Proposition5.5.7, PDF123 |
| K42 | A nonzero tame deformation ring forces admissibility | Corollary5.5.8, PDF123–124 |
| K43 | Semisimplification preserves a Kisin height and Hodge bound | Proposition5.5.9, PDF124–125 |
| K44 | Residual genericity loses at most the height | Corollary5.5.10, PDF125 |
| P01 | Framed local lifting ring | §6.1, PDF125–126 |
| P02 | Type and Hodge-type deformation quotients | §6.1.1, PDF125–126 |
| P03 | Patched local base rings | §6.2, PDF126–127 |
| P04 | Weak patching functor | Definition6.2.1(1)–(2), PDF127 |
| P05 | Weak minimal patching functor | Definition6.2.1(I), PDF127 |
| P06 | Potentially diagonalizable patching functor | Definition6.2.1(II), PDF127 |
| P07 | Detectable patching functor | Definition6.2.1(III), PDF127 |
| P08 | Minimal patching functor for a set of types | Definition6.2.1(IV), PDF127 |
| P09 | Weight elimination for weak patching functors | Proposition6.2.3, PDF128 |
| P10 | Existence of potentially diagonalizable weak patching | Proposition6.2.4(1), PDF128–129 |
| P11 | Existence of weak minimal potentially diagonalizable patching | Proposition6.2.4(2), PDF128–129 |
| P12 | Detectability for semisimple generic representations | Proposition6.2.6, PDF129 |
| P13 | Patched nonvanishing and admissibility criterion | Proposition6.2.7, PDF129–130 |
| P14 | Ordinary upper-triangular lifting | Lemma6.2.8, PDF130–131 |
| P15 | Ordinary weights detected by potentially diagonalizable patching | Proposition6.2.9, first assertion, PDF131 |
| P16 | Ordinary constituent forces a nonzero lifting ring | Proposition6.2.9, last assertion, PDF131 |
| G01 | Rigid coefficient rings and analytic derivation | §7.1 PDF132–133 |
| G02 | Kisin monodromy operator on a lattice | Theorem7.1.1 PDF132 |
| G03 | True monodromy condition | Definition7.1.2 PDF132 |
| G04 | Family monodromy recurrence | Proposition7.1.3(1),(2) PDF133–134 |
| G05 | Finite derivative criterion for monodromy | Proposition7.1.4 PDF134–135 |
| G06 | Closed generic monodromy locus | Corollary7.1.5 PDF135 |
| G07 | Integral true monodromy ideal | Proposition7.1.6 PDF135–136 |
| G08 | Monodromy leading term and error series | Equations7.5–7.8 PDF136–139 |
| G09 | Truncated monodromy ideal | Definition7.1.8 PDF137 |
| G10 | Truncated differential local-model equation | Remark7.1.9 PDF137 |
| G11 | Integral precision of the leading monodromy equations | Proposition7.1.10 PDF138–140; application PDF152 |
| G12 | Emerton–Gee representation stack | §7.2 PDF140–141 |
| G13 | Potentially crystalline formal substacks | §7.2 PDF141 |
| G14 | Analytically unramified formal stack | §7.2 PDF141; Warning7.2.1 |
| G15 | Geometry and versal rings of crystalline stacks | Theorem7.2.2(1)–(3) PDF142 |
| G16 | Dimension of a crystalline stack | Theorem7.2.2(4) PDF142 |
| G17 | Fiber products and monodromy substacks | §7.2 PDF142–143 |
| G18 | Kisin/crystalline stack comparison | Proposition7.2.3 PDF143 |
| G19 | Artinian points detect scheme isomorphisms | Lemma7.2.5 PDF144 |
| G20 | Finite-flat points detect formal-stack isomorphisms | Lemma7.2.6 PDF144–145 |
| G21 | Existence and uniqueness of Kisin lattices in families | Proposition7.2.7; Remark7.2.8 PDF145 |
| G22 | Cyclotomic-free residual representation | Definition7.2.9 PDF146 |
| G23 | Restriction full faithfulness under cyclotomic freeness | Lemma7.2.10(1)–(4) PDF146 |
| G24 | Restriction monomorphism for crystalline families | Proposition7.2.11 PDF146–147 |
| G25 | Monodromy produces the integral Galois representation | Proposition7.2.12; Lemma7.2.13 PDF147–149 |
| G26 | Presentation-dependent local-model parameter | §7.3; Lemma7.3.1 PDF149–150 |
| G27 | Regular-weight unions and framed charts | §7.3 PDF150–151 |
| G28 | Approximate equations give a noncanonical closed immersion | Theorem7.3.2(1) PDF151–155 |
| G29 | Polynomial-generic regular local-model isomorphism | Theorem7.3.2(2), first conclusion PDF151–155 |
| G30 | Domain versal rings at semisimple points | Theorem7.3.2(2), second conclusion PDF151–155 |
| G31 | Nonempty crystalline shape charts | Lemma7.3.5 PDF152 |
| G32 | Serre-labelled Emerton–Gee components | §7.4 PDF155–156 |
| G33 | Special-fiber factorization through the naive local model | Proposition7.4.1 PDF157 |
| G34 | Generic crystalline component support | Theorem7.4.2(1); Remark7.4.3(4),(5); Corollary7.4.5 PDF157–161 |
| G35 | Component local-model diagram | Theorem7.4.2(2); Remark7.4.3 PDF158–161 |
| G36 | Dense triangular locus in Springer components | Lemma7.4.6 PDF159–161 |
| G37 | Component membership and predicted weights | Proposition7.4.7(1)–(3) PDF162 |
| B01 | Global top-dimensional stack cycles | §8.1 PDF162–163 |
| B02 | Extremal types and crystalline/semistable cycles | §8.1 PDF163 |
| B03 | Geometric Breuil–Mézard conjectural interface | Conjecture8.1.1 PDF163 |
| B04 | Breuil–Mézard system | §8.1; Remark8.1.3 PDF163–164 |
| B05 | Versal cycle pullback | §8.1 PDF164–165 |
| B06 | Versal Breuil–Mézard conjectural interface | Conjecture8.1.5; Remark8.1.6 PDF165 |
| B07 | Cycle of a finite module | §8.1.1 PDF165 |
| B08 | Geometric equations imply versal equations | Proposition8.2.1 PDF165 |
| B09 | Component-meeting testing set | §8.2 PDF166 |
| B10 | Cycle detection by versal pullbacks | Lemma8.2.2 PDF166 |
| B11 | Descent and uniqueness of candidate cycles | Proposition8.2.3; Remark8.2.4 PDF166–167 |
| B12 | Irrelevant weights | Definition8.3.1; Remark8.3.2 PDF167 |
| B13 | Covering, disjointness and relative genericity for type sets | Definition8.3.3 first part PDF167–168 |
| B14 | Relative Breuil–Mézard system and good subsystem | Definition8.3.3 second part PDF168 |
| B15 | Minimal patching gives versal cycles | Theorem8.3.5(1) PDF168–169 |
| B16 | Truncated inversion gives effective geometric cycles | Theorem8.3.5(2) PDF168–171 |
| B17 | Patching independence and comparison to conjectural cycles | Theorem8.3.5(3),(4) PDF168–171 |
| B18 | Component truncation idempotents | Proof8.3.5; Lemmas8.3.6–8.3.7 PDF169–171 |
| B19 | Generic crystalline type systems | §8.4 PDF171 |
| B20 | Weight elimination makes the enlarged system span | Lemmas8.4.2,8.4.4 PDF172 |
| B21 | Abstract covering reduces to combinatorial covering | Lemma8.4.5 PDF172 |
| B22 | Generic Serre weights for BM | Definition8.4.6; Remark8.4.7 PDF172 |
| B23 | Generic weights and semisimple points meet the axioms | Lemmas8.4.8–8.4.9 PDF172–173 |
| B24 | Minimal patching for tame generic residual representations | Theorem8.4.10(1) PDF173–174 |
| B25 | Generic geometric BM cycles and support | Theorem8.4.10(2) PDF173–174 |
| B26 | Canonicity of generic BM cycles | Theorem8.4.10(3),(4) PDF173–174 |
| B27 | Shifted polynomial genericity | Equation8.1 PDF174 |
| B28 | Polynomial-generic geometric BM | Lemma8.4.11; Corollary8.4.12 PDF174–175 |
| B29 | Product compatibility of BM cycles | Remark8.4.14 PDF175 |
| B30 | Admissibility transports polynomial genericity | Lemma8.5.1 PDF175 |
| B31 | Generic small-weight versal BM for all tame WD types | Corollary8.5.2 PDF176 |
| B32 | Unit leading coefficient of a generic BM cycle | Proposition8.6.1 PDF177 |
| B33 | Generic BM cycles form an integral basis | Proposition8.6.2 PDF177 |
| B34 | Defect of a predicted weight | §8.6.1 PDF177 |
| B35 | Unique maximal defect in a type intersection | Proposition8.6.3 PDF178 |
| B36 | Recursive BM coefficient computation | Equation8.3; Remark8.6.4 PDF178–179 |
| B37 | Very-generic uniqueness from polynomial-type equations | Proposition8.6.5; Remark8.6.6 PDF179–180 |
| V01 | Definite unitary global setting | §9.1 PDF180–181 |
| V02 | Algebraic automorphic forms with coefficients | Equation9.2 PDF181 |
| V03 | Hecke algebra and attached polarized Galois representation | §9.1 PDF181–182 |
| V04 | Modular Serre weight and generic modular weights | Definition9.1.1 PDF182–183 |
| V05 | Geometric and BM Serre weights | Definition9.1.2; Remark9.1.3 PDF183 |
| V06 | Global weight conjectures | Conjectures9.1.4–9.1.5 PDF183 |
| V07 | Polynomial-generic weight part of Serre's conjecture for U(n) | Theorem9.1.6 PDF183–184 |
| V08 | Genericity polynomial and global examples | Remarks9.1.7–9.1.8 PDF184 |
| V09 | Geometric weights equal predicted weights generically | Lemma9.1.9 PDF184 |
| V10 | Primes of pulled-back Serre components | §9.1 PDF185 |
| V11 | Support of any weak detectable patching functor | Lemma9.1.10 PDF185–186 |
| V12 | Modularity lifting from polynomial-generic local domains | Theorem9.2.1 PDF186–187 |
| V13 | Change-of-weight relaxation of modularity lifting | Remark9.2.2 PDF187 |
| A01 | Arbitrary-level patching functor realizing modular weights | LemmaA.1.1(1) PDF188; proof PDF200–201 |
| A02 | Detectability of the global patching functor | LemmaA.1.1(2) PDF188; proof PDF201 |
| A03 | Annihilator containment forces covering | LemmaA.2.1 PDF188 |
| A04 | Upper-alcove obvious weights occur for weak patching | PropositionA.2.2 PDF188–189 |
| A05 | Liftings, strict equivalence and abelianized determinant | §A.3 PDF189 |
| A06 | Polarized group G_n and multiplier | §A.3 PDF189 |
| A07 | Local deformation problem | DefinitionA.3.1 PDF190 |
| A08 | Fixed-determinant local deformation quotients | §A.3.1 PDF190 |
| A09 | Polarized global deformation data | §A.3.2 PDF190–191 |
| A10 | Partially framed global deformation rings | §A.3.2 PDF191 |
| A11 | Relative tangent and Selmer complexes | §A.3.3 PDF192 |
| A12 | Relative framed tangent comparison | PropositionA.3.2 PDF192 |
| A13 | Taylor–Wiles local deformation condition | §A.3.4 PDF192–193 |
| A14 | Adequate Taylor–Wiles prime supply and generator bound | PropositionA.3.3 PDF193 |
| A15 | Diamond group and augmentation descent | §A.3.4 PDF193–194 |
| A16 | Auxiliary parahoric levels | §A.4 PDF195–196 |
| A17 | Local-global compatibility at auxiliary levels | TheoremA.4.1 PDF196–197 |
| A18 | Taylor–Wiles projectors and free diamond modules | §A.4 PDF197–198 |
| A19 | Finite patching modules and coefficient power series | §A.5 PDF198–199 |
| A20 | Ultrafilter patched module | §A.5 PDF199 |
| A21 | Projectivity and regular sequence of the patched module | §A.5 PDF199 |
| A22 | Patched deformation ring and its actions | §A.5 PDF199–200 |
| A23 | Exact covariant patching functor | §A.5 PDF200 |
| A24 | Support and maximal Cohen–Macaulay properties | ProofLemmaA.1.1 PDF200–201 |
| Q01 | Explicit rank-three monodromy chart | AppendixB PDF201–202 |
| Q02 | Explicit open genericity locus | AppendixB PDF202 |
| Q03 | Three equations for the explicit chart | PropositionB.0.1(1) PDF202 |
| Q04 | Seven special-fiber components | PropositionB.0.1(2) PDF203 |
| Q05 | Complete intersection and flatness of the explicit chart | PropositionB.0.1(3) PDF203 |
| Q06 | Effective Elkik Jacobian bound | PropositionB.0.1(4) PDF203 |
| Q07 | Partial normalization by an explicit fraction | AppendixB PDF203–204 |
| Q08 | Normal O-flat specialization | PropositionB.0.2(1),(2) PDF204–206 |
| Q09 | Normalization fibers of all seven components | PropositionB.0.2(3); Table1 PDF207 |
| Q10 | Unibranch fixed point and a dense branching locus | CorollaryB.0.4 PDF206,208 |
| Q11 | Explicit depth-ten local comparison in one chart | CorollaryB.0.5 PDF208–209 |
| Q12 | Product extension of the numerical example | RemarkB.0.6 PDF209 |
| Z01 | Type A equivalued affine Springer fixed points | Cited input [1], Boixeda Alvarez arXiv:1910.04780v3 Theorem3.1, PDF5; definitions PDF1–4; used in LLHLM23 Proposition4.7.3. |
| Z02 | Explicit affine Springer component matrix and inverse | Cited input [1], Boixeda Alvarez arXiv:1910.04780v3 AppendixB.2–B.5, PDF8–17; corrected E29–E31. |

## Continuation inventory and reproducible precision checks

| ID | Item | Source |
| --- | --- | --- |
| Z03 | Elkik's presentation-dependent Jacobian ideal | Elkik (1973), §0.2, printed p. 555/PDF4; LLHLM23 Proposition3.3.9 proof PDF69 |
| Z04 | Newton correction with an Elkik minor witness | Elkik Lemma1 proof, printed pp. 556–558/PDF5–7, specialized to I=A and no t-torsion |
| Z05 | Elkik approximation with bounded torsion | Elkik Lemma1, printed pp. 555–558/PDF4–7 |
| Z06 | Torsionfree complete approximation without a Noetherian test ring | Proof extracted from Elkik Lemma1 with I=A; used in LLHLM23 Proposition3.3.9 |
| Z07 | A fixed smooth generic presentation gives a uniform exponent | LLHLM23 Proposition3.3.9 proof, PDF69; Elkik §0.2 |
| Z08 | Geometric connectedness in the affinoid finite-extension sense | BLGGT AppendixA.1, printed pp. 595–596/PDF95–96 |
| Z09 | BLGGT geometric connectedness of an affinoid product | BLGGT LemmaA.1.1, printed p. 596/PDF96; standing field convention p. 595 |
| Z10 | A normal connected affinoid with a rational point is geometrically connected | Implicit input before BLGGT LemmaA.1.1 is applied in LLHLM23 Theorem3.7.1, PDF79–80 |
| Z11 | Khare–Wintenberger completed tensor theorem in its original scope | Khare–Wintenberger II Proposition2.2(ii), author PDF9; conventions PDF4–6 |
| Z12 | Domain part over an arbitrary complete DVR | LLHLM23 Theorem3.7.1, PDF79, general-DVR adaptation of KWII Proposition2.2 |
| Z13 | The chart's completed affinoid product is a domain | LLHLM23 Theorem3.7.1 final paragraph, PDF79–80 |
| Z14 | Affinoid product connectedness over complete nonarchimedean fields | General-field adaptation of BLGGT LemmaA.1.1 used in LLHLM23 Theorem3.7.1, PDF79–80 |
| L01 | Connected prime spectra via idempotents | Pinned Tau Ceti TauCeti/RingTheory/Idempotents/Connected/Spectrum.lean |
| L02 | Geometric connectedness of the ordinary algebraic tensor product | Pinned Tau Ceti TauCeti/AlgebraicGeometry/Geometrically/Connected.lean |

~~~python
from fractions import Fraction


def vp(x, p):
    x = Fraction(x)
    if x == 0:
        return float('inf')
    def v(n):
        n = abs(n)
        k = 0
        while n % p == 0:
            n //= p
            k += 1
        return k
    return v(x.numerator) - v(x.denominator)


recurrences = 0
for r in range(8):
    for excess in range(1, 10):
        m0 = 2*r + excess
        m = m0
        for j in range(8):
            assert m == 2*r + 2**j * (m0 - 2*r)
            assert 2*m - 2*r > m
            m = 2*m - 2*r
            recurrences += 1

newton = 0
for p in [3, 5, 7, 11, 13]:
    for r in range(6):
        for excess in range(1, 8):
            m = 2*r + excess
            root = Fraction(p**r)
            a = root + p**(m-r)
            residual = a*a - root*root
            assert vp(residual, p) == m
            assert vp(2*a, p) == r
            y = residual / (2*a)
            assert vp(y, p) == m-r
            corrected = (a-y)**2 - root*root
            assert vp(corrected, p) == 2*m-2*r
            newton += 1

linear = 0
for p in [3, 5, 7, 11, 13]:
    for r in range(1, 6):
        for excess in range(1, 8):
            m = 2*r + excess
            x = p**(m-r)
            assert p**r*x == p**m
            assert vp(x, p) == m-r < m
            linear += 1


def mul(a, b, p):
    # Free O-basis 1,s,y,sy of O[s,y]/(s^2-p,y^2-p).
    out = [0]*4
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            si, yi = i % 2, i // 2
            sj, yj = j % 2, j // 2
            se, ye = si+sj, yi+yj
            out[se % 2 + 2*(ye % 2)] += ai*bj*p**(se//2+ye//2)
    return out


tensor = 0
for p in [3, 5, 7, 11, 13]:
    minus, plus = [0,-1,1,0], [0,1,1,0]
    assert any(minus) and any(plus)
    assert mul(minus, plus, p) == [0,0,0,0]
    tensor += 1

print(f'{recurrences} precision steps; {newton} Newton corrections; '
      f'{linear} precision-loss examples; {tensor} tensor zero-divisor checks')
~~~
