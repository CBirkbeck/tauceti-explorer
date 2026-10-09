# R01.6 handoff

Issue [#7960](https://github.com/CBirkbeck/tauceti-explorer/issues/7960), completed planning pass by Codex, session **codex-pjMuPw**, 2026-10-09. The bot confirmed the claim. Branch: `codex-pjMuPw-r01-6`. This session takes no second job.

## Delivered

- `research/blueprint/packets/ArithmeticGaloisRepresentations--R01.6.json`
- `research/blueprint/readmes/ArithmeticGaloisRepresentations--R01.6.md`
- `research/blueprint/suggested/ArithmeticGaloisRepresentations--R01.6.lean`
- This handoff.

The packet status is **complete**, and its sole stage, `ArithmeticGaloisRepresentations:R01.6`, has coverage **planned**. It is not mathematically closed. All 18 targets inherited from the accepted parent are accounted for in `inheritedTargets`; the parent packet is unchanged. The current WORKERS.md and detail.json require target-level planning, superseding the issue's older lemma-level boilerplate.

There are **41 nodes**: 4 definitions, 5 constructions, 19 theorems, 8 comparisons and 5 applications; **28 API items, 30 unit tests, 6 planets and 7 pinned baseline declarations**. All implementation statuses remain unchecked. Each definition/construction has at least three tests. The reader contains the exact statements, hypotheses, dependencies, sources and acceptance criteria, plus a signature ledger explaining every omitted geometric condition in the prototypes.

The mathematical conventions distinguish arithmetic Frobenius on the covariant Tate module from geometric Frobenius on its dual; the bad-place Euler polynomial uses primal coinvariants or dual invariants. The split Tate example therefore gives 1−T. Integral polarization perfectness requires the polarization degree to be prime to the Tate prime. Integral λ-torsion comparison retains its canonical rank-one tensor factor; a uniformizer trivialization changes by the inverse unit. Complex conjugation on the geometric CM coefficient action is semilinear. Independence means surjectivity onto the product of actual coordinate images and need not survive arbitrary finite extension.

## Ownership and tier changes

AbelianSchemesAndArithmeticModuli A3/A4 owns the geometric torsion, family inverse limit, rank, quotient and duality constructions. A6 owns the endomorphism polynomial and coefficient-rank interfaces. Those are imports here. Current Tau Ceti already implements the generic TateModule, native elliptic Tate action, determinant and roots-of-unity twist. They are cited in `currentLibrary`; the older pin lacks some of them, so the suggested file uses explicitly labelled object-valued supplier fixtures on native carriers. These fixtures are not new ownership or substitute implementations. Restore the full reader hypotheses when integrating the suppliers; in particular, the shortened Serre prototype omits B/PST and continuity alone does not imply its conclusion.

Repoint obsolete R01.6 carrier prerequisites in R01.3 and downstream consumers to A4/current native Tate APIs. The minimal conductor comparison remains at Tier 7 R01.3, with its inherited proof gap. The uniform potential-unipotence arithmetic consequence needed for independence moves down to Tier 7 R01.6; Tier 8 NeronModelsAndSemistableAbelianVarieties must import it. No higher-tier Faltings or Néron theorem is used as an unrecorded input.

The structured `restructure` proposal routes the generic compact linear subgroup extension as **ProfiniteProPGroups, Part II: Compact linear subgroup detection**, beginning after the existing roadmap. It supplies the p-valued finite-generation bridge and then a finite quotient detecting closed subgroups, importing existing Frattini theory. Existing upstream roadmaps remain unchanged. Q6 is the consumer contract, not a duplicate Frattini plan.

## Remaining mathematical closure

Six precise gaps are recorded in the packet and reader:

1. **G1:** Prove the additive elliptic inertia invariant/coinvariant statement also at residue characteristics 2 and 3; DDT Proposition 2.13 supplies only the greater-than-three case directly.
2. **G2:** Close the inherited R01.3 Ogg–Saito/Néron proof input for the conductor comparison, retaining its actual wild Swan term and restricted residual hypotheses.
3. **G3:** Supply the geometric potential-semistable existence proof through SGA 7 I Exposé III and verify printed page labels for Exposé IX §3.6. The electronic IX §3 statements and their consequences were read; that proof chain was not.
4. **G4:** Supply the uniform Jordan, Nori simple-factor and large-prime disjointness inputs used in Serre's boundedness/PST criterion, including reinsertion of exceptional primes.
5. **G5:** Supply the compatible-system coset characteristic-polynomial argument and the connected unipotent kernel comparison with semisimplification, allowing Larsen–Pink Proposition 6.14 without higher-tier Faltings semisimplicity.
6. **G6:** Integrate the generic compact matrix subgroup finite-detection contract into its lower profinite owner. The mathematical argument from Schneider is verified; the audited supplier interface is missing.

There are **7 supplier requests/contracts**. Q1–Q3 import the existing elliptic Layers 2–4; Q4 requests the arithmetic fibre/decomposition interface of IG.1; Q7 imports class-field finiteness. The two strengthening requests are **Q5**, finite-étale Hilbert specialization beyond the currently stated regular-polynomial IG.2 contract, and **Q6**, compact linear subgroup detection beyond the existing profinite Frattini layer. Close G1–G6 and Q5/Q6 before changing the stage to closed. An independent review must check the source statements, gaps, ownership proposal and weakened prototype ledger; this session has added no review verdict.

## Sources and source findings

The packet records 12 sources, versions, URLs, read sections and hashes for downloaded public PDFs. These are Milne's Abelian Varieties notes v2.00 and Elliptic Curves second edition; Diamond–Darmon–Taylor's Fermat notes; Ribet's GL2-type article; Noot's 1995 specialization paper; Serre's 2013 independence criterion; Larsen–Pink's 1992 author copy; Masser–Zannier's 2020 no-Jacobian paper; Pink's 2005 article; Richard–Yafaev arXiv:2111.11216v4; the public electronic SGA 7 I Exposé IX §3; and Schneider's 2011 p-Adic Lie Groups. Each target gives its numbered theorem/section and page locator. Richard–Yafaev citations are scoped to v4, not its later published version. The SGA electronic text has no printed pagination; that limitation is G3.

Schneider was read only from the maintainer-cleared reference library: Exercise 26.2 p. 182, Corollary 26.7 p. 186 and Theorem 27.1 pp. 192–194 support the finite-generation bridge. No source file or passage from that book was copied. Public sources were held only in disposable scratch. No source passage or section-by-section source summary appears in the deliverables.

Three new findings await independent verification: **E9001**, Milne AV I Remark 7.4 p. 34 incorrectly determines the full p-torsion group scheme from p-rank; **E9002**, Milne EC V Proposition 8.1 proof p. 220 treats a one-point stabilizer as normal; **E9003**, Milne AV IV §3 p. 140 gives the extension residue cardinality where the base residue cardinality is required for Frobenius. Their own-word statements, corrections, checks, version scopes and searches for known corrections are in `sourceIssues`. Existing E650, E651 and E794 corrections are referenced rather than duplicated.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations--R01.6.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations--R01.6.lean`: **exit 0**, with 156 intended proof-placeholder warnings and no other diagnostics, against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- Name inventory: all 41 primary interfaces, all 28 API items and all 30 test tags occur in the Lean file and reader. Source-issue shape/version checks pass. No private absolute paths, extracted passages or prohibited postponement terms occur in the packet or reader.
- Current upstream inventory read at TauCetiRoadmap `406eb48d39acf38a143c0187a2dff76fb7d9f9ea` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. JacobianChallenge and Multiquadratic were read in full; relevant elliptic, profinite and representation interfaces were inspected.

The handoff is self-contained. No scratch file is required to resume. Submission is a finished planning pass with declared closure work, not a checkpoint or an implementation.
