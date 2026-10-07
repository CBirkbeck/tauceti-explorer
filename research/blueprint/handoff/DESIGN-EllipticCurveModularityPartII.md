# Handoff: DESIGN-EllipticCurveModularityPartII

## Result and scope

Codex, session `codex-KtiZyb`, completed the target-level planning pass for issue #3397 on branch `codex-KtiZyb-elliptic-modularity-part-ii`. The claim was confirmed by the swarm bot before work began. The five authorized deliverables define and plan the effective residual-comparison continuation. The issue explicitly permits planning the first independent direction and proposing splits for the others; the packet records every routed item and the three destinations.

The packet status is `complete` under PROTOCOL §0, not `closed`. EC.1, EC.2, EC.3, EC.4, EC.5 and EC.6 are all `planned`; none is closed. There are 31 nodes: 3 definitions and 28 theorems, 9 API items, 9 unit tests, 23 planets, 13 baseline declarations, 23 precise supplier-stage requests and 8 gaps. All implementation statuses are `unchecked`. Stop at this completed pass; independent review and the generated stage follow-ups discharge the remaining contracts and refinements.

## What is done

The six layers give Kraus F/G/H with the full lcm level and real square roots; Martin’s sharp dimension bound and equality classification; the removed-prime bound with all-conjugate norms; finite coefficient rationality and exact-conductor realization; finite mod-four recognition and the degree-two torsion repair; the Mazur/Kenku inputs and the two uniform irreducibility thresholds; and Lemos’s restricted rational-isogeny uniformity theorem. The 8,678-word reader includes each node’s mathematical statement, proof route, direct dependencies, source locator and acceptance criteria. It includes the definition APIs and tests, library boundaries, complete supplier contracts, source obligations and split rationale.

The parent R29 modularity theorem is imported, never replanned. R20.6’s reduced level is distinguished from the prime-to-characteristic residual conductor. Kraus’s weight-two and irreducibility hypotheses are retained. Characteristic-zero Sturm equality is distinguished from ideal-valued congruence, geometric non-CM from rational endomorphisms, and cyclic rational kernels from individually rational torsion. EC.5 is not a prerequisite of the parent’s fixed-curve irreducibility argument. EC.6 is the proved rational-isogeny restriction, not unrestricted Serre uniformity.

Read the reviewed AUDIT-11, AUDIT-16 and AUDIT-13 boundaries, the upstream EllipticCurves and ModularForms reader documents, the parent and relevant supplier descriptions, the existing R20/R19 node statements and the related links. There is no reviewed audit specifically for this new roadmap. The 13 cited baseline statements were read in source at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the index was used only for discovery and validation.

## Source record

The packet’s `sources` and `sourceVersions` retain public URLs, versions, access date 2026-10-07, hashes and the exact portions read. Bennett–Siksek, Kraus and Mazur were read in published PDFs/scans. Martin is arXiv math/0306128v1 and Lemos is arXiv:1702.01985v2; the published versions were not substituted silently. All short node excerpts were checked against normalized extracted text. The square roots and threshold formulas were also inspected visually in the published Bennett–Siksek p. 360 and Kraus p. 1144. No published-source mistake was established, so `sourceIssues` is empty. Lemos’s sketch is attributed as a sketch with explicit proof obligations, not diagnosed as an erroneous theorem.

The source texts are scratch material and are removed when the pull request is open. Resume from the public URLs and hashes in the packet; no persistent note depends on a scratch file.

## Precise remaining work

### Norm comparison and residue characteristic divisibility

Confirm the precise integer-ring/field norm comparison and ℓ|Norm(λ) for λ above ℓ from pinned NumberField ideal norms; the three cited baseline lemmas alone do not establish this adapter.

Affected nodes: `EllipticCurveModularityPartII:EC.2/norm-bound`.

### Mod-four image argument for the two-isogeny repair

Kraus cites Serre [25], IV-6. Enumerate the subgroups of GL₂(ℤ/4) whose elements satisfy det(1−g)=0 mod 4, and prove a stable quotient with trivial mod-2 action; read the cited argument before proof execution. The source paragraph alone is not a supplied subgroup proof.

Affected nodes: `EllipticCurveModularityPartII:EC.4/two-isogeny-repair`.

### Mazur’s arithmetic prime-isogeny inputs

Read and decompose the formal immersion and finite Eisenstein quotient inputs in Mazur §§1,4–6, the isogeny-character analysis, the complete small-level rational-point lists, and the class-number-one theorem. Only the introduction and §7 proof have been read in this pass; no generic ModularCurves supplier is claimed to contain these arithmetic theorems.

Affected nodes: `EllipticCurveModularityPartII:EC.5/mazur-prime-isogenies`.

### Composite cyclic-isogeny exclusions

Obtain and read Kenku’s classification proof and its predecessor modular-curve papers. The publisher of Kenku 1982 returned 403. Needed here are the finite forbidden 2ℓ and 4ℓ degrees after Mazur’s prime restriction; do not use the prime theorem or rational torsion classification as a replacement.

Affected nodes: `EllipticCurveModularityPartII:EC.5/two-torsion-isogeny-exclusions`.

### Cartan-level compactifications and Chen’s isogeny proof

The existing Γ₀/Γ₁ compactification scope does not supply Xns⁺(p) and the mixed fiber products. Assign their common compactified Cartan-level owner, and read Chen 1998/2000 and Darmon–Merel §6 for the explicit correspondence/isogeny. The imaginary-quadratic split proposes mixed level 3 and 5 models, so a shared general extension should supply both families.

Affected nodes: `EllipticCurveModularityPartII:EC.6/chen-correspondence`.

### Darmon–Merel winding and formal-immersion inputs

Read Darmon–Merel Propositions 7.1 and Theorem 8.1, Lemma 8.3 and the local specialization hypotheses, including residue characteristic 2, for r=2,3,5,7,13. Lemos supplies a sketch and refers the nonvanishing/rank-zero and local details to that paper. These are owned special arithmetic targets here, not established by the sketch.

Affected nodes: `EllipticCurveModularityPartII:EC.6/rank-zero-quotient`, `EllipticCurveModularityPartII:EC.6/cuspidal-formal-immersion`, `EllipticCurveModularityPartII:EC.6/j-prime-integrality`.

### Arithmetic exclusions of split and exceptional Cartan images

Read Bilu–Parent–Rebolledo Ann. Inst. Fourier 63 (2013), 957–984 and Serre’s exceptional-image local argument; verify p>37 and non-CM hypotheses. R01.4 supplies group classification, not the rational-point exclusion theorem.

Affected nodes: `EllipticCurveModularityPartII:EC.6/large-proper-image`.

### Complete finite image certificates

Lemos checks LMFDB/Sutherland output but no certificate data was fetched or verified here. Reconstruct every representative in the five integral lists and six non-CM higher-level values, prove the modular j-map and high-level rational-point lists, and attach complete exceptional-prime certificates valid for all primes, with software/data versions. Reading the published Lemos version and checking it against v2 is also required before executing this route.

Affected nodes: `EllipticCurveModularityPartII:EC.6/finite-image-certificates`.

## Supplier requests

These are recorded contracts, not messages sent to other workers or changes to their files. Exact supplying blueprint nodes are used where available; stage requests below are used where a matching export is absent. Review each against the supplier’s eventual node statement before replacing it. Do not reconstruct those suppliers in this packet.

- `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`: General Γ₀ dimension formula, μ index/product formula, and the elliptic/cusp correction counts. Consumers: `martin-bound`.

- `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`: Old/new decomposition in each fixed character; compatibility of Γ₀ newspace with the trivial-character intersection inside Γ₁. Consumers: `martin-bound`.

- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`: Finite coefficient field of a normalized newform; embeddings inject into its normalized newform orbit, so degree≤dimension. All Fourier coefficients are algebraic integers in the full coefficient field. Coefficient-field degree bounded by dimension of the trivial-character newspace. Consumers: `removed-prime-bound`, `finite-rationality`, `small-prime-integrality`.

- `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`: Conjugate newforms of trivial character stay in the same newspace. Conjugate newforms and rationality from invariance under all embeddings. Consumers: `removed-prime-bound`, `finite-rationality`.

- `AutomorphicGaloisRepresentations:R19.3`: Weight-two good-prime purity bound |σ(c_p)|≤2√p for every embedding at p∤M₀. All-embeddings purity bounds for f at q∤N. Consumers: `removed-prime-bound`, `small-prime-integrality`.

- `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`: Full prime-power coefficient recurrences and bad-prime coefficient values for weight-two trivial-character newforms. Hecke recurrences and depletion operators at bad primes, including the Γ₀(4) weight-two Eisenstein series used in Kraus Appendix II. Consumers: `finite-rationality`, `finite-mod-four`.

- `ComputationalNumberTheory:CN.3`: Intrinsic q-expansion recognition using the finite-index Sturm bound, with prime-to-all-coefficient Hecke reconstruction. Exact model and j-map certificates for X₀(2),X₀(3),X₀(5),X₀(7),X₀(13); finite divisor enumeration linked to the intrinsic moduli curves. Exact rational-point and j-map certificates at levels 11,17,37, plus verified Galois-image recognition for each explicit elliptic curve. Consumers: `finite-rationality`, `integral-isogeny-j-values`, `finite-image-certificates`.

- `SerreWeightAndLevelOptimisation:R20.4`: For weight 2 residual elliptic representations in characteristic≥5: a normalized trivial-character newform at the exact prime-to-ℓ conductor, with a place above ℓ. Consumers: `small-prime-integrality`.

- `ArithmeticGaloisRepresentations:R01.6`: At q≠ℓ, conductor exponents cannot drop from additive elliptic reduction for ℓ≥5; good and removed-multiplicative trace congruences at the exact residual conductor. Exact-conductor removed-multiplicative trace formula and conductor invariance under prime-to-ℓ isogeny. Conductor invariant under rational isogeny. Local residual conductor exponents for ℓ≥5: multiplicative removal criterion and equality at additive primes. Invariant lines in E[ℓ] are exactly Galois-stable cyclic ℓ-subgroups; residual oddness from the Weil pairing. Tate-curve residual matrices and local cyclotomic character, including q=p. Consumers: `small-prime-integrality`, `small-trace-transfer`, `two-isogeny-repair`, `quotient-conductor-adapter`, `irreducible-full-two`, `irreducible-one-two`, `nonsplit-potential-good`.

- `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`: Hasse bound at every good reduction of E. Hasse bound for both good-reduction curves. Consumers: `small-prime-integrality`, `small-trace-transfer`.

- `ModularCurvesPartII:R14.5`: Dimension-one quotient of J₀(N) for rational weight-two primitive f; the quotient is an elliptic curve. Consumers: `rational-newform-curve`.

- `AutomorphicGaloisRepresentations:R19.4`: Exact conductor of the quotient, including bad primes and monodromy. Consumers: `rational-newform-curve`.

- `ArithmeticGaloisRepresentations:R01.5`: Recognition of semisimple residual representations by characteristic polynomials over a common residue field; descent to ℚ’s ℓ-torsion coefficient field. Chebotarev recognition of the determinant condition det(1−Frob)≡0 mod 4. Consumers: `rational-newform-curve`, `two-isogeny-repair`.

- `AlgebraicModularFormsAndSerreWeights:R15.2`: Ideal-valued Sturm congruence bound at general finite index for integral q-expansions, including characteristic 2 and ideals (2)^2. Consumers: `finite-mod-four`.

- `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`: Prime-to-residue-characteristic torsion reduction is injective at good reduction. Local potentially multiplicative curves as quadratic twists of Tate curves and the j-integrality criterion. Consumers: `small-trace-transfer`, `nonsplit-potential-good`.

- `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`: Quotient by a rational point of order two, dual isogeny, and inverse on odd torsion. Quotient by a finite Galois-stable subgroup, dual 2-isogeny and kernel-composition properties. Consumers: `two-isogeny-repair`, `two-torsion-kernel-transport`.

- `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`: Compatible Galois actions on E[2] and E[4]. Actual pointwise torsion and its Galois action; coprime torsion decompositions. Consumers: `two-isogeny-repair`, `two-torsion-kernel-transport`.

- `AlgebraicModularFormsAndSerreWeights:R15.4`: Finite-flat weight-two consequence for elliptic residual representations, retaining the coefficient-prime local hypotheses. Consumers: `quotient-conductor-adapter`.

- `ModularCurvesPartII:R12.2`: Rational noncuspidal points of Y₀(r) classify Galois-stable cyclic r-subgroups up to the appropriate twists. Consumers: `mazur-prime-isogenies`.

- `ArithmeticGaloisRepresentations:R01.4`: An odd irreducible two-dimensional representation over 𝔽ℓ for odd ℓ is absolutely irreducible. Normalizer quotient of order two and eigenvalue test for elements of a nonsplit Cartan. Classification of proper GL₂(𝔽p) images with surjective determinant and the elliptic exceptional-image exclusions. Index-two subgroups and abelianization of GL₂(𝔽p), including determinant and central scalar −I. Consumers: `irreducible-full-two`, `irreducible-one-two`, `nonsplit-potential-good`, `large-proper-image`, `surjectivity-twist`.

- `ModularCurvesPartII:R14.2`: Jacobians, Picard pushforward/pullback and Hecke action for the compactified curves once their Cartan-level construction is supplied. Consumers: `chen-correspondence`.

- `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`: Quadratic-twist classification for non-CM rational j and the Galois point-action comparison. Consumers: `surjectivity-twist`.

- `ComputationalNumberTheory:CN.5`: Pinned input data and machine-checkable certificate format for the complete exceptional-prime lists; no database assertions as axioms. Consumers: `finite-image-certificates`.

## Splits and common ownership

Keep this roadmap as EC.1–EC.6, covering all seven Bennett–Siksek route items. Assign the 27 Caraiani–Newton items to `EllipticCurveModularityImaginaryQuadratic`, the three Khare–Wintenberger items to `EllipticCurveModularityPartIIGL2TypeAbelianVarieties`, and the 62 BCDT items to `EllipticCurveModularityWild3Adic`. Their full item lists are in `routeCoverage`; the packet’s split proposal describes the endpoints, the GL₂-type input to the Q-curve argument and the alternative wild modularity proof. The common Cartan-level compactification extension must have one owner before EC.6 and the imaginary-quadratic branch consume it. No separate deliverables for these proposed roadmaps were created.

## Suggested file and checks

The suggested file is **not compiled at the pinned baseline**. A single preliminary `lean-check` invocation exited immediately because the supplied shared build lacked the object file for `TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Add`. Inspection then showed that its Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the required `f790474`; the supplied pinned source tree has no Lake build. The existing shared Tau Ceti checkouts inspected were also at other commits. No pinned complete build was available, and no build or dependency download was attempted. Available memory was above 20 GB before the invocation. There is no compilation left running by this job.

The file imports individual pinned modules and uses actual newform/newspace, point, norm, endomorphism and representation carriers. Definition signatures, all nine API signatures and all nine unit-test examples are present. Planned supplier adapters are typed data and explicitly marked as imported interfaces; they are not new owned declarations in the packet. Conditions lacking a faithful signature are not fabricated as arbitrary proposition fields. The small-prime residual coefficient comparison and the rational modular-quotient comparison omit signatures until coefficient extension is available. EC.6’s Cartan geometry, local formal immersion, twist comparison and finite certificates are named and explained in comments, with their mathematical statements in the packet and reader. The full-two kernel transport and degree-two isogeny also need the eventual quotient interface to express all outputs. A reviewer or follow-up with the complete pinned build must elaborate the file and reconcile those interfaces with supplier exports.

Validation performed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityPartII.json --index <supplied pinned declaration index>`: 0 errors, 0 warnings; 31 nodes, all six stages planned.
- Both JSON files parse. Roadmap descriptions derive from the same node statements as the packet, and the reader includes every node, API item and unit test.
- Short source excerpts match the read texts after Unicode/accent and whitespace normalization; source hashes and source-version records are retained.
- All graph prerequisites resolve through baseline declarations, packet nodes, supplying blueprint nodes, requested stages or the eight stated gaps. Planet names stay within six per layer and the length limit.
- Only the five issue deliverables are included in this job’s branch.

## Where to resume

Independent review should first check the split permission and item coverage, the exact conductor/weight adapter, the mod-four recognition and repair, the arithmetic cyclic-degree exclusions, and the EC.6 Cartan/formal-immersion/certificate obligations. For stage follow-ups, obtain the source named in each gap, fix the supplier ownership for Cartan compactifications, replace each requested stage with an exact sufficient node, and refine only the newly assigned open stages. Published-version collation of Lemos and the complete exceptional-prime datasets precede executing EC.6. A complete pinned build is required before claiming elaboration of the suggested file. No second job is claimed by this session.
