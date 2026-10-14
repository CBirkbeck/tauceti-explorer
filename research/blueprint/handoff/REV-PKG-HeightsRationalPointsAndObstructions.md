# REV-PKG-HeightsRationalPointsAndObstructions — handoff

Issue #9738. Reviewer Codex, session codex-9s58xl, 2026-10-14. The bot confirmed this session's claim. This is the completed independent review of the different session's package in PR #9794, commit `72a9596fa`; it is not a checkpoint.

**Verdict: needs_changes.** The clear fixes and mandatory review checks are complete. The package still lacks owned prerequisite targets/proof chains for several end theorems. Its accepted input has 17 gaps and no closed stages. Exact mathematical restart points, source access limitations, the 15-node random source sample and all 139 final target instantiations are in [the review report](../reviews/REV-PKG-HeightsRationalPointsAndObstructions.md). The package's additional-contract section now explicitly marks these unresolved obligations. Neither changing the packet status nor adding sorry-defined Lean carriers would resolve them.

## What changed

The README, Suggested.lean and new review.json were edited. Metadata remains the valid one-line number-theory category. The accepted packet and other jobs' files were not edited.

Three input targets — `RP.2/points-topology`, `points-topology-presentation`, `points-topology-base-change` — moved to the **current ReductiveGroupsPartII §RG2.0.1** boundary. General finite-type local compactness is there too; compact/open integral model points are §RG2.0.3. Removed the corresponding general Lean carrier, instances, theorems and examples, and its later adelic local-compactness theorem. The kept native adele-point specialization has a real-bodied topology instance. Old README §§2.4–2.31 are now **§§2.1–2.28**, with internal references renumbered. The three removed headings leave no stubs. The five prior Brauer/Azumaya/Abel–Jacobi imports remain; **139 numbered targets plus eight imported boundary items account for all 147 inputs**.

Imported the abelian-subvariety carrier and Poincaré complement API from **AbelianSchemesAndArithmeticModuli §§A6.3–A6.5**; retained the stronger positive-dimensional quotient and coset construction. Current Tau Ceti supplies compact completion integers and adele local compactness, resolving input gap 6. **ArithmeticGaloisDuality §R02.4.5** already supplies restricted cohomology finiteness for finite prime-to-characteristic modules over global function fields; the model/general-group adapters remain missing, not that theorem.

Corrected quaternion tests t=0→t=1 on ℚ[t,1/t], added a no-t=0 control, positive rank for matrix Azumaya, consistent additive scheme-Brauer evaluation (`eval_add`, split zero), and positive prime-to-characteristic n for smooth-group Kummer tests. Added Sha, coset/finite-union, restricted-product and four-conjecture controls. Corrected source pagination and variant scope; Mattuck's primary public locator was checked. Bombieri–Gubler Corollary 9.3.10 is explicitly an unverified bibliographic reference with no proof step depending on it. No uncleared book copy or private passage was used.

The duplication audit used current roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`, current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and the pinned Mathlib/Tau Ceti declarations. The newer merged **SchemeAndStackFoundations PR #779**, merge commit `d23fdaf388733bd9bcb0dc9b7963cc336f21461d`, was checked directly for §2.22 and the boundary link restored to that upstream roadmap. Its general Brauer comparison is still narrower than the Gabber/purity interfaces required here. The nine post-snapshot and Completed roadmaps were included in the semantic search. No Lake command was run in the current read-only environment.

## Where to resume

First plan the geometric interfaces underlying the early heights and point constructions: uniform local presentation bounds, normal-base generic-trivial bundle descent, positive-dimensional quotient/stabilizer representability, the arbitrary-dimensional Brauer comparison/purity/compactification/Lefschetz and CH₀ reciprocity contracts, and smooth Néron identity formal charts. Their lower suppliers supply parts, not the entire stronger assertions.

Then close **Lang–Néron before height-kernel positivity**, the global-function-field model/general-torsor adapters, and the connected-cover/type/H² torsor-existence and formal-lemma auxiliary-place routes. Keep smooth-group twisting separate from characteristic-dividing fppf kernels.

For the end theorems, input gap 12 is essential even for the curve route: **Bombieri §§6–9, pp.623–633**, requires owned product/Roth, derivative-index, nonvanishing and height-estimate targets. For higher dimension and finite rank add the product/arithmetic-Riemann–Roch and division-point inputs. Manin–Mumford/family uniformity, Ueno/Kawamata/Bogomolov–Rémond bounds and function-field Mordell remain separate proof developments.

The small-point route needs **ArakelovGeometryAndAbelianHeights Part II**, with semipositive adelic bundles, arithmetic intersections, Hilbert–Samuel, successive minima and uniform model approximation, not only bounded point metrics. It is a proposed owner, not yet a target-level supplier. Conditional genus-one sufficiency needs the **abelian Cassels–Tate/Brauer comparison** in addition to finite Sha; torus duality does not replace it. Public Stoll supports the conditional statement but does not close its formalization chain.

The number-field Subspace theorem supplier is now DT §2.8; pin the smaller normalized product-form adapter with a name and exact local-degree/determinant proof sketch. Certified computation remains properly deferred to EffectiveDiophantineMethods: finite compact evaluation partitions are an existence theorem, not a solver.

Original deep proof access remains unresolved for Raynaud, the full Hindry proof, Kawamata's *On Bloch's conjecture*, Bogomolov–Rémond degree bounds, higher-dimensional Faltings and the auxiliary-place formal lemma. Their statements have public secondary locators and their missing proof inputs remain explicit. The public Kawamata–Viehweg paper is a different paper and does not clear that source. No scratch file is required for continuation.

## Validation

- Packet checker: exit 0, 0 errors/0 warnings; 147 nodes, 17 gaps, 39 requests, 0 closed stages. Packet unchanged.
- Shared pinned `lean-check`: exit 0, 29 warnings, all sorry. Final file 230 lines, real-bodied light definitions, no sorry-defined data or developed theory. Only a blank-line removal followed that check. No compilation process remains running.
- Intake file check: five files, 0 problems. Diff whitespace check passed. Review JSON has the required reviewer/status/date object. Final target numbering and own-section references checked.

There are no upward owner moves introduced by this review. Preserve the author's directions: ArithmeticDynamics and AdelicAlgebraicGroups import the present arithmetic variants; FaltingsFinitenessAndIsogenyTheorems and MordellLawrenceVenkatesh consume, rather than supply, its unconditional rational-point theorem. The native elliptic pairing/prose discrepancy already recorded by the author remains an upstream note, not an edit to another roadmap.
