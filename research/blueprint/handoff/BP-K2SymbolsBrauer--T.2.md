# BP-K2SymbolsBrauer--T.2 handoff

Agent: Codex (GPT-6), session codex-8jRUHv. Issue: #9308. Scope: `K2SymbolsBrauer:T.2` only. This is a complete target-level planning pass, not a formalization and not a checkpoint. Every implementation status is `unchecked`.

## Result and coverage

The packet contains 26 nodes: 1 definition, 8 constructions, 16 theorems and 1 comparison. It has 43 API items, 30 named unit tests, 6 planets and 13 verified baseline declarations. The reader document carries every statement, hypothesis, prerequisite, proof step, API, test, use and acceptance check, together with the conventions and source locators. The suggested Lean file follows the compact signature policy: concrete functions and quotients on pinned carriers have real bodies; absent stable, graded and extension carriers remain README targets. It neither invents substitute carriers nor inserts data proof holes.

Coverage is `planned`, not `closed`. The pass specifies the field-presentation targets and imports the graded-map targets of the same umbrella stage with their exact supplier obligation. The two remaining gaps are described below. The predecessor `K2SymbolsBrauer--T.1.json` is unchanged; its definition and statement IDs are imported, and every new node has a fresh ID.

The local field refinements supply:

- the bilinear Steinberg pairing predicate, its integral skew/diagonal identities and the universal integral tensor-square presentation;
- homogeneity of the two-sided Steinberg ideal, the actual direct-sum grading, low-degree identifications and the canonical degree-two presentation equivalence;
- functorial Milnor field maps, including identity, composition and generator equations;
- Weyl/diagonal lift calculus, positive-overlap commutator normalization, the Steinberg relation and bilinearity for the concrete classical symbol;
- the complete lifted Bruhat reduction modulo toral defects and its consequence that symbols generate the stable field kernel;
- Matsumoto's prescribed torus extension, the auxiliary doubled signed-Weyl square-subgroup presentation, the monomial extension and the two-branch permutation action;
- the rank-one/rank-two action checks, exceptional parameter cases and exact extension realizing a prescribed pairing with faithful coefficients;
- injectivity over infinite fields, independently proved tensor-square and stable classical vanishing over finite fields, the specified all-field Matsumoto equivalence and its naturality;
- the real sign and polynomial detectors and the higher-symbol permutation signs, preserving nonzero integral diagonal 2-torsion.

The source proof was checked with its domain restrictions: Matsumoto §5 onward assumes an infinite field. Finite fields are handled using cyclicity, the diagonal identity, nonsquare counting and the complete type-A toral presentation. F₂, F₃ and F₄ are explicit tests. No finite-rank universal-central-extension theorem is claimed in these small cases. In particular Steinberg's §7 Theorem 10 was not used: its statement has a field-size restriction.

## Exact remaining obligations

1. **G-T2-stable-imports.** The imported `K2SymbolsBrauer:T.1/stabilisation` still has its predecessor G-colimit proof refinement: every stable finite-word equality is witnessed at a sufficiently large finite rank. The imported `K2SymbolsBrauer:T.1/k2-is-centre` still has its predecessor G-centre refinement. The field proof uses both interfaces honestly. Neither is replaced by an assumed Matsumoto theorem, injectivity of all finite-rank stabilization maps, or finite-rank universality. This job does not close the arbitrary-ring stable-colimit/centre work.
2. **G-T2-product-symbol.** The owner `K2SymbolsBrauer:T.2:graded-map` must prove, for its actual classical-to-Quillen comparison κ, that κ([h₁₂(a),h₁₃(b)])=[a]·[b]. The exact orientation is part of the requirement. This yields equality between the graded map's degree-two component and κ composed with the comparison constructed here. An abstract isomorphism does not identify the chosen product map. The graded construction and its degree-three generator equation are imported, rather than independently replanned.

An independent review must assess this complete pass, including the sign correction and the lifted coefficient realization. The mathematical plan should not be read as closing the above imported obligations.

## Cross-roadmap interfaces and ownership

There are three requests in the packet, without opening or claiming additional work:

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`: the ordinary split Bruhat/BN-pair theorem and type-A root-coordinate specialization, including the unique monomial middle component and two simple-Weyl parameter branches. Current upstream main already plans ordinary structure theory. This packet owns the lifted presentation proof only.
- `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`: reduced-word braid invariance and minimal parabolic-coset representatives. The ordinary Coxeter Matsumoto theorem remains there; the coefficient-sensitive doubled signed-Weyl presentation belongs here.
- `K2SymbolsBrauer:T.2:graded-map`: the imported graded Quillen construction and exact product-symbol square above.

Current upstream ReductiveGroups and RootSystems roadmaps were read in full. The current Tau Ceti library and the reviewed library-coverage audit were checked. No existing tensor-algebra grading, ordinary Bruhat theory, Coxeter word theorem or matrix transvection calculus is replanned. The higher-local-field Milnor overlap is resolved by imports from this owner. No concept was moved between tiers, and no restructure is proposed.

## Sources and discrepancies

All four source records contain public URLs, retrieval date 2026-10-14 and PDF checksums. No source passage is reproduced; the source-issue descriptions are also paraphrases. No restricted book was accessed.

- Weibel's public author chapter III: III.5.10–5.10.5, pp. 42–44; Exercises III.5.8–5.9, p. 46; III.6.1–6.1.1, p. 48; III.6.2.1, p. 49; III.7.1–7.2(c), p. 61. III.6.3, p. 51 was read only to distinguish a symbol from its inverse in the source discrepancy. Chapter and PDF pagination coincide.
- Matsumoto's original 1969 Numdam scan: §5, printed pp. 22–31; §6, pp. 33–43; §7, pp. 43–47; the opening functorial observations of §9, p. 50. The cover gives a one-page PDF offset. The construction and local action proof were read, rather than using only the named theorem.
- Steinberg's public 1967 Yale notes: §6, Theorem 8 and Lemmas 36–40, printed pp. 66–72 (PDF pp. 73–79). §7 Theorem 10, p. 76 was inspected for its restriction only.
- Rehmann/Hamraoui's public ICTP notes: §1, pp. 1–9, as a supplementary convention check.

E-T2-1 records the repeated SL₃ Bruhat cell in Rehmann p. 7; the second (12) cell should be (13). E-T2-2 records the inverse-defect word in Weibel Exercise III.5.9 under the source's stated commutator/symbol convention. Direct conjugation and Matsumoto Lemma 5.4(c), p. 26 fix the positive-overlap orientation. The t-adic value 2 on (t,2) over ℚ(t) shows the difference need not vanish. This is not a claim of discovering new errata. The author notes and Bielefeld catalogue yielded no correction for the first. The advertised Weibel errata PDF returned HTTP 404 on both hosts, so a published correction for the second could not be checked. No source needed for the scoped proof is missing.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.2.json` reports zero errors and zero warnings. The suggested file elaborated with `lean-check` in the shared pinned build: exit zero, with only warnings for theorem and example proof placeholders. It has concrete data bodies and is well below 5,000 lines. Memory was checked before elaboration, and no language server or library build was started.

The final submission also runs `research/blueprint/intake.py check-files` on all four deliverables, checks whitespace and confirms that no source excerpts, local filesystem paths or modifications outside the issue's files are present. The pull request uses `Refs #9308` and names Codex/GPT-6. The issue number and PR URL are recorded in the worker's job directory. Scratch sources and working notes are removed after the PR is open; this note preserves everything required to continue or review the plan.
