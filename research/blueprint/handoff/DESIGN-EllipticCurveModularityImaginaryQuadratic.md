# DESIGN-EllipticCurveModularityImaginaryQuadratic

Issue #6898. Worker: Codex, session `codex-Fj5emA`. Claim confirmed 7 October 2026. Branch: `codex-Fj5emA-imaginary-quadratic`.

## Result and coverage

The design pass is complete at target granularity, ready for independent review. It supplies the new roadmap definition, blueprint packet, reader and suggested Lean file. All 27 routed Caraiani–Newton items have explicit `routeCoverage` entries. The packet has 68 nodes: 18 definitions, 43 theorems, 5 constructions and 2 comparisons; 69 API items, 69 unit tests, 31 planets and 15 pinned baseline declarations. Every definition/construction has three API items and three tests. All implementation statuses remain `unchecked`.

Every layer IQ.1–IQ.8 is **planned**; none is **closed**. The sixteen gaps and thirty-five requests are part of the complete plan, not a claim that its prerequisite mathematics or computation certificates exist. There are no unplanned targets and no unfinished continuation of this design pass. Review and the precise closure work below remain.

The packet and reader contain the full hypotheses and proof outlines. In particular, the final unrestricted modularity theorem retains the finiteness of X₀(15)(F), and the CM lifting and Q-curve inputs stay with their concurrent owners. The general Cartan extension is proposed once in ModularCurvesPartII. Do not replan CN §§2–5, GL₂-type abelian variety modularity, general residual-image classification, or general Chabauty here.

## Validation and Lean

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityImaginaryQuadratic.json` reports zero errors and zero warnings. All 206 packet declaration/API/test names occur in the suggested file, and their reader entries agree. Independent exact rational/quadratic arithmetic checks verified the two homogeneous quartic involution identities, their exceptional point coordinates, the Gaussian and √−11 discriminants and j-invariants, the genus-one points, and the genus-two roots and imaginary points. These checks verify literal coordinate identities only, not the missing geometric maps, ranks or certificates.

The suggested file elaborated using `lean-check` with exit code 0 and only the expected `declaration uses sorry` warnings. Memory availability was checked before each compile. Lean was v4.34.0-rc2; the shared build has Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, matching the pin. Its Tau Ceti checkout differs from the source baseline `f790474821cf4256814db967cb154e7af3d0c369`, so the file imports only Mathlib modules. This is an elaboration of the Mathlib prototype, not a joint pinned Tau Ceti build. No language server, library build, dependency update or cache download was started.

The executable part uses genuine Mathlib Weierstrass, affine-point, polynomial, multivariate-polynomial and rational-function carriers. It includes 124 packet names (18 concrete definitions with their algebraic API/tests and selected algebraic constructions). Missing automorphic, compactified-modular-curve, Picard and arithmetic interfaces are preserved as full named mathematical contracts in the comment ledger. These are withheld signatures, not executable formalizations; no fake type, arbitrary proposition field or axiom substitutes for them. Every geometric lift and the full API still needs its genuine supplier before executable signatures can be added.

## Resume closure work

Start from the packet's `coverage`, `gaps` and `requests`, and the reader's corresponding declarations. Keep existing node IDs. Resolve requests with actual supplier declarations and verified statements; do not invent IDs for the two concurrent siblings. Then refine their consumers and replace withheld Lean signatures as genuine interfaces become available. The following are the exact remaining inputs.

### G1 — Automorphic and geometric-CM carriers

The pinned libraries have the Weierstrass curve but no complete number-field GL₂ automorphic representation/rπ carrier, weight-zero predicate or geometric-CM comparison needed for Modular. R16.4, the requested CM extension of R16.6, AG2.7, R01.6 and EllipticCurves are imported; the suggested file records the full declarations as named comments until those genuine carriers exist. No arbitrary proposition fields or phantom representation types are introduced.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/all-primes`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/automorphic-uniqueness`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`.

### G2 — Monodromy upgrade and p-adic ordinarity

AG2.5 supplies Varma semisimplified compatibility and monodromy bounds, not automatically the full CN 6.1.3(3) isomorphism for E. Request the pure elliptic WD comparison at all finite places and the Geraghty Steinberg-twist ordinarity criterion with coefficient/weight conventions. The source proof has been read; their full foundational declarations have not been located in the baseline.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/multiplicative-ordinary`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne`.

### G3 — CM globalization and Hilbert local conditions

Supply a proof-level globalization lemma for finite solvable local extensions and split CM places, avoiding a specified finite Galois field while splitting the retained generic prime. IG.2 supplies Hilbert specialization but its current stage alone does not establish this local CM globalization. Also supply nonemptiness/openness for the AKT 9.7 discriminant conditions with each prescribed p-adic prototype. The conditions and consumers above specify the exact work; a formaliser cannot replace this by unconstrained solvable base change.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three`.

### G4 — Independent AKT CM lifting seed

The AKT Theorem 7.1 CM dihedral 2-adic theorem is not supplied by the classical nonsolvable R22.6/R32.3 statements. Its hypotheses are decomposed-generic dihedral residual image with quadratic field M/K, extension to GK⁺→GL₂(𝔽2), almost-everywhere unramified ρ, ordinary weight-zero triangular local shape (α,*;0,ε⁻¹β) with α,β unramified, unipotently ramified WD at 2, Mv=Kv(√u) with odd valuation u, and Kv(√−1)/Kv unramified at every v|2. AKT Theorem 8.1 needs det ε⁻¹, almost-unramified, ordinary weight λ, residual ordinary automorphy, decomposed genericity, cyclotomic absolute irreducibility and its p=5 PSL₂ exception. Propose an OrdinaryAutomorphicFormsAndModularityLifting Part II CM extension for these general theorems; do not silently claim R21.4 supplies them. AKT 9.6 discriminant-preserving mod-2/mod-3 coupling and 9.4 sixth-power descent are requested from the modular-curve twist owner. For AKT 7.1 the quadratic residual field is ramified at every v|2 and ρ is valued in Q̄₂. For AKT 8.1, λ lies in (ℤ²_{+,0})^Hom(K,Q̄p), π is cuspidal on PGL₂(𝔸K), cohomological and ι-ordinary, and its residual rπ is isomorphic to ρ̄; the output has weight ιλ. The source-specific application uses weight zero. For AKT 9.6 the discriminants of A,E agree modulo (K×)⁶ and E[3] is irreducible; the coupling curve has symplectic 2-torsion A[2] and symplectic 3-torsion E[3], and the same discriminant squareclass modulo sixth powers.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three`.

### G5 — Concurrent CM lifting contract

CrystallineLocalGlobalCompatibilityCM has no written roadmap or reserved node at this checkout. Its accepted split owns CN Theorem 5.2. Required contract: p odd; F imaginary CM; continuous almost-unramified ρ with det εp⁻¹, potentially semistable labeled weights {0,1}; residual decomposed generic and absolutely irreducible over F(ζp); if p=5 and the projective restricted image is PSL₂(𝔽5), the projective field excludes ζ5. Residual π on PGL₂(𝔸F) has weight 0 and matching residual representation; at potentially crystalline places rπ is potentially ordinary iff ρ is, with monodromy zero; at other p-adic places π is ordinary and rπ is not potentially crystalline. Then ρ is automorphic of weight 0. No theorem or proof of §§2–5 is replanned here. Replace this gap by the supplier’s eventual declaration ID and verify its exact hypotheses; source extraction E12 affects wider odd-prime projective-image arguments, whereas this application uses only p=3,5. The printed source states irreducibility of the Q̄p-residual cyclotomic restriction; in this coefficient field this is absolute irreducibility. Its residual automorphic match is ρ̄≅r̄π, and monodromy-zero in the crystalline clause refers to recFv(πv). The output is cuspidal on PGL₂ with rΠ≅ρ. Only the p=3,5 specializations are required here.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity`.

### G6 — Number-field quantitative Hilbert image estimate

Read Zywina Proposition 5.2: its large-image estimate is required for the fixed mod-5 exceptional set with coefficient norm height over F. ST.2 needs this source-scoped extension, plus the lattice denominator asymptotic and negligibility of the singular locus. R01.4 needs the Allen–Newton 2.3 Galois-field genericity corollary; no declaration currently gives that exact contract. These inputs cannot be replaced by qualitative Hilbert irreducibility.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.3/density-one`.

### G7 — Shared Cartan compactification and genus-zero coordinate certificates

Upstream ModularCurves layer 9 gives affine coarse quotients; its layer 10 is diamond-level and R13.4a is full/Γ₁/Γ₀ compactification. The general Cartan and mixed-level extension is not present. This packet specifies its source-specific adapter, and proposes placing the reusable extension once in ModularCurvesPartII for both this roadmap and effective-comparisons EC.6. Need normal/geometrically integral fibers, finite quotient descent, smooth proper extension of all maps and cusp/j comparisons, plus proof-level coordinate normalizations of the five genus-zero models. No fine universal curve over a −I coarse quotient is asserted.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models`.

### G8 — Elliptic quotient map and generator certificate

The Magma source has been read, not run. Export and verify the birational inverse of the mixed model and its direct projective Weierstrass identification on all charts, together with an exact rank/torsion/saturation certificate for B(ℚ). A database label and a printed MordellWeilGroup output are insufficient as proof inputs.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.4/mixed-elliptic-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil`.

### G9 — Level-fifteen torsion and Gaussian comparison certificates

Kwon’s original theorem was not obtained in this run; CN’s cited special cases have been read, and FLHS v4 15.3–15.4 give the original models, but exact coordinate changes, j-maps, division-polynomial quadratic torsion enumeration and the eight Gaussian j-value orbit table still require certificates. The public LMFDB curve equation was read; its Faltings–Serre proof object, automorphic eigenform, residual comparison extension and exhaustive finite test-prime certificate were not available. Need these exact artifacts, including justification of the prime bound, not just a finite list of matching traces.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth`.

### G10 — Concurrent Q-curve and real-quadratic endpoints

EllipticCurveModularityPartIIGL2TypeAbelianVarieties has no written stage or reserved node here. Its accepted split owns: a non-CM elliptic Q-curve over a quadratic field F, isogenous over F̄ to its ℚ-conjugate, is modular over F, via a modular GL₂-type abelian variety over ℚ and the coefficient/endomorphism descent. The degree-3 and degree-5 Fricke instances below consume that theorem, never replan it. The all-quadratic Corollaries 7.2.5, 7.3.4 require the known FLHS real-quadratic endpoint, which is outside this imaginary-CM roadmap; ML.1 must register or route this separate real-quadratic supplier before marking those universal statements closed.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-modularity`.

### G11 — Genus-one Jacobian and rational linear-system certificates

Supply a proof-producing binary-quartic Jacobian transformation to 45A2, two-descent rank upper bound, explicit rational divisor classes/principal functions and the weighted local 3-adic obstruction. Check the corrected RR bases as bases of the complete linear systems, not merely algebraic fiber identities; this includes all pole charts and the degenerate leading-coefficient case in 7.2.1. Bruin–Flynn §2 supplies the conceptual Brauer–Severi descent; its general construction belongs to JacobianChallenge, not a private Picard group here.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-jacobian`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quadratic-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes`.

### G12 — Genus-two model, Jacobian and enumeration certificates

The complete b3ns5.m file was read but no Magma run was performed. Needed: birational maps and their inverse over the smooth normalization; j and w3 compatibility; certified two-descent rank upper bound and independent torsion generators; exact finite-field group certificates; the full twenty-class Mumford table and effective representatives. The counts 9+2+2+6=19 are source conclusions, not an exported exhaustive certificate. The six real classes are kept separate.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-mordell-weil`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points`.

### G13 — Exceptional image and conjugate-label certificate

Need a proof-producing full mod-5 normalizer-image certificate, determinant-one absolute irreducibility calculation, and normalization-map evaluation for the source point. LMFDB 8100.2-a2 could not be read because its public page required an anti-bot challenge; 8100.3-a2 also could not be independently retrieved. The source equation and its j-identity were read in the author script. Establish the exact conjugate-conductor label relation; do not infer that either source has a typo from differing labels.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-comparison`.

### G14 — Quartic normalization, quotient and rank certificates

The author scripts were read in full but not run, including their calls into external quartic/hyperelliptic packages. Needed: certified smoothness, canonical maps and inverse model isomorphisms; ℚ-automorphism-group order; all projective quotient and j-maps; source-point comparison for j=−32768; Cartan/Hecke isogeny specializations; exact elliptic factor rank certificates. The literal polynomial and linear-coordinate identities can be prototyped independently of these gaps.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks`.

### G15 — Quartic torsion and finite sieve certificates

Needed: principal/nonprincipal function witnesses for D10,D2; exact Jacobian reductions at 7,11,13; saturated B generator and base divisor; the eight first-curve pullbacks and all sixteen second-curve exceptions with support fields; reduction group maps; annihilator differential reductions and local symmetric/relative ranks; finite bad-coset tables and the empty intersection at 11,43. No Magma output or dependency-package version/certificate was exported in this design run.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-sieve`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-sieve`.

### G16 — Small-field rank-zero certificates

Need exact algebraic rank-zero certificates for the twists of E15 by −1,−2,−3,−5 and the quadratic-extension rank comparison in the point-group convention. CN states these four applications; no descent output was produced in this design run.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-examples`.

## Ownership and requests

The thirty-five `requests` are already in the packet with exact contracts and consumer IDs. They are mathematical planning requests, not GitHub tickets or messages sent to other workers. Their suppliers are GL2AutomorphicRepresentationsAndTransfer, AutomorphicGaloisRepresentationsPartII, OrdinaryAutomorphicFormsAndModularityLifting, ArithmeticGaloisRepresentations, PadicHodgeTheory, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticStatistics, ModularCurvesPartII, EllipticCurveModularity, EffectiveDiophantineMethods, ComputationalNumberTheory, ModularityAndLanglandsExtensions and the upstream Tau Ceti EllipticCurves, ModularCurves and JacobianChallenge roadmaps.

The three restructuring proposals assign the reusable Cartan/mixed compactification and Chen/index extension to ModularCurvesPartII, the independent AKT CM ordinary/dihedral seed to OrdinaryAutomorphicFormsAndModularityLifting Part II, and the CM weight-zero interface to GL2AutomorphicRepresentationsAndTransfer Part II. The upstream note records the rational-Picard/Brauer–Severi interface for JacobianChallenge. These proposals have not been applied to other roadmaps.

CrystallineLocalGlobalCompatibilityCM owns CN Theorem 5.2 with the complete p=3,5 contract in G5. EllipticCurveModularityPartIIGL2TypeAbelianVarieties owns the quadratic Q-curve endpoint in G10. Neither has a written stage or reserved node at this checkout. When their plans land, check their hypotheses and record their real declaration IDs. The FLHS real-quadratic endpoint must also be routed before the two all-quadratic genus-one/genus-two corollaries can close.

## Source provenance and limits

Public sources were read on 7 October 2026. Exact links, locators, source revisions and downloaded-file hashes are in the packet and reader. Sources consulted:

- Caraiani–Newton, arXiv:2301.10509v3 (27 March 2025): §1, Theorem 5.2 statement, and §§6–7 including their proofs. Theorem 5.2 is an imported input; its proof is outside this job.
- Allen–Khare–Thorne, arXiv:1910.12986v2 (2 September 2022): Theorems 7.1 and 8.1 and the relevant §9 seed, discriminant, twisting and switching passages. The hypotheses of those independent seed theorems are recorded explicitly; their entire foundational proof is not replanned.
- Freitas–Le Hung–Siksek, arXiv:1310.7088v4 (18 July 2014): introduction and §15, including Lemmas 15.3–15.4. Its preprint numbering differs from CN's published-reference numbering.
- Box, author version of 17 July 2019: §§1–2 and Proposition 3.1 with proof. Only its weak pullback index statement is used; equality of the full Mordell–Weil group with the pullback subgroup is not assumed.
- Bruin–Flynn, author text *Rational divisors on curves*: §§1–2, for rational-divisor-class descent and its Brauer–Severi obstruction.
- Zywina, author text *Elliptic curves with maximal Galois action on their torsion points*: §1.1 height convention and Proposition 5.2 with its proof inputs. The quantitative number-field specialization remains G6.
- The five relevant author Magma files (`b3ns5.m`, `ns3ob5.m`, `ns3ons5.m`, `s3ns5.m`, `ns3ns5-elliptic.m`) and project README at commit `e6e2e9014f55f91e1d27a23e225a5f474d2e1d81` were read completely as source, never executed. No generated maps, group tables, reduction data, saturation results or sieve certificates were exported; dependencies called by those scripts were not downloaded or read.
- The public LMFDB Gaussian curve equation was read. The √−11 curve pages required an anti-bot challenge, so differing conductor labels were recorded as an unresolved conjugate-label comparison, not a source error.

Kwon's and Derickx–Najman–Pomerance's original torsion sources were not obtained or read; only CN's cited special cases were read. Gaussian Faltings–Serre proof objects, Magma dependency versions/output and the arithmetic certificates named above were not available. The source-version check found no correction for the six recorded short source issues, but it is not an exhaustive erratum search.

Six source issues are recorded with independently checked passages and corrected consumer statements: E4 (base-field symbol in switching), E5 (torsion-growth curve subject), E9 (second pullback subgroup), E17 (mixed-level prime index), E18 (the two local primes interchanged), and E19 (an extra factor in the printed Riemann–Roch basis). Inherited extraction findings are leads verified here, not an independent-review verdict. Preserve these corrections and their locators in review.

No scratch file is needed to resume: all durable statements, supplier contracts, locators, hashes and limitations are in the five deliverables. Scratch papers and logs are deleted after submission. The next work is independent review and the specific closure follow-ups; this worker takes no second issue.
