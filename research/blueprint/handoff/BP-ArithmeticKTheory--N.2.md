# BP-ArithmeticKTheory--N.2 handoff

Worker: Codex, session `codex-s6RYzw`. Issue: [#6473](https://github.com/CBirkbeck/tauceti-explorer/issues/6473). Branch: `codex-s6RYzw-arithmetic-n2`. One job was claimed, after the bot confirmed the exact session claim. This is a completed planning pass, not a checkpoint or an implementation claim.

## Result and scope

Only the four N.2 deliverables are changed. The packet has `part: N.2`, scope exactly `ArithmeticKTheory:N.2`, and status `complete`. Its five fresh nodes comprise one construction, two theorems, one comparison and one application. There are eight API items, six construction unit tests, three new planets and seventeen pinned baseline declarations. Every implementation status is `unchecked`.

The accepted N.1 packet is unchanged. Its finite-support, generic arithmetic interface, transfer, classical-row, S-enlargement and even-degree-injectivity nodes are cited by their existing ids. The new result fills its recorded contravariant finite-extension gap:

- The residue pullback is the homomorphism with q-coordinate e(q/p) times residue restriction, with finite support from finite prime fibres.
- Tensor pullback on the torsion category is computed through dévissage using the q-primary coefficient filtration of B/pB. Each of its e(q/p) exact quotient functors is residue extension of scalars.
- Functorial abelian localisation gives both residue-to-integral and field-boundary squares in every degree, not just a valuation check.
- The low-degree comparison fixes the right-linear tame-boundary convention and distinguishes ramification e from residue degree f and from covariant norm/transfer.
- The arithmetic application states full inverse-image prime sets for finite projectivity, tower composition and S-enlargement projection. A larger upper prime set is handled by factoring through a further localisation rather than asserting finiteness over the base.

The reader is approximately 3,650 words and includes the target-ownership map, hypotheses, coefficient-filtration proof, full map contracts, API, tests and acceptance conditions.

## The two assigned red-team findings

**RT-AREA-ktheory-1/9.** The degree-two tame-kernel, S-integer and relative S-integer sequences, including injectivity, are imported from the exact T.5 nodes present in `K2SymbolsBrauer--T.3.json`. Their statements were read. No tame-kernel definition, certified-presentation method or K₂(ℤ)/K₂(ℚ) calculation is planned here. The supplier packet remains partial with a needs-changes review, so it is treated as an unchecked mathematical interface. N.6/N.8 edits are outside this issue's scope.

**RT-AREA-ktheory-2/42.** The generic Dedekind localisation sequence and unit-valuation boundary are imported from S.3's exact nodes. The tame boundary is imported through T.3's existing sign-aware comparison. Prerequisites supply S.3 → N.2 and T.5 → N.2; no atlas or campaign data is edited. New nodes only plan the arithmetic finite-extension compatibility missing from N.1 and its map-level specialisations.

## What remains

N.2 coverage is `planned`, rather than `closed`, with **one inherited gap and no new requests**. None of the five new nodes has a mathematical gap.

The residual whole-stage target is N.5's odd-degree isomorphism. The N.1 packet records missing finite-coefficient inputs for `N.5/soule-mod-l-surjectivity`. Current `KTheoryFiniteLocalFields:L.1/k-theory-mod-m` and `L.1/bott-element` now provide the coefficient object, module structure and natural Bott element; those statements were read. The handoff does not repeat the stale claim that no supplier owns any finite-coefficient theory. The N.5 owner must reconcile these existing nodes and finish the generic finite-coefficient localisation with transfer-compatible boundaries, the product used by the proof, and the degree-one injectivity contract. This gap is kept in the packet because N.2's stage asks for the odd-degree result. It is not a prerequisite of the new restriction argument.

A subsequent assembly should combine the existing N.1 N.2 nodes and these five nodes, retain the S.3/T.5 owners and both variance directions, and close the whole-stage coverage only once the N.5 input gap is discharged. No further decomposition of contravariant N.2 restriction is requested. Actual higher-K formalisation belongs to the supplier and implementation work; no mathematical closure is inferred from compilation.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.2.json` with the pinned declaration index: **0 errors, 0 warnings**.
- The suggested file was elaborated by `lean-check`: **exit 0, fifteen warnings, all uses of `sorry`**. Only individual Mathlib modules are imported, and the shared build's Mathlib commit was verified as `082e2d37e8b0463410cdb532e111cd43d5a66174`. It uses no Tau Ceti modules from the shared build, whose Tau Ceti checkout is newer than the recorded source baseline. Tau Ceti source claims were checked separately at `f790474821cf4256814db967cb154e7af3d0c369`.
- The file checks the genuine dependent-group finite-fibre template, all eight API signatures and all six examples. Four named higher-K signatures remain explicit comments because the K-functor, induced exact-functor maps, dévissage isomorphisms and boundaries are unavailable at the pinned baseline. There is no fake higher-K carrier, proposition-valued placeholder or assumed comparison conclusion.
- Free memory exceeded 20 GB before compilation. One Lean process ran at a time through the prescribed wrapper; no LSP, project setup, dependency update or build was started.
- An additional read-only graph check combined atlas stage prerequisites/edges, integrated decomposition links and packet dependencies. For each supplying stage of a newly added edge into N.2, there was no reverse path from N.2. This includes S.3 and T.5, and avoids importing N.5 as a prerequisite of localisation. The packet checker also reports no internal node cycle.
- Packet/reader/signature names, test kinds, the exact scope, allowed paths, short source excerpts and combined N.2 planet count were checked. There are four N.2 planets including the existing N.1-packet planet, below the limit of six.

## Evidence retained for the reviewer

The primary source was Weibel's author-hosted standalone Chapter V, read on **2026-10-06**, URL `https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf`, SHA-256 `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`. Read: V.1.1–1.2 and V.1.8; V.4.1–4.4; V.5.1 and its proof; V.6.1; V.6.6–6.6.4; V.6.8–6.8.1; V.6.10.2; and V.6.11. Locators use standalone printed chapter pages. The new contravariant formula is explicitly derived from additivity, torsion dévissage and localisation; V.6.6.4 states the opposite-direction transfer, and is not claimed to state the new theorem.

The coefficient-filtration proof was checked specifically against V.4.2.1's warning: quotient by the maximal ideal is not an exact functor on arbitrary artinian modules. Exactness here comes from the residue-vector-space source and tensoring with fixed coefficient modules over a field. The argument uses G/dévissage of the thickened fibre, not nilpotent invariance of its K-theory.

Five known source issues E2–E6 from the accepted N.1 register are preserved with the standalone chapter's locators and version record. They have not been presented as newly discovered findings or as errors verified against the published edition. The published edition and its current errata were not inspected in this run. No missing source prevents the new ramified restriction proof; the remaining finite-coefficient input belongs to N.5 as described above.

The reviewed library audit and all roadmap links mentioning ArithmeticKTheory stages were read; no link-packet entry mentioned N.2. The complete nearby upstream GlobalNumberFields and LocalFieldsRamification reader documents supplied the expected carrier, normalisation and map-level acceptance conventions. Scratch source files and logs are removed after submission; all evidence needed to resume or review is recorded here and in the deliverables.
