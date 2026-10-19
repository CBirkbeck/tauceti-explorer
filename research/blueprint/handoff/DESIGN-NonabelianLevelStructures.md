# DESIGN-NonabelianLevelStructures

Issue #3368. Agent Codex; session codex-sBIBVj. The claim was confirmed by the swarm bot after claim comment 6256321929. This is a completed design pass, not a checkpoint, implementation, independent review or package submission.

## Deliverables and coverage

The new roadmap definition, complete blueprint packet, reader and suggested Lean file cover NL.0–NL.7. There are 65 targets: 16 definitions, 10 constructions, 36 theorems, 2 comparisons and 1 application; 104 API items, 80 definition checks, 38 planets and 22 checked baseline declarations. Every definition/construction has uses, API and at least three discriminating checks. All implementation statuses remain unchecked.

NL.0, NL.1, NL.2, NL.3, NL.4, NL.5, NL.6 and NL.7 are each **planned**; none is closed. “Complete” describes the planning pass under the issue's coverage rule, not discharge of the explicit supplier leaves. All 66 items routed to this owner in PAPER-CHEN-24 have a disposition in extractionCoverage. Item 39 imports the smooth-cover vertical-center theorem from IG.5. The general-j items have explicit scope notes: the certified finite-group estimate is j=0, as the accepted brief permits. No extra implementation targets or second job were claimed.

The reader states every target, hypothesis, proof plan, dependency, definition API, test and source locator. It also gives reproducible finite computations and the precise supplying contracts. The packet is the machine-readable dependency authority.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/NonabelianLevelStructures.json --index <pinned declaration index>`: zero errors and zero warnings. The index is for the stated Mathlib 082e2d3 and Tau Ceti f790474 pins.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: zero problems.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/NonabelianLevelStructures.lean`: passed.
- The source-issue records and sourceVersions pass the source-issues validator and the errata schema check in memory using the errata-v1 envelope. The packet itself remains blueprint-v1.
- A direct graph check found no cycle among the 65 local nodes; the 66-item extraction coverage is exact. Reader consistency checks verified every statement, API contract and definition check against the packet, all statuses, and the six-planet cap for each layer.
- `lean-check research/blueprint/suggested/NonabelianLevelStructures.lean`: **exit 0**, Mathlib 082e2d3 / Tau Ceti f790474; admitted-proof warnings only. Memory was checked before compilation. No language server, build, dependency update or cache retrieval was started. The final file is 198 lines, with five light real-bodied definitions, selected milestones and nine examples.

WORKERS.md's 12 October compact statement rule governs the Lean shape, superseding the older issue's request for every API declaration in Lean. Missing stack, sheaf, invariant-quotient and cusp-quotient carriers remain precise reader targets. No data definition is admitted and no proposition-valued surrogate replaces a missing carrier. The explicit cusp-automorphism membership predicate is an ordinary formula on an existing group, not such a surrogate. Compiling admitted statements establishes well-typed signatures only.

Exact finite verification covered the following mathematical acceptance claims. The procedures and resulting values are retained in the reader, so no scratch file is needed:

- All SL2 pair trace triples over F2,F3,F5,F7 are attained. Generating-pair commutator trace sets are {1}, {0}, {1,3}, {3,4,5,6}, respectively. In particular q=5 has both traces 1 and 3.
- For p=5,7,11,13,17,19,23,29,31: enumerated punctured Markoff triples, checked transitivity of the displayed orientation generators, all three branch cycle counts, cusp formula, genus, the free even-sign quotient and its branch parity. The reader's table gives the results.
- Exact genus evaluation for every one of the 337 primes 13≤p<2304 gives minimum 5 at p=13. The stated elementary lower estimate proves the bound for p≥2304. These checks do not assert transitivity outside the independent transitivity hypothesis.
- Over F4, the irreducible polynomial X²+aX+1 with a²+a+1=0 gives a rotation of order five despite square discriminant. The nonsplit degenerate conic over F5 is a singleton before passing to the starred locus. D6,D10,D14 confirm the cusp automorphism and period formulas.

## Ownership, requests and open inputs

Four explicit gaps remain:

1. **G-MAPPING**: register the supplying stages of MappingClassGroupsAndCanonicalRepresentations (#3370). The contract includes Nielsen/once-punctured-torus orientation, stack Riemann existence, Asada cofinality and the strengthened BBCL22 curve consequence. A general Galois closure is not enough to obtain that consequence. Current PeripheralActions supplies a different, pro-p punctured-sphere theory.
2. **G-DYNAMICS**: register the supplying stages of ArithmeticDynamicsPartII (#3367), including Φ, point/rotation counts, effective BGS exceptional set, strong approximation and MP density/large-image input. The order must be NL.6 → the supplying dynamics stages → NL.7. Counts (routed 85–86) remain with dynamics. The conic geometry and geometric orbit divisibility required by its giant-orbit proof belong to NL.6; point higher-roadmap references to those targets when its plan is registered. This avoids a cycle and duplicate ownership.
3. **G-VDOVIN**: the CFSG-dependent abelian-subgroup cube bound has no checked supplying contract. Vdovin's original proof was not read; only Chen's statement at Theorem 4.12.3 was read. NL.4's deduction assumes exactly that bound. A finite-simple-group owner must supply the unconditional input.
4. **G-GENERAL-J**: published Lemma 4.12.2 does not justify the invariant-factor step for arbitrary j. The plan supplies only the j=0 proof; it does not assert that the stronger theorem is false. Repair that argument before broadening the certified scope.

Fourteen supplying contracts are explicit in the packet and reader:

- Q-GASCHUTZ, finite generating-pair lifting, to IG.3.
- Q-DEFORMATION, the equivariant balanced one-node deformation statement, to SF.4.
- Q-DM-COMPLETION, the framed-completion extension including arbitrary algebraically closed geometric residue fields, to R09.6.
- Q-DUAL, the prestable dualizing-line comparison over DM bases, to SF.2.
- Q-DEGREE, rational tame stack degree and the generic-stabilizer formula, to SF.5; the supplier's existing foundational gap is retained.
- Q-INVARIANTS, integral simultaneous-matrix invariants and determinant-one restriction with arbitrary base change, to LP3, as that direction's Part II if necessary. No Reynolds-operator argument in positive characteristic is accepted.
- Q-DICKSON, the exact subgroup/normalizer/central-extension refinements, to R01.4. The projective exceptional group is S4 and the outer quotient is N/(G·C).
- Q-CONGRUENCE, simple composition factors of finite reduction quotients, extending the existing upstream ModularCurves 9B direction. Mathlib already owns Gamma and IsCongruenceSubgroup.
- Q-COARSE, an **existing** ModularCurves 9D contract: smooth finite quotients of relative curves over regular bases without assuming invertibility of the group order, combined with R09.5 coarse comparisons. This covers residue characteristics 2 and 3 and is not a new planned quotient theorem.
- Q-FULL-LEVEL, the existing R13.2 abelian full-level comparison.
- Q-GRAPHS, Q-CURVE-DUALITY and Q-PRESTABLE, existing StableReduction Layers 1–3 interfaces.
- Q-SKOLEM, the existing SemisimpleAlgebras Layer 5 field/central-simple Skolem–Noether theorem.

The nonduplication audit used the read-only current upstream checkout at 0d144d044dacebca17b654695b6f1ad58f159b27 and current Tau Ceti library a91d3aa. StableReduction and PeripheralActions were read in full, with relevant Suggested declarations; ModularCurves 9B/9D/coarse geometry, BelyiMaps ownership notices and SemisimpleAlgebras Layer 5 were read at the supplying interfaces. The nine newer roadmaps were searched for these specific targets. In particular the current ModularCurves 9D smooth quotient theorem was found and imported rather than planned again. No source was built or edited there.

## Sources and review boundary

Read Chen's published author-hosted Annals copy, mathematical pp. 301–434, with printed theorem/section/page locators and SHA-256 in the packet and reader. The published text, not the older arXiv numbering, controls the targets. The 24 source-issue entries distinguish current findings from older statements already repaired or omitted in the published version. No separate author/journal correction was located in the recorded searches. All findings await independent review; none has a self-issued review verdict.

The characteristic-two torus split criterion is corrected by polynomial reducibility; the full nonsplit degenerate conic retains its zero-vector point; branch count above zero uses (D+2)/3; the trace/moduli dictionary requires a non-dihedral actual image; and Faltings yields finitely many j-invariants/geometric classes rather than finitely many K-isomorphism classes of elliptic curves. Root conventions, exterior conjugacy, stack/coarse fibres, and the possible factor two are explicit. The original Vdovin, Asada, BBCL, BGS and MP proofs were not read as independent sources and are not represented as discharged inputs. No private reference book was needed or copied.

The next authorized step is an independent design review, checking especially the supplying contracts, the new characteristic-two correction and the general-j scope. Once the contracts and new supplier stages are available, update their exact references and prepare the roadmap package in dependency order. The supplied handoff and reader contain the durable results; scratch material can be deleted when the PR opens.
