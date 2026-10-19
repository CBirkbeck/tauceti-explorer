# Handoff: DESIGN-KloostermanMomentsAndPotentialAutomorphy

Agent: Codex. Session: codex-bJqrNS. Issue: #3441.

This is the completed target-level design pass, not a checkpoint or an implementation.
The claim was confirmed by the bot against comment 6257435293. Only this successful
claim was worked; no second issue is to be claimed in this run.

## Deliverables and coverage

The new roadmap definition, blueprint packet, reader and compact suggested Lean file
are synchronized. The roadmap has twelve layers, KM.0–KM.11, from all-rank finite
sums/sheaves/connections to rank-two Hodge numbers, moment motives, arithmetic
realizations, local factors, potential automorphy and functional equations.

- 62 targets: 11 definitions, 10 constructions, 38 theorems, one comparison and two applications.
- 85 API items, 63 discriminatory unit tests, 59 planets and seven inspected baseline declarations.
- Twelve stages planned, zero closed; nine gaps and fourteen supplier requests.
- Every implementationStatus is unchecked. The packet status is complete because every
  target is specified with its backward chain ending in a baseline, supplier or explicit gap.
- All 49 coalesced routed items are accounted for: 46 FSY items and three Xu–Zhu items.
  The two boundary items retain their exclusions rather than becoming extra targets.

The reader is definitive for every target, hypothesis, proof route, locator, API and
test. The suggested file follows WORKERS.md's 12 October compact shape rule, which
supersedes the issue's older exhaustive-signature wording. It has five real-bodied
light definitions, ten named theorem signatures and twelve examples in 174 lines.
No heavy geometric carrier is replaced by a private stand-in or a data placeholder.

## Sources and baseline

Direct primary reading, with all statements in the repository written in our own words:

- Fresán–Sabbah–Yu, *Hodge theory of Kloosterman connections*, arXiv:1810.06454v5
  (13 June 2022), main text §§1–5, pp. 1–59, and Appendix A, pp. 59–72.
  All FSY locators use this 75-page preprint's pagination, not journal pages.
- Xu–Zhu, *Bessel F-isocrystals for reductive groups*, arXiv:1910.13391v2
  (19 December 2019), §1.1.1–1.1.2, pp. 2–4; §2.1.5, p. 10;
  §4.1.13, p. 42. Its all-rank normalized foundations are coalesced here.
- Serre, *On the mod p reduction of orthogonal representations*,
  arXiv:1708.00046v3 (8 August 2018), §4.1–4.2, Theorem 4.2.1 and
  Lemma 4.2.4, pp. 9–10, including their proofs. This supplies a precise
  generic semisimplification-with-form request, not another local definition.

URLs, versions, SHA-256 hashes and exact reading ranges are in the packet and reader.
Original proof sources not read are explicitly identified in G3, G4, G8 and G9.
No restricted library book was used, and no source passage or source file is retained.

Pinned declaration statements were read at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Baseline carriers are AddChar,
character-sum orthogonality, the two finite-field trace declarations, Complex.Gamma,
MixedHodgeStructure and SymmetricPower. The latter supplies a local module only;
induced connection functoriality belongs to G1.

The current upstream roadmap tree was inspected at
0d144d044dacebca17b654695b6f1ad58f159b27, including the post-snapshot roadmaps.
ArithmeticDirichletSeries and ProfiniteArithmetic supplied style and ownership
examples; AnalyticToricGeometry's actual layer-zero supplier and suggested interfaces
were inspected. Current Tau Ceti and Mathlib were searched in addition to the pin
checks. No upstream roadmap or library file was edited and no build was run there.
The reviewed library-coverage entries and exact external node contracts were read.

## What remains, and where to resume

Independent review should first check the normalization and exceptional branches,
then the gap boundaries below. There is no unplanned target left in this pass.
Closure requires the named supplier extensions; the packet must not be called gap-free.

- **G1 — Holonomic operations and Fourier foundations.** No existing companion MixedHodgeModulesAndIrregularHodgeTheory definition, packet or reserved stage was found. The exact general input is the category of algebraic holonomic left D-modules on smooth characteristic-zero varieties; direct/inverse images with the de Rham shifts of FSY A.1, pp. 59–61; duality and intermediate extension; exponential tensor connections and induced symmetric-power connections on the existing local module quotient; Fourier inversion, stationary phase and the regular Gauss–Manin comparison; logarithmic canonical extensions and local formal slope calculations. These must be owned by a new foundational companion extending the existing analytic/derived suppliers. EDC.5 only treats étale/perverse coefficients and does not provide these operations. No invented stage id is used as an already supplied prerequisite.
- **G2 — Mixed Hodge modules and irregular Hodge comparison.** The missing companion must provide Saito mixed Hodge modules, strict filtered morphisms, six operations with weights, nearby/vanishing cycles, exponential projector Π and its de Rham fiber functor (FSY Appendix A.2–A.5, pp. 61–67). Needed exact milestones are Proposition A.13 (classical subcategory has the ordinary filtration), Theorem A.24 (product t g on A¹×V, constant A¹ factor, and the stated *0/!0 variants), Example A.27 (compact-support/local-support hypersurface comparison), Theorem A.30/Corollary A.31 (Fourier fibers and nearby-cycle Hodge data), pp. 65–72; also the filtered blowup invariance, E₁ degeneration and Newton filtration results used in §4.3, pp. 35–37. Tau Ceti already has MHS carriers and strictness; HodgeStructuresPartII concerns variations/Higgs objects and does not supply MHM or these irregular operations. This is a precise new-companion request, not a claim of closure.
- **G3 — Nori weights and realization compatibility.** MC.5 supplies a rational Nori category, tensor structure and cohomology-with-supports nodes, but no exact node inspected states the functorial Nori weight filtration and all realization compatibilities needed for gr^W H_c. Request the specified MC.5 extension as Motives and Algebraic Cycles, Part II. FSY (3.1), p. 18 points to Huber–Müller-Stach Theorem 10.2.5; its original text was not consulted and a theorem/page-level primary check remains. No passage or file from a restricted book was copied. A vector-space weight filtration cannot be promoted to a motivic one by definition.
- **G4 — Characteristic-two nonordinary quadratic vanishing cycles.** The exact input at p=2 and odd k is concentration of the vanishing-cycle cohomology in degree k−1 for the isolated nonordinary quadratic singularity y_i=1, giving injective cospecialization in that degree (FSY proof of Theorem 5.8, p. 43, citing Illusie, Perversité et variation, Corollary 2.10). The inspected LPV.2 ordinary-quadratic contract excludes this case. Add the nonordinary theorem as Lefschetz Pencils and Vanishing Cycles, Part II; the Illusie source and its exact hypotheses have not been read here. Dimension equality alone does not establish injectivity.
- **G5 — Generic preservation of similitude forms under semisimplification.** The needed general statement is now pinned directly to Serre Theorem 4.2.1, pp. 9–10, read with its proof. A maximal isotropic submodule gives an anisotropic semisimple quotient and a paired hyperbolic summand; this produces the same symmetric or alternating type on the semisimplification. G7 has the symmetric-power polarization API but no exact node found for this theorem for algebras with involution. The request specifies it and the χ_cyc-twisted group-algebra involution; add it to that owner as a Part II extension, not as another Kloosterman theorem.
- **G6 — Higher-thickness semistable model in the bad-prime comparison.** The existing RD.7 Mieda node requires each local equation over Z_p[sqrt(−p)] to be Q−u(sqrt(−p))² with u a unit. The expansion in FSY (5.6)/(5.16) has constant 2ap/2bp. For example k=9,p=3,a=3 gives constant 18 of valuation two, not one; p may divide the orbit parameter. The assertion on FSY p. 50 does not verify this unit hypothesis. A resolution for arbitrary thickness, a stronger comparison theorem, or another proof of semistability and Frobenius compatibility is required. The good-prime crystalline branch and the all-prime de Rham assertion do not use this step. Record source issue E9 and the limitation of the imported RD.7 node; do not silently treat it as an unconditional supplier.
- **G7 — Arithmetic base extension of the current toric supplier.** The current AnalyticToricGeometry README and Suggested file are built on the implemented toric fan/monoid-algebra/gluing API, but their scheme carrier is over C. The Kloosterman model needs the same regular signed fan over Z and Q, compatible base changes to all F_p and Z_p, properness, smoothness, monomial charts, toric boundary and equivariant blowups. Specify Analytic Toric Geometry, Part II: arithmetic toric models, importing the current layer unchanged. The signed fan and its explicit g_1 calculation are owned here; general toric geometry is not replanned.
- **G8 — Original proof leaves of arithmetic Kloosterman inputs.** The exact theorem statements were read in FSY Proposition 2.7, §3.2.1 and §5.1.1, pp. 12,24,39–40, and XZ §1.1.2, p. 3. The original Deligne construction, Katz local/differential monodromy proofs, Fu–Wan determinant/local invariant calculations and Yun’s characteristic-two formula were not read at proof level in this run. Their full cited conclusions are separate targets here, with all exceptional branches retained; the backward proof chain still needs original-source decomposition. Locate Deligne SGA 4½ Sommes trig. 7.4/7.8, Katz’s referenced monodromy results, Fu–Wan 2005 Theorem 0.2 and 2010 Theorem 0.1, and Yun Lemma 4.3.4/Corollary 4.3.5 before treating those proof leaves as supplied. No unconsulted source is represented as read.
- **G9 — Orthogonal-motive root-number theorem and scope.** FSY p. 58 invokes T. Saito, The sign of the functional equation of the L-function of an orthogonal motive, Invent. Math. 120 (1995), 119–142. The original theorem and its exact motive/realization hypotheses have not been read, and no matching atlas node was found. A Motives and Algebraic Cycles, Part II extension should supply the precise even-weight orthogonal-motive root-number theorem, with compatibility for this Nori motive and the global measure/character convention. The generic epsilon-factor node supplies local constants, not positivity of their global product. Until that contract is verified, the explicit + sign of the odd functional equation has this recorded input gap.

The packet's `neededBy` lists and the reader's corresponding sections identify every
consumer. The exact supplier-request contracts are retained in full there:

1. **SchemeAndStackFoundations:SF.2** — Provide the actual rational ℓ-adic complexes on finite-type schemes, compact support and support-to-ordinary maps, finite/proper/smooth base change, Künneth, geometric Galois action, trace formula for every finite extension and Grothendieck–Ogg–Shafarevich on G_m. The rank-one Artin–Schreier coefficient is the ψ eigensummand of the pushforward along u↦u^p−u, with trace ψ∘Tr. Import PR196 suppliers where already owned; no second six-functor implementation is requested.
2. **EtaleDualityAndPerverseSheaves:EDC.1** — Use rational ℓ-adic Verdier duality, localization and the ordinary/compact-support exchange maps for the finite-type tori and hypersurface pairs over Q, F_p and their algebraic closures. Preserve geometric rather than absolute Galois cohomology and retain every shift.
3. **EtaleDualityAndPerverseSheaves:EDC.2** — Use smooth Poincaré duality and trace with the normalization on G_m and the ambient smooth torus; use cohomology with supports for the singular zero locus instead of falsely applying smooth purity to it.
4. **EtaleDualityAndPerverseSheaves:EDC.4** — Use projective-quadric cohomology, the projective-bundle and smooth-center blowup/localization maps, with Tate twists, Frobenius and group equivariance, to compare the χ-isotypic cohomology of the even resolution.
5. **ArithmeticGaloisRepresentations:G7** — Consume its existing symmetric-power/polarization carrier, and extend as Arithmetic Galois Representations, Part II if necessary to the following exact missing contract: for a characteristic-zero field E, an E-algebra with E-linear anti-involution *, and a finite-dimensional module with nondegenerate *-compatible symmetric or alternating bilinear form, its semisimplification admits a *-compatible form of the same type. Source: Serre, arXiv:1708.00046v3, Theorem 4.2.1, pp. 9–10; apply to E[G_Q] with g*=χ_cyc(g)^(−k−1)g^−1. Ordinary self-duality without the form’s symmetry is insufficient.
6. **MotivesAndAlgebraicCycles:MC.5** — Extend the existing rational Nori-category and pair-cohomology nodes by a functorial exhaustive finite weight filtration on H_c and exact weight-compatible Betti, de Rham and ℓ-adic realizations, Tate twists and projector images. FSY (3.1), p. 18 cites Huber–Müller-Stach Theorem 10.2.5 for weights; that original theorem has not been read here. Specify an extension Part II; MC.5’s current category nodes do not assert this contract. See G3.
7. **PadicDifferentialEquationsAndRigidCohomology:RD.4** — Use the actual overconvergent coefficient cohomology and compact-support complexes, finite-field Frobenius, Künneth, localization and finite-equivariant base-change maps for Dwork exponential coefficients on the Kloosterman tori. Retain coefficient-field extension to a field containing ϖ.
8. **PadicDifferentialEquationsAndRigidCohomology:RD.6** — Use the geometric Fourier transform, rigid trace formula, weights and purity for the indicated overconvergent exponential coefficient, compatible with supports and the signed symmetric projector. Fix d+ϖ dz and the F*→E multiplier exp(ϖ(z^p−z)); do not depend on an unchecked explicit Weyl-algebra Frobenius-series formula.
9. **tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier** — Consume the finite regular fan, character monoid, monoid-algebra charts and gluing on the existing toric carriers for the complex fiber. Its current main has these objects already. The Z/Q arithmetic extension and base-change compatibility needed by the Kloosterman model are additional Part II contracts, G7, rather than a new general fan implementation.
10. **CohomologyComparisons:CP.2** — Use the smooth-proper rational crystalline comparison with Frobenius and Tate-twist compatibility for the good integral compactification or resolution and its smooth proper boundary strata, then pass through the projector and boundary kernels.
11. **CohomologyComparisons:CP.3** — Use the filtered proper-smooth de Rham comparison over Q_p for the geometric compactification/resolution and every boundary stratum. Require strict compatibility with boundary maps, rational projectors and the Tate twist to identify D_dR(V_{k,p}).
12. **CohomologyComparisons:CP.4** — Use the proper semistable B_st comparison with Frobenius, N, filtration and boundary restriction over Q_p(sqrt(−p)) for a verified semistable Kloosterman model. This request does not assert existence of that model; the higher-thickness construction is G6.
13. **PadicHodgeTheory:R06.2** — Use exactness of de Rham and semistable period functors on admissible subquotients, the geometric comparison identification, crystalline descent in the good case, weak admissibility and the Newton/Hodge polygon inequality, with HT(χ_cyc)=−1.
14. **ArithmeticGaloisRepresentations:R01.5** — Use characteristic-zero Frobenius-polynomial recognition for one-dimensional continuous characters over a common coefficient field to identify the determinant character from the good primes p>k. No unobstructed coefficient descent theorem for arbitrary higher-dimensional systems is requested.

Six structural proposals preserve ownership: the missing holonomic/MHM companion;
Motives and Algebraic Cycles, Part II; Lefschetz Pencils and Vanishing Cycles,
Part II; Arithmetic Galois Representations, Part II; an arithmetic Part II of
Analytic Toric Geometry; and the boundary with KloostermanSheavesAndBesselIsocrystals.
No existing generic potential-automorphy, epsilon-factor, conductor, gamma-recipe,
Nori-category or Hodge-structure target is replanned. No cross-tier notion was moved.

## Source issues and review priorities

Nine source issues are recorded in the packet and reader, E1–E9. E1–E8 reconcile
previous extraction observations, including the reciprocal-root power, gamma
normalization, divisor restriction and exponential/Frobenius signs. They are not
represented as fresh independent erratum verdicts.

E9 is a new proof-gap observation requiring independent mathematical review:
in FSY's proof of Proposition 5.23, p. 50, the unit-thickness local equation does
not follow for all the orbit parameters in (5.6)/(5.16). At k=9,p=3,a=3 the
all-plus critical point has critical value 18, of 3-adic valuation two, whereas
a unit times (sqrt(−3))² has valuation one. Formal Morse reduction preserves
that smoothing thickness. RD.7's inspected Mieda node requires unit thickness.
The missing step is a higher-thickness resolution/comparison or another proof.
This observation does not disprove Proposition 5.23; the proposition remains a
target with G6. The all-prime de Rham and good-prime crystalline branches do not
use the disputed step. The pure associated-graded WD supplier is used only after
potential automorphy, and local epsilon constants are not falsely claimed rational.

The odd +1 root number still needs the exact original Saito theorem (G9).
The even two-adic factor, conductor exponent and sign remain their actual geometric
invariants; no Broadhurst–Roberts prediction is promoted to a theorem. The standard
Serre gamma factor and paper-normalized gamma product differ by the explicit
constant pi^(d(d+1)/4), which cancels in the functional equation.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/KloostermanMomentsAndPotentialAutomorphy.json`:
  zero errors and zero warnings; counts as above.
- `lean-check research/blueprint/suggested/KloostermanMomentsAndPotentialAutomorphy.lean`:
  elaborated successfully in the supplied shared pinned build. Its only diagnostics
  are 22 declaration-uses-placeholder warnings. No data definition has a placeholder.
  The final file has 174 lines, five definitions, ten named theorems and twelve examples.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/KloostermanMomentsAndPotentialAutomorphy.lean`:
  passes. Individual imports are used; there is no root-library import or local Lake project.
- A scratch consistency audit checked that every packet statement, hypothesis,
  proof step, API item, test and locator appears in the reader; both the node and
  layer prerequisite graphs are acyclic; all routed items have dispositions.
- Independent numerical checks in scratch verified the small moments and character
  independence at p=2,3,5,7; exact extension-field moments at q=2,4,8 give the
  stated Z_3(2;T) and Z_4(2;T). Integer recurrence tests include repeated roots.
  Hodge-position counts, dimension parity and characteristic-two degree formulas
  agree through k=500. These are consistency checks, not proofs or Lean implementations.
- `git diff --check`: passes. The change is restricted to the four issue deliverables
  and this handoff. No PDFs, source text, local absolute paths or generated build artifacts
  are part of the submission.

The scratch worklist, source downloads and temporary audits are removed once the PR
is submitted; everything needed to resume the mathematical follow-ups is in the five
deliverables. Resume with independent review of this complete design pass, not another
claim by this worker.
