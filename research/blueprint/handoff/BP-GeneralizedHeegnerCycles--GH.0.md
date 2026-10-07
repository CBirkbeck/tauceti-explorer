# Handoff: BP-GeneralizedHeegnerCycles--GH.0

Agent: Codex, session **codex-R5Jncq**. Refs #739. This replaces the two checkpoint handoffs with the completed target-level pass for GH.0–GH.7.

## Outcome and coverage

The packet is **complete** at target level. All eight stages are **planned**, none is **closed**. This is a finished planning pass for independent review, with named proof gaps and supplier exports still open; it is not a checkpoint abandoning unread stages. Every implementation status remains unchecked. GH.8 is outside this job.

There are **66 nodes**: 3 definitions, 15 constructions, 29 theorems, 3 lemmas, 15 comparisons and 1 application. They contain **61 API items**, **54 unit tests**, **36 planets** and **9 baseline declarations**. All 18 definition/construction nodes have uses, full API entries and three tests. Each stage has at most six planets. There are **16 gaps** and **17 requests**.

The original thirteen checkpoint node IDs are retained and corrected. The six integrated source units are mapped through `refines`; four central-result IDs are reused as declaration nodes, while the bundled GH.0/GH.1 IDs are aliases to the split declarations. The README has the full statements, conventions, proof plans, direct prerequisites, APIs, tests, acceptance checks, source passages, requests and gaps, at upstream density. The suggested file now contains the proposed definitions, APIs, tests as examples and named layer results, rather than chiefly comments and dimension arithmetic.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`: zero errors and zero warnings.
- Source excerpts were matched to the acquired source texts; every excerpt is within the protocol limit.
- The six source findings pass `scripts/check_errata.py` through a scratch standalone `errata-v1` envelope, since that checker expects a separate errata file rather than a blueprint packet. The blueprint checker validates the deliverable packet itself.
- Packet/document/suggested name agreement and deliverable-only changes checked before submission; `git diff --check` passes.

**Full suggested-file elaboration did not succeed.** The requested `lean-check` stops at a missing prebuilt Tau Ceti abelian-variety import in the supplied build. No library build, update, cache download or language server was started. The build's Mathlib commit equals **082e2d37e8b0463410cdb532e111cd43d5a66174**. Its full Tau Ceti checkout is newer than **f790474821cf4256814db967cb154e7af3d0c369**; the eight-module Isogeny import closure nevertheless has identical source bytes at the pin. Other existing builds with abelian-variety object files have different Mathlib commits and were not used to claim a pinned check.

An extracted **Mathlib-only portion**, excluding the CM-curve and marked-isogeny nodes and their API/tests, was elaborated with `lean-check` at the pinned Mathlib. It passed with **200 declaration-uses-sorry warnings and no other warnings or errors**. That checks the remaining 64 node prototypes, not the full file. The two genuine Tau Ceti structures and their dependent tests require a prebuilt baseline environment. The supplied isogeny predicate is used directly in the marked-isogeny structure; its definition and identity/composition statements were read at the Tau Ceti pin.

Missing geometric carriers are module/map parameters supplied by their owners, not privately defined replacements. Missing owner hypotheses are omitted where they cannot yet be expressed, as section 13 permits. The conductor, isogeny-degree, cohomological concentration, finite local condition, regulator injection and Selmer signatures therefore remain partial prototypes; their full hypotheses and identification of the parameters with actual source objects are in the packet and README. Elaboration of a prototype does not establish those identifications or prove the mathematics.

## Confirmed red-team findings

- **RT-AREA-iwasawa-1/10:** GH.5 imports the exact ES.5 Howard-hypotheses node and ES.8 self-dual Λ bound, verifies the higher-weight instance, and constructs the auxiliary-group-valued unit-corrected system. Generic DVR and Λ theory is not rebuilt here. A rescope proposal records ES.5→GH.5, ES.8→GH.5 and the point-family HE.6→HE.8 edge. The CH bounded-error descent is a separate requested ES.5 extension rather than an unjustified clean-Howard application.
- **RT-AREA-iwasawa-1/11:** L3h is the sole GL₂ BDP/CH distribution owner. GH.4 owns the general BDP Theorem 5.13, including m=0, and GZ.9 imports that specialization. The CH ramified logarithm remains a separate theorem with the n=1 boundary gap, so it is not mistaken for the unramified point formula. The proposal records L3h→GZ.9 and GH.4→GZ.9; GZ keeps quaternionic and exceptional variants. No modular-symbol prerequisite is introduced for BDP.
- **RT-AREA-iwasawa-1/27:** the preferred generic owner is Padic Hodge regulators, Part II, extending L3 with integral relative twists, the Yager unramified tower, Ochiai exponential and the two-variable regulator. GH.7 imports comparison checkpoints; **AutomorphicCongruences:L2** keeps the bounded fixed-weight BK-logarithm application. The current cyclotomic supplier is not claimed to cover the stronger extension.
- **RT-AREA-iwasawa-3/1:** the W_m model over Z[1/N] is distinguished from the product over a field defining A. GH.0 exports the good CM model and BDP's finite unramified local comparison data into GH.1. The negative acceptance test uses y²=x³−25x at p=5 although 5∤7; the positive test uses the good model y²=x³−x at p=5 and the supplied level-13 W_m model. Arbitrary CM twists are not certified by p∤N, and no claim of universal necessity of unramifiedness for BK containment is made.

## Follow-up priority and exact resumption

Independent review checks the completed pass, its source hypotheses, three new slips and ownership contracts. Proof closure should start with the higher-weight modular/lattice export and the corrected integral p-condition; these affect several downstream stages. The first-step full/half-unit adapter is the normalization boundary between fixed-weight and family classes. Local LV twist/control verification and the regulator Part II contracts must be resolved before applying the generic Λ theorem or the family specialization theorem.

There is no need to reconstruct the target pass. Resume at the named gaps and their `neededBy` node IDs below. No source PDFs, extracted texts or scratch scripts are needed by the next worker; public URLs, hashes and exact sections are durable in the packet.

## Stage status and remaining closure

**GeneralizedHeegnerCycles:GH.0 — planned**: Higher-weight universal-family export; Product realizations and CM good model.

**GeneralizedHeegnerCycles:GH.1 — planned**: Higher-weight universal-family export; Integral descent and CM character coefficient adapter; Geometric syntomic regulator comparison; Classical-cycle source comparison; Wide-open residue and Coleman comparison export.

**GeneralizedHeegnerCycles:GH.2 — planned**: Corrected integral p-condition adapter.

**GeneralizedHeegnerCycles:GH.3 — planned**: Bottom conductor and full/half unit normalization; LV universal-norm identification.

**GeneralizedHeegnerCycles:GH.4 — planned**: Ramified conductor-one logarithm boundary; Generic local regulator Part II.

**GeneralizedHeegnerCycles:GH.5 — planned**: Corrected integral p-condition adapter; LV local twist and integral local verification.

**GeneralizedHeegnerCycles:GH.6 — planned**: Corrected integral p-condition adapter; LV local twist and integral local verification; Analytic nonvanishing supplier; CH versus clean Howard descent; LV universal-norm identification; Parity supplier and sign convention.

**GeneralizedHeegnerCycles:GH.7 — planned**: Classical-cycle source comparison; Bottom conductor and full/half unit normalization; Generic local regulator Part II; Hida point and representation tower exports.

## Gaps

### Higher-weight universal-family export

R14.3 currently supplies finite-level H¹ rather than the full Scholl fiber-power/projector/lattice package. Its requested RS-06 extension must prove the integral Hecke denominator and the f-lattice comparison, beyond p∤2N m!.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/newform-cm-projector`
- `GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison`

### Product realizations and CM good model

Filtered de Rham and rational étale Künneth exports and the independently chosen CM good model are not supplied by level p∤N. Verify the selected canonical CM application over finite unramified F; do not extend it to arbitrary CM twists.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`
- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`
- `GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration`

### Integral descent and CM character coefficient adapter

Prove vanishing of coefficient invariants for the K̃_c/K_c descent, and construct the Weil-restriction CM-character summand with all lattice/projector denominators. Invariance of a class alone does not identify the two H¹ groups.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/integral-abel-jacobi-comparison`
- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`

### Geometric syntomic regulator comparison

Obtain the higher-dimensional Chow regulator and its exact Frobenius/Tate comparison. Current D.2 Spec O_F and D.5 K₂ curve comparison theorems are insufficient.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/syntomic-abel-jacobi-comparison`

### Classical-cycle source comparison

BDP 2017, p-adic L-functions and the coniveau filtration on Chow groups, Proposition 4.1.2 was not read in this run. Castella’s use and constants were read. Acquire that source and verify the cycle adapter rather than claim BDP 2013 proves it.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/classical-generalized-cycle-comparison`
- `GeneralizedHeegnerCycles:GH.7/initial-family-specialization`

### Wide-open residue and Coleman comparison export

The exact BDP §§3.5–3.6 wide-open algebraic/rigid comparison and residue theorem with L_{m,m} must be exported by RD.4. The F-isocrystal carrier alone does not prove the analytic primitive calculation.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing`
- `GeneralizedHeegnerCycles:GH.1/coleman-primitive`

### Corrected integral p-condition adapter

KO Lemma 4.10’s proof was read, but its Condition 2.3 and integral Ω construction are not discharged. Prove the requested lifting/orthogonality theorem and identify its height-one regulator-image local condition and lattice with the CH or LV condition at each required specialization.

Consumers:

- `GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`
- `GeneralizedHeegnerCycles:GH.5/higher-weight-kolyvagin-class`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`

### Bottom conductor and full/half unit normalization

Compute the missing n=1 split trace in CH’s 2022 copy and the unit orbit multiplicity. CH u_c=|O_c×| differs from Castella u_c=|O_c×|/2. No equality of their raw initial classes is assumed.

Consumers:

- `GeneralizedHeegnerCycles:GH.3/stabilized-first-step-adapter`
- `GeneralizedHeegnerCycles:GH.3/iwasawa-heegner-class`
- `GeneralizedHeegnerCycles:GH.7/initial-family-specialization`

### Ramified conductor-one logarithm boundary

Theorem 4.9 states n≥1, while the conductor cancellation used in the density argument is n>1. Verify the n=1 calculation from the CM sum and lower conductor contributions; retain the separate BDP unramified Euler formula.

Consumers:

- `GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula`

### Generic local regulator Part II

L3 presently proves the cyclotomic map. The relative Lubin–Tate and unramified×cyclotomic ordinary deformation contracts, ideal J, Yager module, λ_reg localization, pseudo-null errors and exceptional denominators require the precise proposed extension.

Consumers:

- `GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter`
- `GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint`

### LV local twist and integral local verification

Check Assumption 3.2 in the representation convention of the LV edition read: trivial inertia on the quotient is not implied just by ordinarity of the untwisted form. Prove the actual annihilator, H⁰ and Cartesian/control conditions or supply a corrected applicable control theorem. This is a verification gap against arXiv v1, not an accusation about the published version.

Consumers:

- `GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions`
- `GeneralizedHeegnerCycles:GH.5/specialization-control`
- `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`
- `GeneralizedHeegnerCycles:GH.6/lambda-structure-consequence`

### Analytic nonvanishing supplier

Hsieh’s Theorem C itself was not read; CH’s use and auxiliary-prime proof route were read. L3h must supply its exact level/discriminant/residual conditions and the resulting bounded nonzero measure before the eventual algebraic nonvanishing claim is applied.

Consumers:

- `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing`

### CH versus clean Howard descent

Import or extend ES.5 to the CH/Nekovář bounded-error descent under CH (H). The stronger clean Howard H0–H5 criterion or LV big image is not silently added to the fixed-weight CH conclusion.

Consumers:

- `GeneralizedHeegnerCycles:GH.6/selmer-rank-one`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`

### LV universal-norm identification

Track finite Δ corestriction, p∤h_K, eventual augmented ideal equality and the Perrin–Riou universal-norm/Nakayama input. Verify generation of H∞ by κ̃₁ rather than infer it from nonvanishing of κ̃₁.

Consumers:

- `GeneralizedHeegnerCycles:GH.3/universal-norm-heegner-class`
- `GeneralizedHeegnerCycles:GH.6/universal-norm-module-rank-one`

### Parity supplier and sign convention

Supply Nekovář’s corrected family parity theorem and check its local family hypotheses. Use parity residue (1−ε)/2; the final congruence in the CH author-copy proof printed with ε alone cannot distinguish the two root signs modulo 2.

Consumers:

- `GeneralizedHeegnerCycles:GH.6/selmer-parity`

### Hida point and representation tower exports

Extend the finite-level CM point interface to shared p-parts of conductor/level; provide the ordinary rank-two Hida representation and specialization with its bad-prime residual hypotheses. A weight-two Hecke representation and fixed-weight Hida control alone do not give the complete tower contract.

Consumers:

- `GeneralizedHeegnerCycles:GH.7/howard-family-tower`
- `GeneralizedHeegnerCycles:GH.7/family-representation-specialization`

## Requests to other roadmaps

These are recorded requests in the packet, not messages sent to other workers or assumptions that unplanned exports already exist.

### AutomorphicGaloisRepresentations:R19.1

Deligne newform representation with the exact geometric Frobenius, self-dual twist and lattice index used by LV Definition 2.1, plus its determinant-restricted big-image input and solvable-tower invariant-vanishing consequence under the stated nonexceptional prime conditions.

Consumers:

- `GeneralizedHeegnerCycles:GH.5/longo-vigni-admissible-triple`

### AutomorphicGaloisRepresentations:R19.6

The Hida ordinary branch representation T=lim_s e^ord T_pJ_s⊗_h I of Castella Theorem 4.3: free rank two under residual irreducibility/p-distinguishedness, trace and determinant conventions, rank-one ordinary sequence and arithmetic specialization after the critical twist. The current weight-two Hecke reconstruction nodes do not themselves prove this tower theorem.

Consumers:

- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`
- `GeneralizedHeegnerCycles:GH.7/family-representation-specialization`
- `GeneralizedHeegnerCycles:GH.7/howard-family-tower`

### AutomorphicPadicLFunctions:L3h

One GL₂ BDP/CH square-root distribution owner, including p-depletion and negative θ powers on the CM ordinary locus, BDP 5.9–5.10 toric interpolation/continuity, CH Proposition 3.8 and Theorem 3.9’s Hsieh Theorem C nonvanishing with auxiliary residual hypotheses, and Castella Theorem 2.11 family interpolation with period, epsilon, Euler and gamma normalization. GH.4 owns the generalized-cycle special value identity, while GZ.9 imports m=0; do not rebuild the measure in either place.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation`
- `GeneralizedHeegnerCycles:GH.4/bdp-special-value-formula`
- `GeneralizedHeegnerCycles:GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`
- `GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value`
- `GeneralizedHeegnerCycles:GH.4/ramified-character-abel-jacobi-formula`
- `GeneralizedHeegnerCycles:GH.6/anticyclotomic-nonvanishing`
- `GeneralizedHeegnerCycles:GH.7/family-measure-specialization`

### ComplexMultiplicationAndExplicitReciprocity:CM.1

General CM A/H with End_H(A)=O_K, including exceptional unit fields; the normalized two CM characters and the realization of B=Res_{H/K}A and its algebraic Hecke character κ_A; their ideal-action and geometric Artin convention, and the coefficient extension/finite Hilbert class character used in CH (4.5)–(4.7). The HE canonical descent node supplies only its stated restricted hypotheses.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting`
- `GeneralizedHeegnerCycles:GH.1/character-projected-heegner-class`
- `GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n`
- `GeneralizedHeegnerCycles:GH.2/cycle-conjugation`
- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`

### DerivedDeRhamCohomology:DD.2

Scheme-level algebraic de Rham realization for smooth proper schemes, filtered Künneth for W_m×A^m, cup product, compatibility with correspondence action and the classical smooth de Rham complex. Extend DD.2 beyond its present algebra/complex interface if this global filtered Künneth theorem is not yet included.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`
- `GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration`

### EtaleDualityAndPerverseSheaves:EDC.6

Rational p-adic étale Künneth and correspondence compatibility for proper smooth products, obtained from integral/finite systems with derived-limit control; no torsion duality statement alone supplies the rational product formula.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`

### HeegnerPointEulerSystems:HE.1

Compatible finite-level CM points on X₁(Np^s) with p-power conductor, defined over K̃_c(μ_{p^s}), their diamond character ϑ²=ε_cyc and degeneracy/vertical trace in Castella §4.2. The existing prime-to-level canonical CM pair node is insufficient when conductor and level both have p-parts; extend that point interface, while GH.7 owns the family coefficient/class adapter.

Consumers:

- `GeneralizedHeegnerCycles:GH.7/howard-family-tower`

### ModularCurvesPartII:R14.3

RS-06 higher-weight extension of the universal-family carrier: W_m as canonical desingularized fiber power of the generalized elliptic curve over X₁(N), N>4; commuting N-torsion and signed Ξ_m projectors with denominator N^m2^m m!; Scholl projected degree m+1 cohomology, parabolic Hodge filtration Fil^{m+1}=S_{m+2}, Hecke action and f summand, integral stable lattice with an explicit Hecke congruence denominator, and smooth proper model over Z[1/N]. The current finite-level H¹ packet is insufficient for these higher fiber powers; extend the owner, not GH.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`
- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`
- `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`
- `GeneralizedHeegnerCycles:GH.0/newform-cm-projector`
- `GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation`
- `GeneralizedHeegnerCycles:GH.2/cycle-conjugation`
- `GeneralizedHeegnerCycles:GH.7/howard-family-tower`
- `GeneralizedHeegnerCycles:GH.0/projected-hodge-filtration`

### PadicDifferentialEquationsAndRigidCohomology:RD.4

BDP §3.5 algebraic/rigid wide-open curve comparison with overconvergent coefficients, invariance under shrinking Frobenius neighborhoods, annular and cusp residues, rigid residue theorem and the Cech–de Rham cup-product formula. RD.3 supplies the F-isocrystal carrier separately; these exact wide-open comparisons need proof, not just a formal site map.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/coleman-primitive`
- `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing`

### PadicHodgeRegulators:D.2

Higher-dimensional Chow-cycle syntomic Abel–Jacobi regulator for smooth proper X_m with projector action, proper/flat functoriality, and comparison with the étale Gysin extension and BK logarithm with an explicit Frobenius normalization. The existing Spec O_F Tate regulator and K₂ curve comparison nodes do not supply this statement.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/syntomic-abel-jacobi-comparison`

### PadicHodgeRegulators:L3

Part II of Padic Hodge regulators: integral relative Lubin–Tate Perrin–Riou twists Ω with coefficient-lattice and finite pairing compatibility (KO 3.7, 4.7, 4.10); CH Theorem 5.1 relative regulator with its two interpolation ranges; Castella Theorem 3.4 exponential on J=(Ψ(Fr_p)−1,γ₀−1) with injectivity and pseudo-null cokernel; Yager trace module for the unramified Z_p tower, its rank-one freeness and y^u=[u]y covariance; Theorem 3.7 two-variable map into λ_reg^{-1}J and Corollary 3.9, with arithmetic exceptional denominators. The accepted L3 packet is strictly cyclotomic and finite unramified scalar extension is not an infinite unramified tower. This extension is the preferred local owner required by RT-iwasawa-1/27; AC L2 keeps bounded fixed-weight BK logarithms.

Consumers:

- `GeneralizedHeegnerCycles:GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`
- `GeneralizedHeegnerCycles:GH.4/dual-exponential-special-value`
- `GeneralizedHeegnerCycles:GH.4/fixed-weight-regulator-adapter`
- `GeneralizedHeegnerCycles:GH.5/longo-vigni-local-assumptions`
- `GeneralizedHeegnerCycles:GH.7/critical-character-twist`
- `GeneralizedHeegnerCycles:GH.7/ochiai-exponential-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/two-variable-regulator-checkpoint`
- `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint`

### PadicHodgeTheory:R06.2

Negative-weight filtered Frobenius extensions over unramified F, admissible/crystalline extension comparison, Φ=Φ₀^[F:Q_p] convention and the quotient D_dR/Fil⁰ with the holomorphic-minus-Frobenius sign, as BDP §§3.2–3.4 uses.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules`

### PadicHodgeTheory:R06.5

Application of proper smooth comparison to projected X_m cohomology, including its Hodge/Tate normalization and the geometric Abel–Jacobi extension landing in H¹_f. The generic geometric comparison is imported from CP and the regulator extension must be compatible with the higher-dimensional Chow Gysin construction.

Consumers:

- `GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules`
- `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`
- `GeneralizedHeegnerCycles:GH.2/cycle-frobenius-congruence`
- `GeneralizedHeegnerCycles:GH.2/finite-local-abel-jacobi-class`

### SchemeAndStackFoundations:SF.2

Proper smooth base change and relative Gysin/specialization with the coefficient levels used for the product model and graph support. The already existing smooth/proper stability under products is imported from Mathlib, not re-planned.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cm-product-good-model`
- `GeneralizedHeegnerCycles:GH.1/parabolic-residue-pairing`

### SchemeAndStackFoundations:SF.5

Ordinary rational Chow groups, rational equivalence, proper pushforward/flat pullback, isogeny graph products, correspondence composition and action, including base change and transpose. Compare degree-zero Bloch cycle complexes with this intersection-theory API instead of giving GH a private Chow carrier.

Consumers:

- `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`
- `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`
- `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map`
- `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`

### SelmerIwasawaCohomology:L4

Corrected Nekovář family parity theorem (Nek07 Corollary 5.3.2 with Nek09 correction), including the precise self-dual induced family and local plus-module hypotheses used by CH §6.4. This is a proposed Part II arithmetic-consequence extension, not an assertion that RJW criticality examples already prove family parity.

Consumers:

- `GeneralizedHeegnerCycles:GH.6/selmer-parity`

### EulerSystemsAndKolyvaginSystems:ES.5

CH §7.2–7.5 anticyclotomic Euler-system descent with its bounded local errors and Nekovář auxiliary constants: nonzero bottom class gives the one-dimensional self-dual Selmer bound, and a nonzero complementary local class kills the Bloch–Kato group. Supply the finite–singular coefficient correction, residual Kummer detection, admissible primes and p^C annihilator independently of the stronger clean Howard hypothesis package; verify that CH (H) satisfies this source-specific instance. Do not infer this theorem by silently imposing LV big image on CH Theorem 6.1.

Consumers:

- `GeneralizedHeegnerCycles:GH.6/selmer-rank-one`
- `GeneralizedHeegnerCycles:GH.6/selmer-rank-zero`

## Sources and edition limits

Six acquired public sources have file hashes, read dates and exact passage lists in the packet.

- [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf): Published Duke Math. J. 162 (2013), 1033–1148; 116 pages. Read 2026-10-07. §1.4, pp.1051–1054; §2.1–2.4, pp.1055–1064; §3.1–3.7, pp.1064–1083; §3.8 Proposition 3.24 and its proof, pp.1086–1088; §5.3, Assumption 5.12 and Theorem 5.13 with proof, pp.1137–1139; appendix introduction, pp.1139–1141.

- [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf): Author copy dated July 2, 2022, 40 pages; distinct from Math. Ann. 370 (2018). Read 2026-10-07. Hypothesis (H); Proposition 3.8 and Theorem 3.9 nonvanishing statements and proof; §4.1–4.7 cycle, norm, character and logarithm constructions; §5.1–5.3 relative regulator, stabilization and reciprocity; §6.1–6.4 with proofs; §7.1–7.5 descent and local condition arguments.

- [Erratum to Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf): One-page author-hosted erratum. Read 2026-10-07. Entire text, including all three corrections.

- [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168): arXiv:1605.03168v1, May 10, 2016; findings and obligations refer to this edition. Read 2026-10-07. Introduction and Theorem 1.1; §2–5 (hypotheses, control, universal norms, Kolyvagin construction, rank-one module and bound).

- [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf): 31-page author-hosted copy of J. Inst. Math. Jussieu 19 (2020), 2127–2164. Read 2026-10-07. §1 introduction and conventions; §2.1–2.7; §3.1–3.4; §4.1–4.2; §5.1–5.2; §6.1–6.2, through Theorem 6.5 and Remark 6.6; §6.3 is outside this part.

- [Anticyclotomic main conjecture for modular forms and integral Perrin-Riou twists](https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf): Author-hosted proceedings copy, 58 pages, cited by CH erratum. Read 2026-10-07. §4.7 Lemma 4.10 and its entire proof; Lemma 4.7 and Remark 4.8; integral twisting prerequisites are requested, not independently established.


Missing primary inputs are BDP (2017), *p-adic L-functions and the coniveau filtration on Chow groups*, Proposition 4.1.2; Hsieh's primary analytic nonvanishing theorem; and the full KO integral Ω/Condition 2.3 and Nekovář corrected parity/descent supplier proofs. Their invocations in Castella, CH or KO were read and are precisely requested; they are not claimed independently verified. The publisher LV full-text page returned an Incapsula access page, arXiv lists only v1, and the author publications page timed out. The LV source findings and local-verification gap are scoped to arXiv v1, not asserted against the 2019 version of record.

Six source issues are recorded: E1–E3 are the known CH growth, Fontaine–Laffaille ramification and abelian-extension corrections; E4 is the parity residue in the final line of the 2022 author-copy proof; E5 is the nonexistent fifth admissibility clause in LV v1; E6 is scalar equality in the LV augmentation argument where generated-ideal equality is needed. E4–E6 await independent confirmation. All nodes use the corrected statements.

## Submission

This run claims only issue #739 and stops after opening its pull request. The scratch directory is removed once the PR is open; this handoff and the three other deliverables contain all durable continuation data. The PR records Codex, Refs #739, checks and the full-file Lean limitation. The automatic submission check is monitored and any deliverable error is repaired on this same branch. No issue is closed, label changed or merge performed manually.
