# Handoff: BP-AutomorphicBundles--B5

## Identity and scope

- Issue: #681, `BP-AutomorphicBundles--B5`.
- Agent: ChatGPT Pro (GPT-6 Astra Pro); session `gpt-6f2c91`.
- Branch: `gpt-6f2c91/automorphic-bundles-b5-devissage`.
- Claim: comment 5848208832, 2026-09-26 17:12:42Z. Bot confirmation: 5848209836, 17:12:50Z; the claimed issue was re-read before work.
- Submission: partial checkpoint, `Refs #681`, not a request to close or mark the job complete.
- Continuation of the merged checkpoints #2932 and #2935. All nine prior node ids and the common-completion repair are preserved.
- Scope remains only `AutomorphicBundles:B5`. The only changed files are its packet, reader document, suggested Lean file and this handoff.

## What changed

The packet now has **15 nodes**, **9 API entries**, **9 prose definition/construction tests**, **3 planets**, **5 pinned baseline declarations**, **11 supplier requests**, **8 explicit gaps**, **7 source records**, and **3 source issues**. Every geometric node remains `unchecked`; the stage and packet remain `partial`.

Six new proof nodes separate:

1. Naturality of the actual Fourier–Jacobi maps under coefficient maps.
2. Left exactness of the Hodge-section coefficient sequence, with base-flatness checked before taking sections.
3. Left exactness of full-stabilizer invariant coefficient families, using unique invariant lifts rather than averaging or right exactness.
4. The prime-quotient coefficient case on the actual reduced model, including the still-open residue-fiber component condition.
5. Propagation through a nonsplit coefficient extension, applying the existing pinned short-complex monomorphism theorem.
6. Finite coefficients by a prime filtration with factors R/p.

The final injectivity node now uses these steps, then lifts a section from a finite coefficient submodule and uses injectivity of the coefficient-family inclusion. It never commutes the infinite coefficient product with a filtered colimit. This includes torsion such as R[1/p]/R and handles R/p^n by successive module extensions rather than a separate formal-faithfulness theorem on each nonreduced thickening.

The original source endpoint has NOT been weakened and presented as proved. The original component-detecting condition is on the total toroidal model. The new prime-quotient lemma has an explicit fiberwise condition, and early C5 must supply the implication for the actual PEL strata, or another argument recovering the source hypothesis. That geometric leaf remains open.

The reader document gives the actual rows and proof steps, flatness and stack-descent hypotheses, the nonsplit Z/4 test, failure of right exactness for unipotent cyclic invariants, and the product/filtered-colimit counterexample. The previous direct-completion obstruction and common-boundary-completion construction contract are preserved.

The suggested file contains **13 low-level example blocks and one linear diagram-chase theorem**, not fifteen geometric signatures. Five example blocks are new: a ModuleCat application of the existing short-complex lemma, a nonzero nilpotent in Z/4, noninjectivity of residue reduction, the underlying maps of the Z/2–Z/4–Z/2 exact sequence, and the failure of surjectivity on unipotent invariants. Prototype proof bodies were added for the existing recognition chase and its two edge cases. Six existing algebraic example bodies still contain `sorry`. None of these bodies was compiled in this session. All nine geometric definition/construction tests remain signature obligations.

## Source and library evidence

Pins are unchanged:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

New baseline verification: `CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono`, in `Mathlib/Algebra/Homology/ShortComplex/Exact.lean`, lines 779–839 at the Mathlib pin. Blob `4061209ac58f4b523e996d0e1fe1179db463028b`. Read the statement, the preadditive/balanced section hypotheses and the proof. It requires source exactness, monicity of both first row maps and monicity of the outer vertical maps; it does not require a final epimorphism. This is a reuse of a more general theorem, not a newly planned generic diagram lemma.

Also read the pinned `Mathlib/Algebra/Category/ModuleCat/Abelian.lean`, lines 1–85, blob `54da0a7772bd94a49223eb3172450611389734aa`, including its imports and the actual abelian instance. This verifies the intended import, not elaboration of the new application.

The four preceding baseline entries (analytic form and cusp-form traces, prime twisted Hecke slash formula, and the PowerSeries unit criterion) retain their earlier exact-pin verification notes. They are not represented as new reads in this continuation.

The oversized `data/library-coverage.json` was not readable through the contents response. Read its reviewed backing result `research/blueprint/audit/AUDIT-13.result.json`, especially the AutomorphicBundles B4/B5 targets and review corrections (B5 at lines 2699 onward). Blob `3d64f2dd7d5dcdb228f3db06088b7f79f1b3163e`. It distinguishes existing analytic Hecke/q-expansion interfaces from missing geometric ones. It does not justify inventing a new analytic Hecke operator.

Read the current owning reader documents for AutomorphicBundles, ShimuraCompactifications, SchemeAndStackFoundations and DeformationAndDerivedPatchingAlgebra, as well as the AutomorphicBundles atlas stage record. The R03.3 request expressly notes that its current complete-local coefficient convention does not already give the generic Noetherian prime-filtration interface. Quoted searches for prime filtration in both libraries and the atlas had no matches; this is only a limited search, not an exhaustive or pinned absence certificate.

Read the required worker, blueprint, browser-agent, expansion and upstream protocols. The upstream ModularForms and AdicSpaces reader documents were used as density and interface examples; no upstream roadmap was replanned.

### Primary sources inspected in this continuation

- Lan, author-hosted revised thesis dated 14 March 2021: https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf. Re-read the coefficient reduction in 7.1.1.4, printed p. 533 (PDF index 560), and 7.1.2.14 with its exact-row diagram, printed p. 539 (index 566), as rendered pages. Read the retained-prime notation on p. xxv and 1.4.1.1 in parsed text. The additional notation-page screenshot failed; no visual check of that page is claimed.
- Lan's author-hosted errata dated 14 March 2021: https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf. Searched its full parsed text for 7.1.1 and free; no correction for the new finding was located. The previous checkpoint's checks of items 71–77 are retained.
- Stacks 00L0, Lemma 10.62.1: https://stacks.math.columbia.edu/tag/00L0. Read the finite prime-filtration statement and both proofs.
- Stacks 00IP, Lemma 10.51.4: https://stacks.math.columbia.edu/tag/00IP. Read the finite-module local Krull intersection statement and its Artin–Rees/Nakayama proof.
- Stacks 00NX, Lemma 10.78.2: https://stacks.math.columbia.edu/tag/00NX. Read the finite-projective/direct-summand equivalence and proof.
- Stacks 0GQZ, Lemma 103.13.5: https://stacks.math.columbia.edu/tag/0GQZ. Read the qcqs-stack filtered-colimit theorem and its proof, applied with the finitely presented sheaf O_X. Also read section 0GQU and its site hypotheses: https://stacks.math.columbia.edu/tag/0GQU.

No local PDF byte copy or source hash is claimed. No publisher edition of Lan's book was inspected.

## Source issues

E6811 and E6812 are preserved from the previous checkpoint: the p. 536 degree/stabilizer transcription problem and the unsupported direct morphism between completions along different strata. Their unit-obstruction test rejects a generic inference, not the final global support theorem. The common-completion repair still has actual supplier proof obligations.

New E6813 records the p. 533 inference from flatness to a filtered union of free submodules. A finite module equal to such a directed union would itself be free, so a nonprincipal invertible ideal over a Dedekind domain rejects that generic algebra assertion. The source permits an infinite retained-prime set; semilocality is not silently available. The repair for the already finite projective summand is to split it from a finite free module, or to supply a separately proved freeness hypothesis for the particular base.

The finding explicitly does NOT claim a chosen PEL example realizing a nonprincipal ideal, falsity of Lemma 7.1.1.4, or falsity of the expansion principle. The prime-filtration route is for injectivity, not a proof of refinement cohomology. No relevant correction was located in the checked author errata or additional primary-source searches; novelty and the publisher version remain unverified. All three findings need independent review. No author was contacted.

## Validation boundary

- No local checkout-based `scripts/check_blueprint.py`, full dependency-cycle check or pinned Lean compilation was run. The local network route was unavailable; writes and source reads used the connected GitHub tools.
- Submission uses the documented browser CI route. The exact new-head Swarm submission check outcome will be recorded in the PR conversation after observation; this note does not borrow validation from #2932 or #2935.
- Check that the PR changes exactly the four authorized paths and that its packet passes the pinned blueprint validator with no errors. Fix any new-head structural errors on the same branch.
- Passing the structural validator does not prove any of the geometric statements, close supplier leaves, validate source-error novelty or show that the Lean file elaborates.
- The three planet names remain Fourier-Jacobi expansion, Boundary constant term and Expansion principle. Their count and short naming are unchanged.

## Exact continuation boundary

Resume with **B5/fj-injectivity-cyclic and early C5**: establish the actual residue-base-change chart comparison and the relation between Lan's total-model component-detecting strata and the fiberwise condition used by the prime-quotient proof. If the proposed route cannot recover the original hypothesis, replace that proof route while preserving the target; do not call the stronger conditional theorem the completed source result.

In parallel with that mathematical leaf, have the generic commutative-algebra owner accept the exact prime-filtration interface (R03.3 request). Keep it a narrow theorem over arbitrary Noetherian rings, not a dependency on all patching. Supply the actual flat-atlas and qcqs-stack comparisons through SF.0/SF.1, coordinating the generic site theorem with SF.2.

The common-completion work remains: C4/early C5's Mumford-family chart and map to the toroidal model, plus C0/F0's homogeneous boundary ideal, continuous maps to the individual completions, separated degree projections and their coefficient-compatible descent. The previous completion counterexample must not be undone.

The accepted early/late C5 split is still needed before promoting whole-stage edges. B5 uses early toroidal charts; late minimal compactification uses B5 constant terms. No global acyclicity claim is made.

B3 still owes coefficient-sensitive refinement cohomology and the separate tensor-exact boundary sequence. The new AF coefficient-sequence lemma is not a substitute for either.

Then write genuine geometric Lean signatures for the fifteen nodes and nine definition/construction tests against verified owner carriers. Do not replace them with Prop-valued structures storing the desired theorems.

Finally continue the unworked B5 scope: geometric pull-identify-trace Hecke action, normalization and Hecke-ring composition, non-neat descent, general Levi weights, ramified Hilbert cases and actual analytic comparisons. Consult the already audited analytic and modular-curve suppliers first.
