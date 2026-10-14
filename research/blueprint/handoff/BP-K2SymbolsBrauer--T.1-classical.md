# Handoff: BP-K2SymbolsBrauer--T.1-classical

Issue: [#9306](https://github.com/CBirkbeck/tauceti-explorer/issues/9306). Worker: Codex, session `codex-x955W2`. This is a complete one-stage planning pass, not a checkpoint. Scope is exactly `K2SymbolsBrauer:T.1:classical`. The packet has status `complete`, with this stage's coverage `closed`, and awaits independent review. Implementation remains unchecked.

## Deliverables and counts

The packet, reader and compact suggested file are named `K2SymbolsBrauer--T.1-classical` in their respective blueprint directories. Only those three files and this handoff are changed.

There are two new nodes: one theorem, `central-trivial-action-criterion`, and one construction, `column-embedding`. The construction has nine API items and six unit tests. Twenty-eight baseline declarations are cited. No new planet is added; all six inherited classical planets are retained.

The packet imports 43 classical nodes from `K2SymbolsBrauer--T.1.json`: six definitions, eight constructions, sixteen lemmas, twelve theorems and one comparison, carrying 70 inherited API items and 51 inherited tests. These are imports, not copied nodes. The parent's latest accepted scoped review is `independent-review-REV-FIX-RT-AREA-ktheory-1~2`, dated 10 October 2026; its whole packet remains partial. This supplement does not change or certify its other stages.

## Closed classical inputs

- **G-matrix:** exact general-ring elementary units, additivity and all three commutator cases are imported from the accepted `KTheoryLowDegrees--U.1.json`. Commutative transvection theorems are compatibility checks. The K₁ node also resides in that U.1 packet, with owner id `KTheoryLowDegrees:U.2/K1`.
- **G-colimit:** the pinned Mathlib group instance already exists in `Algebra/Colimit/DirectLimit.lean`. The refinement names finite representatives, common-later-stage equality, compatible homomorphism lifts, generator extensionality and finite-word surjectivity. No finite Steinberg embedding is assumed.
- **G-centre:** the new finite column and row maps are injective by matrix-coordinate recovery and remain injective stably using U.1's GL embedding. Their conjugation formulas preserve noncommutative coefficient order. The fresh-index argument then proves stable kernel centrality, and the imported stable elementary centralizer proves the reverse centre inclusion. The column part of the parent's combined exercise gap is closed; its semilocal symbol part is outside scope.
- **G-classification:** centrality is equivalent to `InducesAction` for an explicitly specified trivial coefficient action. Normalize an actual set section; use the actual factor-set extension, marked equivalence, section independence, every-class realization, and zero-class splitting declarations. Both kernel and quotient markings are retained. The prototype uses the universe supported by the pinned cohomology interface.
- **G-lifted-relations:** the reader supplies fifth-index exact commutation, the four-index identity by two reorderings of uvw, auxiliary-index independence, additivity, forward chaining and reverse chaining with −ba. This proves splitting over Stₙ for n≥5. Finite universality is conditional on separately established centrality of Stₙ→Eₙ.
- **Stable universality:** finite pullback sections are compatible by perfect-source rigidity and glue along the cofinal n≥5 subsystem. Recognition and the natural kernel–H₂ comparison are imported from their existing parent owners.

There are no mathematical gaps or open supplier requests in this scope. The plus-cover/Hurewicz, Matsumoto, semilocal symbol-generation and arithmetic computations remain with their own stages; no conclusion about their closure is made.

## Confirmed findings and assembly instructions

**RT-AREA-ktheory-1/29:** the packet records the edge `K2SymbolsBrauer:T.1:classical → K3BlochGroups:V.1`. V.1 imports stable St, the universal-extension theorem and `uce-source-superperfect`; it obtains superperfectness from the inherited Recognition corollary. It retains BSt plus construction, Hurewicz and the K₃ bar-cycle comparison.

**RT-AREA-ktheory-1/30:** Recognition, perfect-group existence, Hopf's formula and natural kernel–H₂ identification already have parent owner ids. They are imported, not duplicated. The packet records `K2SymbolsBrauer:T.1:classical → StableHomotopyKTheory:H.3`, and the exact contract for `H.3/plus-pi2-universal-central-extension`. H.3 replaces its unread Recognition source input with those nodes and retains the topological fibre argument. T.1:plus uses the same algebraic package.

The seven `inheritedRefinements` are keyed by existing owner ids. Assembly keeps the inherited statements and applies only these proof/prerequisite refinements. The two new nodes, six inherited planets, target coverage and outgoing consumer contracts are explicit. The current blueprint projection code does not apply these supplemental fields automatically: integration must apply the two recorded stage edges and refinements when the reviewed parts are assembled. No consumer packet, parent packet or atlas data was edited. Both proposed edges were checked against the current atlas graph; neither has a return path.

## Sources and existing-library checks

Fresh public readings were Weibel's combined author draft dated 29 August 2013, III.1.2 (printed p.180), III.5.1–5.5.1 (pp.217–220), and Exercises III.5.2–5.3 and III.5.7 (pp.228–229); and Löh's 2019 notes, Theorem 1.5.1 and the extension/action/classification material 1.5.6–1.5.11 (pp.30–37). The packet records URLs, hashes, access date and the PDF-page offset of eight. The inherited free-homology, quotient-bar and Hopf source readings retain their earlier review provenance; they are not presented as fresh readings here. No restricted reference was needed or read.

Three fresh source findings are recorded in the worker's own words: the temporary integral-coefficient label in III.5.3, the dimension and triangular-direction slips in Exercise III.5.2, and the false unrestricted central-composition assertion in Exercise III.5.7. A Heisenberg group over ℤ/3 gives a concrete counterexample to the last. The inherited composition node already has the needed perfect-intermediate hypothesis. The parent's independently confirmed `K2SymbolsBrauer/E2` finite-UCE finding is retained by reference. The live author errata link returned HTTP 404; no novelty or version-of-record collation is claimed.

The accepted AUDIT-29 classical entry was read. The current read-only TauCetiRoadmap and Tau Ceti sources, including the post-snapshot roadmaps, were screened for overlap. The nearby upstream readings were RepresentationTheory/InductionRestriction and RepresentationTheory. Their factor-set classification is existing work and is cited through its pinned implementation. Current-library additions absent at the pin are not used. Public Mathlib PR and external Steinberg-project searches supplied no matching stable arbitrary-ring implementation.

## Validation and next action

`check_blueprint.py` with a declaration index from the pinned shared libraries reports zero errors and zero warnings. A separate scratch check resolved every imported owner and refined prerequisite, traversed the reachable declaration DAG, checked both proposed stage edges, verified both source hashes, and checked compact-file shape and absence of private paths or source excerpts. Exact integer matrix computations verified the noncommutative column and row coefficient orders and the opposite-root exclusion; the ℤ/3 Heisenberg calculation verified the inherited positive transgression sign and the central-composition counterexample.

The 139-line suggested file elaborated with `lean-check` at the pinned build, exit 0. Its only warnings are sixteen admitted-proof warnings. Its two light predicate definitions have real bodies. No theory carriers are implemented, and no commented future signature is offered as elaboration evidence.

The next action is independent review, followed by assembly applying the explicit refinements and outgoing interfaces. No additional blueprint pass or new source acquisition is required for this classical scope unless that review finds a mathematical gap. This worker opens one PR for #9306 and stops without another claim.
