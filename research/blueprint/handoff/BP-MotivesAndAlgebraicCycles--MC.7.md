# Handoff: BP-MotivesAndAlgebraicCycles--MC.7

Issue #10833. Author: Codex, session `codex-JD3HRJ`. This is a complete target-level planning pass for `MotivesAndAlgebraicCycles:MC.7`, ready for independent review. It is not a checkpoint and does not claim mathematical or implementation closure.

## Delivered

- Packet: `research/blueprint/packets/MotivesAndAlgebraicCycles--MC.7.json`.
- Reader: `research/blueprint/readmes/MotivesAndAlgebraicCycles--MC.7.md`.
- Suggested file: `research/blueprint/suggested/MotivesAndAlgebraicCycles--MC.7.lean`.
- 50 new target nodes: 16 definitions, 24 theorems, five comparisons and five applications; 72 API items and 48 planning unit tests. Every definition has recorded uses and three discriminating tests.
- All 71 MC.7 catalogue items are accounted for exactly once: 67 Benoist–Wittenberg items, the composite Li–Liu item, Ichino–Prasanna005 and two Benoist divisor applications. IP003 is requested from MC.2. The issue's MC.0/MC.2/MC.6 routes remain outside this part.
- All 15 inherited MC.7 targets are accounted for in `retainedTargets`. Their correct content is retained; exact predicates replace the standard-conjecture, filtration and motivic-t-structure placeholders. Rational C/D are distinguished from coefficient-field variants. No other packet was edited.
- Four new planets; keep the inherited Hodge and Tate planets to obtain six. At assembly deselect the old C, D, smash-nilpotence and combined standard-conjectures planets, following `assembly`. Do not simply union the two planet lists.

## Checks

`python3 scripts/check_blueprint.py research/blueprint/packets/MotivesAndAlgebraicCycles--MC.7.json` reports zero errors and zero warnings.

The suggested file elaborated with `lean-check` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, exit0. Only its two admitted end-theorems warn. It has one real-bodied definition on the existing Hodge carrier, two end-theorem signatures and two proved discriminating examples, in 69 lines. `check_sorry_data.py` passes. Heavy geometric carriers remain README targets, following the maintainer's 19 October rule.

Additional checks passed: the 71-item routing bijection, all 15 inherited identifiers, an acyclic internal prerequisite graph, API/uses/three tests for all 16 definitions, reader/packet statement/API/test agreement, six assembled planets, intake path/JSON rules and whitespace checks. Arithmetic checks confirm the Campedelli quadratic weight dimensions and conjugate-linear square, and the corrected Stacks multinomial coefficients. These checks are not a mathematical review.

No full declaration index was available. Nine baseline declaration statements were read directly at the pins. Current read-only TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked, including AlgebraicVectorBundles, RealAlgebraicGeometry and the completed HodgeStructures interface. Existing abstract carriers and their theory are imported.

## Coverage and exact outstanding work

The packet is `complete`; MC.7 is `planned`, not `closed`. All implementations are `unchecked`. Twelve gaps and 16 requests remain. The full statements and consumer IDs are in the packet and reader; the following is the resume order for closure work, not another job claimed by this session.

1. Satisfy the early geometric suppliers: R-MC2-EARLY, R-C5 and R-MC4. Preserve the current perfect-field/resolution domain of MC.4. The motivic t-structure gives characteristic-zero standard conjectures conditionally, not an unconditional construction. R-MC6 needs the Tannakian criterion with a possibly Q_l-valued fiber functor; existing neutral reconstruction is not replanned.
2. Register the pending equivariant-topology and real function-field quadratic-form designs (G-TOPOLOGY, G-QUADRATIC). Implement R-MC2-REAL and R-MC2-CONIVEAU with the exact admissibility, norm, twist, finite-stalk and low-dimensional injectivity contracts. R-MC0 owns universal CH0 support and decomposition-of-diagonal action. G-CONIVEAU requires the primary Bloch–Ogus and torsion Abel–Jacobi image/injectivity proofs.
3. Discharge the geometric extensions R-SF2, R-SF2-KOSZUL, R-SF3, R-SF4 and R-SF5. Exact existing norm/Abel/projective-cohomology/intersection nodes are already imported. Proper DVR specialization is distinct from the normal-cone theorem; imposed-point geometrically integral Bertini and weak factorization are distinct from smoothness-only Bertini. The packet proposes these additions as SchemeAndStackFoundations, Part II.
4. Obtain primary proofs for the classical known cases (G-KNOWN), retained extended Tate variants (G-TATE-VARIANTS), complex integral threefold cases and Enriques classification input (G-COMPLEX-THREEFOLD), and the real example/approximation constructions (G-EXAMPLES). T2 imports FaltingsFinitenessAndIsogenyTheorems:R28.4 via R-FALTINGS. Check the realization scope of the finite-field C case rather than extrapolating an l-adic proof to every Weil theory.
5. Resolve G-CAMPEDELLI: the displayed construction cannot descend; its weight4 quadratic ideal line would be stable under a conjugate-linear operator squaring to−1. A different verified real-empty Campedelli construction is required. Resolve G-FANO by extracting the full BW2 Fano proof and its deformation/monodromy inputs. G-QUARTIC-FULL requires both the full real intermediate-Jacobian/Chow comparison and the real-point Fermat quartic calculation. Neither is a consequence of the torsion calculation alone.
6. Read the primary Beilinson 1987 height Conjecture 5.5 and verify its primitive domain/normalization (G-HEIGHT). The conditional supplied-domain positivity predicate deliberately does not pretend to settle that comparison. Register the pending unitary arithmetic-inner-product, special-cycle and model suppliers (G-AIP), including a verified corrected almost-self-dual local index identity. Li–Liu's two case nodes carry this additional proof premise until the proposed 2024 repair is verified. R-MC2-ARITH and R-PS6 supply the arithmetic realization, analytic order and cycle/Selmer comparison; MC.7 does not duplicate the L-function statement. R-MC2-COMPATIBLE supplies the all-prime realization category for simultaneous Hodge–Tate classes.

The packet's MC.2 restructuring proposal keeps early classical cycle classes, real realization, coniveau/torsion, compatible realizations and late arithmetic Abel–Jacobi as separate export contracts. No early supplier depends on a conjecture of MC.7; no blanket MC.2↔MC.7 cycle is introduced. MotivesAndAlgebraicCycles is not in the 94-roadmap Caraiani–Newton tier list. RS-08's accepted retention of MC.7 is respected.

## Sources and corrections

The reader's edition/reading-scope inventory and the packet's source hashes record exactly what was read. Main sources: Deligne's five-page Hodge description; Kleiman 1994 §§1,3–5; Jannsen 1994 Conjectures 2.1/5.1 and Theorem 5.2 with §§2/5 proofs; Beilinson 2010 §§1.1–1.7; Totaro's Tate survey §§1–4 and opening of§5; Jannsen 1992 pp.449–452; Benoist–Wittenberg I §§1.6.3–1.6.4 and2–5; II Theorem 7.1/Corollary 7.2 and Proposition 7.7 with its proof; CTV 2011 preprint Proposition 3.3/Theorem 3.11/Corollary 3.12; Totaro's integral-cycle preprint Theorem 2.1; Li–Liu's 20 October2021 author copy introduction, Hypotheses 4.5/6.6 and§11 proofs; Ichino–Prasanna arXiv v2 §2.1/Definition 12.1; Benoist's two divisor applications; Stacks 0FH8/0FH9. Survey statements are distinguished from unread primary proofs. The permitted library index supplies no copy of the missing Beilinson 1987 height article; no unauthorized book copy was used.

Existing BW findings E1–E11 and Li–Liu E1–E20 are referenced with explicit actions/consumers, not copied or reviewed by this worker. Key safeguards: dimension≥2 or empty real locus for the even-genus equivalence; positive even k for the constant-class criterion; the invalid Campedelli construction; the negative blowup remainder; two distinct torsion pairings; source sketches for the full quartic groups; the corrected archimedean constant and Hecke/local-index premises for Li–Liu. Tate–Beilinson injectivity has rational Chow coefficients, whereas Tate surjectivity has Q_l coefficients.

A new Stacks 0FH9 proof-coefficient finding is recorded in `sourceIssues`: the surviving multinomial coefficient is n!, giving ((n−1)!)^n n!, not (n!)^n. The integral torsion conclusion is unchanged. The current tag page and its empty comment section were checked; priority is not asserted beyond that search.

Li–Liu Theorem 1.5 was checked on the rendered author-copy page 5: |R∩V_F^spl|≥2. The extracted PDF text corrupts both the intersection and inequality. This is an extraction artifact, not a source erratum.

All source descriptions are in our own words. No source PDF, passage or scratch file is part of the deliverables. The independent reviewer should start with the supplier and gap ledgers, the source corrections and the coefficient/variance interfaces before assessing closure.
