# DESIGN-EllipticCurveModularityWild3Adic

Issue #7103; Codex session codex-DAAICL. This is the complete target-level design pass for the independent Breuil–Conrad–Diamond–Taylor wild three-adic route. It is ready for an independent mathematical review, not an implementation or an accepted upstream package. No other issue was taken.

## Delivered and coverage

The roadmap definition, packet, reader and suggested Lean file cover W3.0–W3.6. The definition uses the requested automorphic area and EllipticCurveModularity parent. Its embedded reader equals the separate reader. The packet has 55 nodes: 8 definitions, 10 constructions and 37 theorems; 82 API items, 66 unit tests, 38 planets and 14 verified baseline declarations. Each definition/construction has uses, an API, and at least three tests. No layer has more than six planets. Implementation status remains unchecked throughout.

Every stage is **planned**, none is closed. The packet is **complete** for this pass. Its sourceCoverage records all 62 items routed here by PAPER-BREUIL-CONRAD-DIAMOND-ETAL-01, including their consolidation into targets and the smaller calculations retained in proof sketches. The three-case introductory strategy uses the exact corrected CDT final lifting interface; it does not become a second general theory of rational points on modular curves.

- W3.0: cubic and quadratic inertia types, full extended Weil types, and their three simple-admittance results.
- W3.1: five explicit local field families; six local mod-five cases and their classification; local paired-torsion curves and the extended Frobenius sign.
- W3.2: finite-flat/Dieudonné-ideal category conditions, continuous cohomology comparison maps, their kernel criterion, and cubic/quadratic type-point factorization.
- W3.3: cubic normal forms, extension and descent calculations, the rank-three/rank-four arguments, tangent bounds and weak acceptability.
- W3.4: shared degree-twelve rank-one calculations and adapted bases, the unique quadratic residual model, push/pull and diagonal vanishing, tangent bounds and weak acceptability.
- W3.5: four extended model families, Ext comparisons, coefficient and singleton filtrations, tangent bounds, Artin deformations, whole characteristic-three rings, exceptional-model point factorization and extended weak acceptability.
- W3.6: global companion construction, cross-prime Tate types, classical wild lifting, prime-field mod-five modularity and the independent elliptic-modularity conclusion.

The graph inside the roadmap is acyclic. Local paired curves sit in W3.1, before the extended-model classification that uses them. The conditional endpoint interface of the parent is requested separately from its unconditional Khare–Wintenberger theorem, so the latter is not an input to this proof.

## What remains and where to resume

The sole recorded gap, G-LEAN, is the full suggested-signature boundary at unavailable supplier carriers. The pinned libraries and current Tau Ceti were searched for Breuil modules, finite-flat Dieudonné descent, arithmetic type/admittance predicates and category deformation rings. No native carriers supporting these full contracts were found. The file therefore elaborates native field, additive-valuation, polynomial-quotient, filtration, matrix and continuous-cohomology fragments. Its omission index records **every target, API and test name and mathematical contract**; those comments are not elaborated declarations. A polynomial filtration is not asserted to be a Breuil module, and matrix entry maps are not asserted to be the full maps on continuous self-extension classes. No opaque replacement arithmetic framework or proposition-valued placeholder was introduced.

An independent reviewer should check the entire mathematical plan and the exact supplier hypotheses, particularly the coefficient-linear extended normal forms, the annihilator proof below, and the classical final lifting interface. Once the supplier carriers exist, instantiate every indexed full signature, API lemma and example directly in those carriers, retain all hypotheses, and elaborate the expanded suggested file. The coverage records explicitly retain this work; compiling the present file does not close the stages or establish any theorem.

## Requests and ownership

There are 16 exact stage requests in the packet, each naming its consumers and the supplier evidence read. Finer nodes are used where their existing statements suffice; a requested stage is used where no finer node states the complete additional contract.

- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1: strong-filtration Hom/Ext and uniqueness criteria, all three-power levels, and exact special-fibre realization of integral multiplication-by-three kernels/images. R07.4: genuine wild Breuil descent with positive N(u), its correction operators and coefficient-linear extension calculus. The existing finer Breuil-descent node is tame and does not supply this wild theorem. Proposed addition: Finite-flat groups and integral p-adic Hodge theory, Part II.
- GL2AutomorphicRepresentationsAndTransfer R16.3: the general BCDT compact-admittance and extended involution predicates, as a Part II interface; W3.0 proves only the specific constituents. R17.5: the existing Langlands–Tunnell stage, including the prime-field mod-three residual reduction.
- ArithmeticGaloisRepresentations R01.4: exact finite mod-five normalizer/determinant calculations and the degree-24 cover image argument, as Part II additions. R01.6: existing continuous elliptic torsion/Tate interfaces.
- GL2ModularityLifting R22.5: the classical BCDT 1.4.1–1.4.2 and CDT 7.2.1/7.2.4 interfaces, including BCDT §10's correction of the negative-j three-isogeny argument, as a Part II addition.
- ModularCurvesPartII R12.4: the existing connected-twist input plus the precise degree-24 specialization-cover interface. R13.4a: rationality of the determinant-compatible five-level compactification, retaining the SL₂ cocycle-lift argument. These are Part II additions to the modular-curve owner.
- EllipticCurveModularity R29.6: export the existing proof-independent conditional modularity/newform/parametrisation equivalence and finite-character twist interface, without the parent’s unconditional theorem.
- Existing native roadmap layers: ClassFieldTheory Layers 5 and 8; LocalFieldsRamification Layer 3; EllipticCurves Layers 2 and 4; ModularCurves §5C. EllipticCurves Layer 4 needs a Part II interface for precise local paired-torsion families, the cubic peu examples and the elliptic cross-prime Weil–Deligne theorem. Current §5C's connectedness hypothesis is discharged by ModularCurvesPartII R12.4.

The existing finer Hilbert-irreducibility-with-local-conditions node is imported directly. No new Hilbert theory is planned. Current ProfiniteArithmetic and LocalGaloisGroups were read in full; their existing arithmetic/topological results are not duplicated. No upward notion moves are proposed for the current Caraiani–Newton tier programme: this new direction is not one of its listed tier jobs.

## Source checks and corrections needing review

BCDT was read in its published 97-page version, pp.843–939; the 79-page author copy was compared at the corrected local-formula locators. The packet records both URLs/hashes. CDT was read at Theorems 7.2.1/7.2.4 and Proposition B.4.2 with their proofs; Manoharmayum at §§2.2, 3 and 5; Shepherd-Barron–Taylor at §1, Lemma 1.1 and Theorem 1.2 with their proofs. Exact section/page locators, access date, versions and hashes are in sources. No source needed for this pass is missing. No private book was used. All repository prose is our own formulation, with no source passage or source-by-section summary.

Sixteen source issues are recorded. The two Shepherd-Barron–Taylor label issues were checked only in its author-hosted version and are explicitly not asserted of the published version. No separate official erratum was located in the checked author pages/title searches. The N≥2 condition for BCDT 4.6.3's nontrivial mod-T² clause appears in its proof but not the theorem statement.

The important mathematical corrections are:

- Use the actual prime fields F₃/F₅ in the published local/global statements. The routed extraction's algebraic-closure generalizations are not justified. The six proof cases are also distinct from the six conductor factors; the tame case covers exponents 0,1,2.
- In §6.4 the uniformizer is (α−1)/β, of Q₃-normalized valuation 1/12. The printed α/β has valuation −1/4. The subsequent Eisenstein/descent data are at the corrected generator.
- For Corollary 4.6.4 first obtain R/(3)≅F₃[[T]] and the F=0 integral models of its Artin quotients using strong-filtered generic-fibre uniqueness. For an arbitrary Artin quotient of R, contravariant Dieudonné exactness identifies the module of G/3G with D[3]. Then F kills D[3] and F²=−3. For x in D[9], Fx is in D[3], so F²x=0 and 3x=0. Thus D[9]=D[3]; finite three-primary length forces 3D=0. Faithfulness and the free generic representation give 3R=0. This replaces an unsupported endomorphism-extension step in the printed proof. The native additive-group lemma only prototypes this annihilator step; the integral exactness and uniqueness remain exact supplier inputs. Review the repair independently.
- The degree-24 specialization cover uses ordered independent pairs modulo (a,b)~(−a,b), and is geometrically connected. Simultaneous sign would retain two pairing components. Full fibre degree and the unique index-two subgroup of GL₂(F₃), followed by the cyclotomic determinant over Q, give the required surjectivity.
- The allegedly reversed G/M extension notation on BCDT p.888 is not included as a source error: both sides order their dummy pairs identically. The packet records why it differs from that routed-extraction claim.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityWild3Adic.json` passes with zero errors and zero warnings. The suggested file was checked with `lean-check` at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369: exit zero, with only declaration-uses-sorry warnings. The missing full contracts are explicitly indexed; this result certifies syntax/types of the native fragments only. The intake check passes for all five deliverables with zero problems; JSON, reader equality, both internal dependency graphs, API/test/name coverage and planet limits pass. The whitespace check is run after staging before submission. Source texts, downloads, generator scripts and local logs are scratch material and are not needed to resume from the committed packet and this handoff.
