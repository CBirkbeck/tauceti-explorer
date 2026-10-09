# BP-InverseGaloisAndArithmeticFundamentalGroups — completed target-level plan

Agent: Codex — codex-dnoMya. Refs #1013. One issue claimed and one submission. The [winning claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/1013#issuecomment-6088681343) identifies this session. Branch: codex-dnoMya-inverse-galois. The fifteen-node rational-specialization component from Codex codex-hjdg0j is retained with its IDs, statements and native signatures. This submission extends that checkpoint across the whole assigned roadmap.

## Outcome and coverage

The packet has status complete, part null and exactly IG.0–IG.6 in scope. Every target is planned at the target-level granularity in detail.json. All 137 nodes have implementationStatus unchecked. A complete plan is not a closed stage, a source decomposition or a formal implementation. The plan stops here because all seven stages are planned, as PROTOCOL §0 requires; further reading and typing are explicit follow-up obligations.

| Item | Count |
| --- | ---: |
| Definitions | 20 |
| Constructions | 31 |
| Comparisons | 8 |
| Theorems | 63 |
| Lemmas | 8 |
| Applications | 7 |
| Total nodes | 137 |
| API items | 203 |
| Definition/construction tests | 154 |
| Planets | 33 |
| Inspected baseline declarations | 67 |
| Gaps | 27 |
| Supplier requests | 49 |

| Stage | Nodes | Status | Closure |
| --- | ---: | --- | --- |
| IG.0 | 12 | planned | open: precise remaining obligations in coverage |
| IG.1 | 11 | planned | open: precise remaining obligations in coverage |
| IG.2 | 27 | planned | open: precise remaining obligations in coverage |
| IG.3 | 19 | planned | open: precise remaining obligations in coverage |
| IG.4 | 28 | planned | open: precise remaining obligations in coverage |
| IG.5 | 31 | planned | open: precise remaining obligations in coverage |
| IG.6 | 9 | planned | open: precise remaining obligations in coverage |

The reader contains approximately 48252 words. It gives the target statements, hypotheses, proof routes, prerequisites, sources, API uses, 203 API statements and 154 tests, followed by supplier, gap and routed-item ledgers. The sourceRouting ledger reconciles 151 candidate routed items: 150 owned/imported here and Chen/4 excluded as the separate NonabelianLevelStructures congruence theorem. No pending design stage is invented for that excluded item.

## Ownership and source discipline

The accepted RS-29/REV-RS-29 title and boundary are retained: Belyi maps, dessins d’enfants, and three-point covers, Part II: inverse Galois theory and arithmetic fundamental groups, with BelyiMaps first. Three-point Riemann existence, dessins, the existing descent and arithmetic actions remain upstream imports. The full issue, WORKERS, blueprint and expansion protocols and UPSTREAM_GUIDE were read; the reviewed library audit, stage/consumer contracts, accepted source routes, relevant links, reservations and tier order were checked. No applicable AGENTS.md was found; no agent delegation was used.

The implemented baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Native abstract Galois categories, finite étale affine algebras, finite scheme morphisms, étale scheme morphisms, field Galois theory, FreeGroup, TauCeti.BraidGroup, Frattini, nilpotence and solvability were reused only within their inspected scopes. The finite scheme fiber bridge, Noohi reconstruction, scheme/stack completion exactness and profinite complement conjugacy are not asserted native.

Current TauCetiRoadmap main df8020193b157c047bcaa0381c3f0d6c3f605dcb and current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were read separately, read-only. ProfiniteArithmetic and PeripheralActions documents were read in full; current BelyiMaps11–13, ProfiniteProPGroups5 and PolynomialGaloisGroups9 statements and their relevant proof/contracts were inspected. The generic finite weak embedding problem and arbitrary abelian-kernel obstruction already belong to ProfiniteProPGroups5. This roadmap adds arithmetic properness, place conditions and global realization; it does not reconstruct that generic theory. Current roadmap plans are not listed as implemented declarations at the pin.

At tier six the finite-cover path kernel, restricted smooth-curve tame tangential fiber, integral thin-set count, restricted finite-module global duality and finite Hurwitz cohomology/trace/weight adapters are owned here. Their later-tier generalizations in nonabelian/anabelian, sieve, global duality, étale duality and weight theory must import these kernels. Record these changes when revising the higher plans; do not restore upward dependencies on them. General moduli/quotient stacks, sites, topology, norm tori and semisimple group foundations remain imports from their lower owners. The norm-torus construction specifically imports ReductiveGroupsPartII:RG2.0a/norm-torus.

The 38 source records identify exact inspected editions, URLs, hashes where available and read sections. They do not claim a complete reading of every source or its background citations. Results and proof plans are written in our own words; no source passage or restricted file is reproduced. No uncleared book copy was used. Fried–Jarden, Huppert, Ribes–Zalesskii, Malle–Matzat and original duality/patching references that could not be read lawfully in the available source set remain precise reading obligations.

Important source boundaries: SGA1 X1.8 gives the proper case, while nonproper characteristic-zero algebraically closed extension invariance needs its own argument. SGA1 XII5.1/5.2 are printed pp.251–253, not the earlier erroneous locators. The complete tame fundamental group in characteristic p is distinguished from its prime-to-p free quotient. Schmidt–Wingberg’s solvable induction uses the Fitting subgroup and a proper supplement, not a presumed split Frattini kernel. Serre3.5.3 uses auxiliary places outside the prescribed local set; it does not promise an effective numeric bound. Harbater–Hartmann7.1 patches torsor algebras, which need not be fields.

Wood21 supplies stable generating braid orbits and a set-valued Tate action; Wood19’s free-tame/projection/identity-root corrections are applied from its accepted source findings. Kedlaya–Liu’s semilocal correction and Chen’s weak-trace correction are also applied without reassessing their review verdicts. Chen’s conjectures stay open and are never proof premises. EVW1212.0923 is withdrawn: only explicitly read geometric-marking/specialization arguments are source leads, and none of its withdrawn counting claims is a premise. Fixed-n coefficient comparison is separated from any Frobenius-equivariant stabilization.

## Suggested Lean and validation

The exact suggested file elaborated with lean-check at the recorded pins: zero errors, 111 declaration-uses-sorry warnings, and no other warnings. Memory available before the final run was 101 GB; one Lean check ran at a time. No lake build, update, cache fetch or language server was used. Suggested-file SHA-256: 9641daa61a5d8b4d0b5cba0f63a76ea20e6a34ddf935b33c2dfdcd12e01b932a.

It has 39 typed anonymous examples. The per-node signatureCoverage ledger records native target/carrier signatures for 25 nodes, 44 typed API items and 37 named packet tests. The other two examples are supplementary boundary checks. These counts do not claim complete signatures: 159 API items and 117 packet tests remain whole omissions, and the other 112 targets remain whole declaration omissions. Every node, API and test name appears in the file’s manifest, with its supplier/carrier and exact gap obligations. No missing object is encoded by an opaque carrier or an uninterpreted Prop assumption.

Partial signatures are explicit. The native finite étale category does not yet type its geometric-fiber clauses or all pullback coherence maps. Raw Nielsen quotients do not yet type every fixed-class/generation restriction. LiftedAffineGroup types points and odd-degree parameters, while its relative action and scheme connectedness remain geometric obligations. numberFieldHilbert types a one-parameter single-polynomial consequence, with finite-family, multi-parameter and density clauses still to type. FittingSubgroup types its native subgroup API; the supplement semidirect multiplication map remains a construction obligation. All assertions proved by sorry check their signatures, not their truth.

Validation performed:

- check_blueprint.py reports zero errors and zero warnings, with seven planned stages and no closed stage.
- Source-issue and source-version validators pass with the published/preprint/author-copy version schema.
- The 137 target statements and all 203 API/154 test names and statements agree between packet, reader and the typed-or-omitted signature inventory. All implementation statuses are unchecked.
- Exhaustive S₃ checks verify 648 Hurwitz product/subgroup/inverse/braid instances; six rigid (2,2,3) triples form one inner orbit. Exact integer polynomial multiplication verifies the Wang norm witness factorization, and the eighth-power residue witness was checked at 45 odd primes below 200. These finite checks supplement the universal proof routes.
- The submission-path, JSON, private-path and whitespace checks are run on exactly the four issue deliverables before opening the pull request.

## Source issues

E1 retains the earlier Dèbes author-copy polynomial-index misprint, scoped to the exact working text. E2 records the negative exponent in the affine-line Artin–Schreier example in HOPS §3.2.1: v1 PDF p.9 and v2 PDF p.11. The v2 exponent and coordinate wording were checked visually. With x the affine coordinate, x^(−n) gives a wild pole at zero; x^n gives the intended affine étale cover. The packet records both hashes and the search history. Publisher and author-hosted published copies returned HTTP403, so no finding is asserted against the publisher version. These are own-word descriptions rather than source excerpts.

## Resume after independent review

An independent agent must review this plan. This worker neither reviewed nor red-teamed its own submission. Resume from coverage.remaining and the exact gap ledger; do not replan the retained component or another owner’s construction. The first implementation prerequisite is the actual finite étale scheme fiber bridge, which unlocks the geometric signatures. The arithmetic and Hurwitz proof reading can proceed in parallel in subsequent authorized jobs. No additional job is claimed by this run.

### Scheme Galois-category bridge

At the pin the abstract Galois-category and finite-étale-algebra APIs exist, but the connected scheme FEt category, geometric fiber instance, quotients and affine-to-scheme gluing have no complete native bridge. Build the exact carrier above before the omitted scheme and local-system Lean signatures; no abstract axioms are treated as a proof for schemes.

Nodes: IG.0/finite-etale-covers, IG.0/geometric-fiber, IG.0/etale-fundamental-group, IG.0/basepoint-and-components, IG.0/field-and-torus-comparisons, IG.0/finite-galois-algebras, IG.0/finite-etale-idempotents, IG.0/integral-monodromy, IG.0/adic-local-systems, IG.0/adic-representations.

### Noohi and pro-étale carrier signatures

The pin has the scheme pro-étale site but no Noohi or infinite Galois-category reconstruction API. Construct the explicit Loc/Cov and continuous target groupoids before stating these in Lean; the categorical set-sized generator argument in Bhatt–Scholze7.4.1 is also an explicit proof obligation.

Nodes: IG.0/noohi-groups, IG.0/proetale-fundamental-group.

### Stack completion exactness source

Read Anderson1974 Proposition3 and the topological bundle hypotheses in full before certifying the geometric moduli π₁ exactness proof. Landesman–Litt pp.46–47 explicitly cites it; no unconditional centreless-kernel theorem is substituted.

Nodes: IG.1/stack-and-family-exactness.

### Geometric specialization carrier

The native scheme π₁ bridge and supplier smooth-pair lifting are required before the exact specialization and scheme-inertia signatures can be stated. The complete SGA1 target statements are specified above.

Nodes: IG.1/arithmetic-exact-sequence, IG.1/decomposition-inertia, IG.1/tame-and-prime-to-p, IG.1/proper-specialization, IG.1/punctured-specialization, IG.1/finite-field-frobenius, IG.1/charzero-base-extension, IG.1/arithmetic-representation, IG.1/stack-and-family-exactness.

### Quantitative and local Hilbert proof sources

Read Ekedahl1990 Theorem1.3 and its proof, Cohen’s integral thin-set large-sieve proof, and Serre’s compact-analytic Frattini proposition in full before certifying these proof chains. The papers naming them were read; those references alone do not certify the missing proofs.

Nodes: IG.2/hilbert-local-conditions, IG.2/integral-thin-count, IG.2/frattini-full-image.

### Norm Hilbert all-point comparison

The norm construction requires exact all-point inclusion and rational-fiber equality after shrinking. Resolve the algebraic residue-field argument before strengthening the target to equality on all scheme points; no such strengthened equality is used.

Nodes: IG.2/norm-pullback-hilbert.

### Absolute Galois original proof and ownership

Read Fried–Jarden2008 Proposition16.11.6 and Weissauer’s original theorem from a cleared source before certifying this stronger target. The ownership proposal gives it the named IG.2 continuation; the extraction’s UNACCEPTED route cannot be declared accepted by this blueprint.

Nodes: IG.2/absolute-galois-normal-subgroups.

### Stable braid cancellation proof

Read Fried–Völklein1991 Appendix Lemma3 in full or supply its finite-group braid proof. Wood21’s full stable proof was read, but this cancellation input is cited there rather than proved.

Nodes: IG.3/stable-braid-classification.

### Exact open Nielsen predicates

Chen Conjectures1.1.3/1.1.4 and Question1.4.1 were collated with the primary McCullough–Wanderley2013 weak-trace formulation and its exceptional q. Read Garion2008’s original transitivity conjecture and complete the Out/Aut and field-automorphism convention collation before typing these open predicates. They are never used as theorem premises.

Nodes: IG.3/nielsen-open-statements.

### General nonproper Riemann-existence algebraization

SGA1 XII5.1 is stronger than proper coherent GAGA; its local finite analytic-algebra algebraization and gluing proof is a target-level proof obligation. The arbitrary-dimensional finite-CW input in Gao–Habegger also needs its exact source and proof before certification.

Nodes: IG.3/general-riemann-existence, IG.3/bounded-cover-count.

### General cover descent signature

The native scheme-cover and continuous H²/torsor carriers must be connected before the general r-branch descent and Tate-twist signatures can be stated. The real example additionally needs a checked SL₂(F₅) double-cover model and the four-branch path computation.

Nodes: IG.3/branch-cycle-realization, IG.3/rational-rigidity, IG.3/general-cover-moduli-descent, IG.3/real-moduli-counterexample, IG.3/rigid-s3-comparison, IG.3/lifting-invariant, IG.3/stable-braid-classification, IG.3/arithmetic-lift-comparison.

### Original finite-module global duality proof

The exact restricted Poitou–Tate statements and their use were read in DLAN §2.6 and Schmidt–Wingberg. Their cited original proof of global duality was not read. Supply the finite-coefficient reciprocity exact-complex proof, with unramified restricted products and modified real terms; this is not a request to the higher ArithmeticGaloisDuality tier.

Nodes: IG.4/restricted-poitou-tate, IG.4/grunwald-wang-boundary, IG.4/split-nilpotent-proper-solutions, IG.4/unramified-property-e, IG.4/tame-central-lift.

### Finite solvable structural proof

Read or prove the finite-group structure input Φ(G)<F(G) for nontrivial finite solvable G, cited by Schmidt–Wingberg to Huppert. The complete arithmetic induction was read; do not certify the cited group-theoretic input without its proof.

Nodes: IG.4/fitting-supplement, IG.4/shafarevich-solvable-realization.

### Homogeneous-space arithmetic proof input

The exact supersolvable, quaternion and collective-degree conclusions are source-checked. Their geometric fibration/descent theorem, Demarche’s quaternion Brauer computation and the regular collective-degree refinement cited to Colliot-Thélène2000 need full proof collation. Keep these restricted arithmetic targets here under the tier order; route broader homogeneous-space geometry separately through the manager.

Nodes: IG.4/supersolvable-grunwald, IG.4/quaternion-all-place-prescriptions, IG.4/collective-degree-realization.

### Central global-character criterion

LWZB’s full finite/profinite argument was read, but its central global lift invokes Malle–Matzat Theorem10.2, whose proof was not read. Supply this restricted root-of-unity-free global central criterion from the finite-coefficient kernel above; do not silently infer proper solvability for every central problem.

Nodes: IG.4/unramified-property-e.

### Arithmetic embedding signatures

The current TauCeti FiniteEmbeddingProblem and generic extension dictionary must be reconciled with the pinned roadmap imports; number-field place, continuous cohomology, free operator filtration, and Cartier-dual carriers remain unavailable at the pinned build. Omit exact affected signatures rather than invent obstruction or proper-solution axioms.

Nodes: IG.4/proper-local-embedding-problem, IG.4/abelian-kernel-obstruction, IG.4/finite-galois-localization, IG.4/restricted-poitou-tate, IG.4/solution-twisting, IG.4/grunwald-wang-boundary, IG.4/independent-cyclic-eight-lifts, IG.4/free-operator-shrinking, IG.4/induced-proper-solutions, IG.4/cyclic-ramification-correction, IG.4/split-nilpotent-proper-solutions, IG.4/fitting-supplement, IG.4/shafarevich-solvable-realization, IG.4/supersolvable-grunwald, IG.4/quaternion-all-place-prescriptions, IG.4/collective-degree-realization, IG.4/base-no-unramified-extension, IG.4/unramified-gamma-groups, IG.4/property-e, IG.4/unramified-property-e, IG.4/tame-central-lift, IG.4/global-arithmetic-invariant.

### Original tame/admissible moduli construction proofs

Romagny–Wewers descent/deformation/gluing and LWZB comparison were read. Complete the cited Wewers admissible-cover and ACV proper-DM construction, Hall relative stack GAGA, and Emsalem/Kanev enlargement to disconnected covers with inactive punctures. Until the actual fiber category and representability proof are connected, all geometric moduli signatures are omitted.

Nodes: IG.5/arithmetic-hurwitz-moduli, IG.5/arbitrary-monodromy-marked-moduli, IG.5/hurwitz-analytic-comparison, IG.5/admissible-g-covers, IG.5/admissible-stacks-and-stable-curves.

### Nonproper cohomology kernel and coefficient tower

Read the cited relative vanishing-cycle/local-acyclicity proof, finite-coefficient Artin comparison and their coefficient-compatible maps. Prove ML/finite-generation and invariant descent before the Qℓ passage. The finite Hurwitz duality/trace/weight proof must be supplied here under the tier order; none is certified by naming a higher supplier.

Nodes: IG.5/tame-cohomological-specialization, IG.5/fixed-degree-mod-l-comparison, IG.5/coefficient-tower-comparison, IG.5/restricted-hurwitz-trace-kernel, IG.5/fixed-degree-point-estimate.

### Low-class orbit and lattice proof input

LWZB component-count proofs were read, but Ellenberg–Venkatesh2005 Lemma3.3, used to bound components outside the stable range, was not read. Supply that exact estimate and verify strictly positive lattice weights and the n≥1 boundary before certification.

Nodes: IG.5/frobenius-component-count, IG.5/semidirect-component-comparison.

### Wild patching and Abhyankar proof sources

A lawful primary field-patching version was read: Harbater–Hartmann4.9–4.11/7.1. Supply its complete §3 approximation/factorization proof and the formal branched-cover patching theorem used in the Raynaud–Harbater construction. HOPS §3.3 proof outlines were read; original Raynaud/Harbater sufficiency proofs still require full reading and formal local lifting/deformation contracts. Field-algebra patching alone does not certify those formal cover constructions.

Nodes: IG.5/formal-curve-patching, IG.5/abhyankar-affine-curve-realization.

### Hurwitz geometry signatures

Native finite-cover, stack, branched-cover, analytic comparison and ℓ-adic cohomology carriers are unavailable at the pinned build. Ordinary configuration subtype/quotient, tuple and affine-coordinate signatures can be stated; omit the exact remaining node/API/test declarations and list their IDs in the suggested file.

Nodes: IG.5/configuration-braid-group, IG.5/topological-hurwitz-covers, IG.5/forget-hurwitz-marking, IG.5/tame-g-cover, IG.5/arithmetic-hurwitz-moduli, IG.5/arbitrary-monodromy-marked-moduli, IG.5/hurwitz-analytic-comparison, IG.5/admissible-g-covers, IG.5/admissible-stacks-and-stable-curves, IG.5/ordered-configuration-compactification, IG.5/tame-cohomological-specialization, IG.5/fixed-degree-mod-l-comparison, IG.5/coefficient-tower-comparison, IG.5/restricted-hurwitz-trace-kernel, IG.5/fixed-degree-point-estimate, IG.5/hurwitz-points-and-extensions, IG.5/hurwitz-component-invariants, IG.5/frobenius-component-count, IG.5/semidirect-component-comparison, IG.5/product-one-component-monoid, IG.5/bounded-core-galois-reduction, IG.5/double-cover-trace-zero, IG.5/labelled-hyperelliptic-family, IG.5/finite-cover-image-lemmas, IG.5/formal-curve-patching, IG.5/abhyankar-affine-curve-realization, IG.5/versal-phi-cover-families, IG.5/general-fixed-fiber-equation.

### Artin and residual-finiteness original proofs

Read SGA4 XI §§4.4–4.6, construct the elementary-fibration tower and coefficient-compatible site maps; supply the original residual-finiteness proof for compact surface groups. These are finite kernels owned here because general downstream comparison/representation roadmaps are later-tier.

Nodes: IG.3/finite-coefficient-comparison, IG.3/artin-good-neighborhoods, IG.3/curve-topological-density.

### Versal-family original construction

Read Wewers1998 Theorem4, match its general genus/marking stack and chosen-cover point, and prove the dominant étale multisection construction with the section contract.

Nodes: IG.5/versal-phi-cover-families.

### Realization and generic-polynomial signatures

The native finite Galois field/polynomial certificate, complex-adjoin D₈ carrier and finite solvable realization signature now elaborate. Generic multi-parameter coefficient fields, regular cover models and their full-group integral specialization bridge remain missing. Omit those exact declarations and enumerate their node/API/test IDs in Suggested.lean.

Nodes: IG.6/specialization-export, IG.6/dihedral-eight-realization, IG.6/generic-polynomial-universality.

### Semisimple-group simply connected comparison

Supply the original topology-to-finite-etale proof that an algebraically simply connected semisimple group in characteristic zero has trivial étale π₁. Algebraic simple connectedness is not by itself a proof about the scheme fiber functor.

Nodes: IG.1/homogeneous-space-fundamental-group.

### Profinite complement conjugacy proof

Read Ribes–Zalesskii2010 Theorem2.3.15 from a cleared source, including finite complement conjugacy and the inverse-limit argument. The pinned Mathlib Schur–Zassenhaus theorem supplies finite existence only. No Belyi layer is cited as supplying this result.

Nodes: IG.4/coprime-profinite-complements, IG.4/unramified-gamma-groups.

### Nonproper characteristic-zero base-extension proof

Read the original algebraically closed extension-invariance argument cited by Gao–Habegger LemmaB.2 (Cadoret Corollary6.5/Remark6.8 and SGA1 XIII). SGA1 X1.8 was read and supplies the proper case only. The finite-type nonproper characteristic-zero statement has its own exact target and remains an original-proof obligation.

Nodes: IG.1/charzero-base-extension, IG.3/bounded-cover-count.

## Supplier follow-through

There are 49 stage requests. Each packet entry states the exact need and consumers; the reader’s supplier table is definitive. Replace stage requests with exact node references as suppliers complete their interfaces. The current blueprint checker resolves all existing external node references. These requests remain open, so no stage is called closed.

- SchemeAndStackFoundations:SF.0 — Finite morphisms and finite étale scheme pullbacks; relative Spec and finite-algebra anti-equivalence on affines.
- SchemeAndStackFoundations:SF.1 — Effective fpqc descent for finite étale algebras/schemes, finite group quotients and torsors; stackification of the isogeny prestack.
- SchemeAndStackFoundations:SF.2 — Small étale and pro-étale sites, geometric stalks, locally constant sheaves, weakly étale covers and w-contractible stalk models in the locally topologically noetherian range.
- EnhancedDerivedSheaves:E2 — The replete pro-étale topos and its inverse-limit/descent input used for local systems; no second repleteness construction.
- SchemeAndStackFoundations:SF.4 — Proper finite-cover lifting over henselian DVRs and deformation of smooth proper schemes, with fiber identification.
- SchemeAndStackFoundations:SF.3 — Smooth proper curve compactifications with relative disjoint sections, the universal stable pointed curve and its punctured family.
- AlgebraicModuliForArithmeticGeometry:R09.4 — Representable finite étale covers of Deligne–Mumford stacks, geometric points and effective descent; stable curve moduli and universal-family charts.
- SchemeAndStackFoundations:SF.0 — Integral finite-type scheme points, residue fields, fiber products and connected finite étale fibers for Hilbert subsets.
- ReductiveGroupsPartII:RG2.0a — Weil restriction of quasi-trivial tori and the specified norm map with geometrically integral generic fiber.
- ComplexComparisonPartII:C0 — Analytification of finite-type complex schemes and coherent modules, and pullback of finite algebra sheaves.
- ComplexComparisonPartII:C3 — Proper coherent GAGA needed for finite cover algebraization after compactification, including algebraic spaces.
- ComplexComparisonPartII:C4 — Analytic/algebraic morphism comparison and finite topological models in the smooth quasi-projective complex range; no curve-only contract is silently widened.
- SchemeAndStackFoundations:SF.3 — Normalization and Riemann–Hurwitz for finite maps of smooth proper curves, with local ramification indices.
- SchemeAndStackFoundations:SF.4 — Effective torsor and quotient descent for finite constant stabilizers; only the homogeneous-space adapter, not a general new moduli stack.
- ReductiveGroupsPartII:RG2.0a — Weil restriction of finite étale algebras and quasi-trivial tori used in the restricted homogeneous-space argument.
- AlgebraicModuliForArithmeticGeometry:R09.4 — Stable marked curves, finite quotient/torsor stacks, effective finite-cover moduli and rigidification. The general Hurwitz carrier and its marking adapters stay in IG.5.
- EnhancedDerivedSheaves:E1 — Derived inverse limits and the exact finite-module Mittag–Leffler criterion for the specified coefficient tower.
- EnhancedDerivedSheaves:E2 — Finite-coefficient constructible sheaves, compact support, proper base change and the relative normal-crossings local-acyclicity maps in the finite Hurwitz range.
- SchemeAndStackFoundations:SF.2 — Finite-coefficient étale cohomology and the finite-cover/tame nearby-cycle foundations; broadened duality and weights remain restricted targets here.
- ComplexComparisonPartII:C0 — CW/topological curve and fibration carriers, the sphere/free/surface presentations and the homotopy sequence with chosen basepoints.
- AlgebraicModuliForArithmeticGeometry:R09.7 — Resolution and normal-crossings compactification of smooth complex finite-type schemes needed in SGA1 XII5.1; import the lower-tier resolution construction rather than replan it.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula — Use the existing layer contract for No unramified split-infinity extension of the base. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability- — Use the existing layer contract for Scheme decomposition and inertia groups, No unramified split-infinity extension of the base. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/BelyiMaps#layer-0-permutation-triples — Use the existing layer contract for Riemann existence for finite covers. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/BelyiMaps#layer-11-fields-of-moduli-fields-of-definition-and-galois-orbits — Use the existing layer contract for Rational rigidity with its descent hypotheses, Field of moduli and the central descent obstruction, A rigid S₃ cover and its dessin. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem — Use the existing layer contract for Field and multiplicative-group acceptance comparisons, Tame and prime-to-p fundamental quotients, Frobenius and cyclotomic normalization, Unramified admissible Γ-groups, Tame G-covers in families, Tame tangential fibers at a smooth curve boundary, Dessins, inertia and arithmetic conventions. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness — Use the existing layer contract for Field and multiplicative-group acceptance comparisons, Tame and prime-to-p fundamental quotients, Frobenius and cyclotomic normalization, Tame G-covers in families, Tame tangential fibers at a smooth curve boundary, Dessins, inertia and arithmetic conventions, The imported faithful action on dessins. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/BelyiMaps#layer-3-finite-enumeration-and-character-theoretic-counts — Use the existing layer contract for Realizing general generating sphere tuples, A rigid S₃ cover and its dessin. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group — Use the existing layer contract for Realizing general generating sphere tuples, A rigid S₃ cover and its dessin. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants — Use the existing layer contract for Hilbert irreducibility over number fields, Hilbert specialization with local conditions, The integral thin-set counting kernel, A worked disjoint quadratic family, Finite Galois localization and Sha kernels, Finite-coefficient Poitou–Tate input, Grunwald–Wang and its exceptional class, Induced abelian proper solutions, Cyclic ramification correction, Property E for the arithmetic unramified group, Tame central lift after adjoining roots, The global arithmetic lifting invariant, Cyclic realization examples. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence — Use the existing layer contract for Hilbert irreducibility over number fields, Hilbert specialization with local conditions, The integral thin-set counting kernel, A worked disjoint quadratic family, Finite Galois localization and Sha kernels, Finite-coefficient Poitou–Tate input, Grunwald–Wang and its exceptional class, Induced abelian proper solutions, Cyclic ramification correction, Property E for the arithmetic unramified group, Tame central lift after adjoining roots, The global arithmetic lifting invariant, Cyclic realization examples. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality — Use the existing layer contract for Finite Galois localization and Sha kernels. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — Use the existing layer contract for Scheme decomposition and inertia groups, Auxiliary cyclic prescriptions force full image. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration — Use the existing layer contract for Tame and prime-to-p fundamental quotients. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group — Use the existing layer contract for Frobenius and cyclotomic normalization. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors — Use the existing layer contract for Finite stabilizers and homogeneous fundamental groups. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions — Use the existing layer contract for Field and multiplicative-group acceptance comparisons. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations — Use the existing layer contract for Cyclic realization examples, A degree-eight dihedral realization, Generic-polynomial universality. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-3-the-discriminant-and-the-alternating-group — Use the existing layer contract for Cyclic realization examples, A degree-eight dihedral realization, Generic-polynomial universality. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-9-sₙ-as-a-galois-group-over-ℚ — Use the existing layer contract for The existing symmetric-group family. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality — Use the existing layer contract for Finite Galois localization and Sha kernels, Finite-coefficient Poitou–Tate input, Free operator-group shrinking. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma — Use the existing layer contract for Finite Galois localization and Sha kernels, Finite-coefficient Poitou–Tate input, Free operator-group shrinking. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations — Use the existing layer contract for Proper solutions with local prescriptions, Finite abelian-kernel obstruction and pullback, Free operator-group shrinking, Central Property E. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups — Use the existing layer contract for Finite stabilizers and homogeneous fundamental groups. The consuming statements and proof steps specify the needed maps and hypotheses; no separate carrier or proof of the supplied theory is introduced.
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors — Use the existing layer contract for Wang’s cyclic-eight local obstruction. Exact restrictions are in these nodes; this is an import, not a second construction.
- tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations — Use the existing layer contract for Frattini detection of full profinite image, Normal subgroups of absolute Galois groups, Finitely many bounded-degree geometric covers, Coprime profinite complements. Exact restrictions are in these nodes; this is an import, not a second construction.
- tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation — Use the existing layer contract for Frattini detection of full profinite image. Exact restrictions are in these nodes; this is an import, not a second construction.
- tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary — Use the existing layer contract for Approximation and nonabelian localization. Exact restrictions are in these nodes; this is an import, not a second construction.
- tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets — Import the stated layer contracts; the consuming node statements give the exact restricted interface.

All information needed by the next worker is in these four deliverables. Transient downloads, extraction texts, scripts and compile logs are scratch only and are deleted after the successful submission check.
