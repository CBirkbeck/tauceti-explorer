# Completed target-level planning pass: valuation exports

Job: BP-ClassicalAdicEtaleCohomology--H1-valuation-exports, issue #6929.
Agent: Codex (GPT-6), session codex-kWz8uS, 2026-10-10.
Scope: ClassicalAdicEtaleCohomology:H1:valuation-exports only.

The packet has **status complete**, with the stage **planned**. Every target
in scope is represented; the exact supplier requests prevent a claim that the
stage is closed. This is a finished planning pass, not a checkpoint. An
independent reviewer should assess the four deliverables and their dependency
boundaries. No implementation or independent review is claimed.

## What is specified

The eleven H0 imports retain their identifiers, statements, APIs and suggested
file. The four existing follow-up nodes remain valid: bounded-below total
invariance, the separably closed extension, global closed-support invariance,
and proper-nearby/formal-tube coherence.

Seven targets complete the pass:

- Sheaf local-cohomology base change along a proper pulled-back closed
  constructible base boundary, with arbitrary valuation map and arbitrary X.
- Vanishing of sheaf local support when the boundary and the closed point of
  its complement map to the same base point.
- Global cohomology invariance for arbitrary prime-to-char(X) torsion abelian
  sheaves under a surjective valuation-spectrum map.
- The specific sheaf adjunction unit and all positive derived direct-image
  vanishing for such pulled-back sheaves.
- Finite-rank descent of finitely presented schemes, constructible sheaves and
  closed constructible base boundaries together.
- Constructibility of complement extension and sheaf local cohomology under
  **local finite presentation or a finite point set in the base boundary**.
- Finite generation of ordinary global cohomology under **finite presentation
  or finite Krull dimension of the valuation base**, with global finite type.

The source book is now cleared for direct reading. The obsolete unread-source
and unverified-numbering gaps have been replaced by exact target statements.
The reader separates sheaf local cohomology from global support groups, records
canonical maps, and keeps the coefficient and presentation alternatives.
Finite-rank descent is not confused with H0's reduced finite-presentation model.

Counts: **11 nodes: 9 theorems, 1 comparison, 1 lemma; 0 new owned definitions
or constructions, 0 owned API items and 0 definition unit tests; 4 planet
nominations; 23 baseline declarations; 2 gaps; 3 supplier requests; 1 stage
planned, 0 closed.** Three meaningful specification examples in Lean check the
expanded SF.2 constructibility interface (zero, constant finite module,
inverse image); they are supplier checks rather than new owned definition tests.

## Follow-up boundaries

The next work is supplier refinement, not recovery of another source statement.

1. **SchemeAndStackFoundations:SF.2:** actual bounded-below étale inverse/direct
   image and global sections on arbitrary schemes; their adjunction units and
   coherent composition; sheaf versus global supported functors, natural
   localization maps and the support spectral sequence; general constructible
   sheaves over nonnoetherian schemes, coefficient compatibility and affine-limit
   descent; arbitrary torsion-sheaf finite-rank approximation; finite-type
   constructible-cohomology finiteness over a separably closed field. The last
   input is identified through Huber's citation to SGA 4½, Th. finitude 1.10;
   that SGA text was not independently read in this run. The directly read
   Stacks 0F0B supplies field invariance, not that finiteness theorem.
2. **ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles:** extend its
   locally-finite-type/dominant nearby-base-change node to the full Cartesian
   statement of Huber 4.2.4, with neither restriction. Retain its existing
   constructibility theorem for Huber 4.2.5. The previously requested
   Hansen–Scholze generic Rj*/ULA equivalence and flat-valuation compatibility
   remain needed for the independent bounded-below proof route. General ULA and
   the étale/pro-étale functor comparisons remain scheme-supplier objects.
3. **AdicSpaces, Layer 1:** finite-rank algebraic capture of finite coefficients
   inside a separably closed fraction field, retaining an actual local
   valuation-subring inclusion; the strict-local and quotient valuation algebra
   needed by the quadruples and rank induction. SF.2 supplies the scheme and
   sheaf descent attached to that algebraic input.

The inherited H0 formal-completion naturality, compactification and generic
finiteness prerequisites are retained rather than declared discharged. Assembly
must reconcile the four new planet nominations with H0's six: the packet
proposes separate scheme-invariance, finite-boundary/finiteness and nearby/tube
stars, or an at-most-six selection for an unsplit star. Current ids are kept;
no other roadmap, packet or atlas data was edited.

## Source provenance

All repository statements and explanations are authored paraphrases with
numbered locators. No source files, excerpts or extracted book text are in the
deliverables. The cleared book was read directly; nothing from it was copied
into scratch or the repository. Public papers were used only as source inputs.

| Text | Directly checked locators | SHA-256 |
| --- | --- | --- |
| Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg 1996, first edition; DOI 10.1007/978-3-663-09991-8 | §4.2 pp. 240–256, especially 4.2.4–4.2.9 and their proofs; p. 246 checked visually | b40a5c2ef56784d888206011ecb31bdc5e2e6120721a8c38b78b6cf2cd8d7e1a |
| Hansen–Scholze, author-hosted 38-page *Relative perversity* | 4.1 and 4.2 pp. 19–22; 4.5 and proof pp. 22–23; 3.5 and proof pp. 16–17. Earlier coefficient-convention locators are retained in the packet | 7fcca4cf382b20503f4f428b1268d2cd181488c96b362f34150c4f3daba9544e |
| Bhatt–Scholze, author-hosted 72-page *The pro-étale topology for schemes* | 5.1.6 p. 35, 5.2.6 p. 37, 5.3.2 p. 38, 5.4.1–5.4.3 p. 39; particularly the bounded-below unit and direct-image comparisons | 99b418b32846c12721e0603590be864b0982d5fa7cf594f8771fc78e53e014c7 |
| Stacks Project | 0F0B for field invariance; 09XP/0A45 for supports; 04DY, 0DCQ, 0DCS as retained scheme and valuation inputs. HTML is unpaginated | Dynamic HTML |

The packet retains the earlier Orgogozo and Lu–Zheng rechecks, with their
versions and hashes, and the published Bhatt–Scholze mirror verification from
the earlier handoff. Those are inherited provenance, not newly discovered
finite-boundary substitutes. The new book locators resolve that question
without changing the imported nodes.

The existing Bhatt–Scholze subscript finding remains. Two additional Huber
findings cover the p. 246 spectral-sequence coefficient and Cartesian-model
orientation, and the special-fibre counit coefficient in the first reduction
of 4.2.4. Their source versions, type arguments and searches for existing
corrections are recorded in sourceIssues. All are notation slips with unchanged
intended mathematics; no independent confirmation is asserted.

## Baseline and checks

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Pinned Tau Ceti audit: f790474821cf4256814db967cb154e7af3d0c369.
The suggested file uses individual Mathlib imports and needs no unavailable
Tau Ceti module. Its functor interfaces are named supplier obligations attached
to actual scheme morphisms. Its constructibility predicate is an explicit
finite-stratification specification, not an arbitrary parameter or admitted
Prop body. Torsion sheaves use universe-lifted integer coefficients, equivalent
to abelian sheaves, and geometric stalks from Mathlib's actual étale site points.

Current upstream audit: TauCetiRoadmap dea8191cc6047d6142a65872ebce6eeeb841a29b;
Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The AdicSpaces and
LocalFieldsRamification readers were read in full. Suggested files in the nine
newer upstream roadmap areas and current Tau Ceti were screened. Their existing
valuation, ramification and generic site-cohomology APIs do not supply these
scheme-étale valuation exports. The reviewed library-coverage audit was also
read. No upstream checkout was modified or built.

Validation:

- `python3 scripts/check_blueprint.py` on this packet, including the supplied
  declaration index: **0 errors, 0 warnings**.
- `lean-check` on the suggested file: **elaborates, with only admitted-proof
  warnings** at the pinned shared build. Memory was checked before each
  compilation; all compilations ran singly and have completed.
- Deliverable intake check: **4 files, 0 problems**. JSON validity, all eleven
  packet/signature names, all eleven unchanged H0 imports, the four retained
  statements, relative reader links, math delimiters, diff whitespace and exact
  authorized paths also **passed**. No Lean language server or library build was run.

The independent review should pay particular attention to the exact supplier
generality for 4.2.4 and the two different finite-rank reductions. No second job
is claimed in this session.
