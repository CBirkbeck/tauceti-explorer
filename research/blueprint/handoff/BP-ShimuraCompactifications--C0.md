# Handoff: BP-ShimuraCompactifications--C0

## Identity

Issue **#990**; agent **ChatGPT Pro**; session **cgpt-20260926-qseries-a91f**. Branch: `cgpt-20260926-qseries-a91f-c5-strata`. The claim was posted, bot-confirmed and the issue re-read with `state:claimed` before file creation.

This is an **initial partial checkpoint**, not completion of #990. The named packet, reader and handoff did not exist when checked; no existing decomposition was replaced. Scope is exactly C0, C1, C2, C2.general, C3, C3.general, C4 and C5. C6 is untouched. Only the four permitted deliverables are added.

The accepted RS-32 proposal and review were read. Its exact title, analytic-toric first prerequisite, narrowing of C0/C2/C3 and R11.3 ownership transfer for C4 are retained. No scope id is dropped.

## Mathematical advance

This work continues the owner side of the geometric request isolated in B5 PR #2949. That PR supplied the generic smooth-closure/Stein argument but kept the actual PEL stratum identification open. The present packet gives five C5 targets with their mathematical proof steps:

1. Smoothness over the arithmetic base of scheme-theoretic intersections of the actual boundary components.
2. Density of their exact boundary opens in every geometric fiber.
3. Identification of each nonempty labelled stratum component Z with `W intersect D_J^o`, for a unique connected component W of the relevant intersection.
4. Properness of that closure W, without using a minimal compactification or projectivity.
5. Geometric-fiber component detection by a collection of neat strata that detects every total-space component.

The key source input is the **ordinary étale stratification-preserving algebraic model** in 6.3.2.5, not a formal completion alone. The relative toric coordinates, neat branch-separation condition and the actual label-preserving groupoid imply local constancy of labels on the exact boundary pattern. This is what turns an unspecified dense open into the precise open obtained by deleting the other boundary branches.

The reader spells out the argument that connected components of the boundary intersection, rather than the whole intersection, are needed. It includes the two-section intersection example on `P1 × P1` and the DVR example that disproves an arbitrary total-density-to-fiber-density shortcut. The monomial-coordinate proof is applied after actual geometric base change and étale descent; rational-point counts are not used.

The final result applies the generic detector in **SF.2**, after SF.1 spaces/descent and proper coherent cohomology. The reader gives its exact interface and the clopen-image proof through the finite étale Stein factor. This is not a second definition or duplicate theory in C5. The arithmetic-base Stein factor is not the Shimura minimal compactification.

**Boundary:** these are written mathematical deductions about the source's actual model, assuming its established construction/chart theorems. They are not Lean proofs, a complete backward chain implementing that model, or the non-neat theorem. The packet explicitly leaves those construction and signature chains open; no record storing the desired conclusions replaces them.

## Counts and preservation of scope

- **5 nodes:** 3 lemmas and 2 theorems, all `unchecked`.
- **2 planets:** Stratum closures; Boundary component detection.
- **3 freshly source-checked baseline declarations.**
- **8 supplier requests; 6 explicit gaps.**
- **0 new definition/construction nodes, 0 API entries and 0 definition/construction unit tests.** This checkpoint instead records acceptance cases for its theorem targets.
- The suggested file contains **3 existing-carrier specialization examples**. They are not implementations or tests of the five geometric targets.
- All **8 stages** have coverage records and precise remaining work; none is marked closed or source-decomposed. The untouched general-data, Hecke, degeneration, positivity, normalization and projectivity endpoints are retained.

## Ownership

SF.0 owns coordinate algebra, generic morphism properties, regularity and open-map density. SF.1 owns the algebraic-space descent and component topology. SF.2 owns the assembled generic Stein/detection theorem, after its proper coherent-cohomology inputs. PELModuli M2 supplies the good-base moduli spaces and smooth lower-dimensional cusp bases without presuming C5's integral scheme/quasi-projectivity output.

C0 supplies the relative integral extension of the shared finite-complex chart; C1 supplies the actual labels and incidence; C4 supplies torsors, degenerations and chart families. The corresponding construction chains are not yet fully decomposed in this initial packet. The RS-32 L0/L4/L5 and R11.3 contracts are preserved; finite complex toric geometry and local Raynaud uniformization are not reconstructed.

Keep the module order early spaces/descent → SF.2 proper cohomology/Stein/detection → early C5 → B5. There is **no dependency on B5** in the C5 theorem chain. Before promoting whole-stage edges, separate C5's early toroidal exports from its minimal/positivity exports, since the latter use B5 constant terms. Current stage ids are unchanged and the required split is recorded, not applied by this job.

## Repository and library checks

Required worker, blueprint, browser-agent, expansion and upstream protocols were read. Current roadmap/stage records, the accepted RS-32 result/explanation/review, the full relevant compactification reader, the foundations reader and M2/M4 PEL interfaces were consulted. The analytic-toric introduction and L0 text were read as the unchanged first-prerequisite scope; ModularForms and AdicSpaces introductions supplied additional upstream-style examples.

`data/library-coverage.json` returned empty content because of its size and is **not claimed read**. The source audit `research/blueprint/audit/AUDIT-10.result.json`, blob `b95fe5ee69ad0be02c09c1fab78b0c4f35614098`, and its accepted review `REV-AUDIT-10.md`, blob `14cf8777fd130019de3948493b916fa2dc27f530`, were used instead. The compactification C0/C1 entries and C2-through-C5 entries were read, including corrections distinguishing existing finite toric, base-ring group-scheme and mixed-Hodge work from missing PEL constructions. The separate oversized integrated file was not inferred from an unreviewed draft.

Unchanged pins:

- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Fresh pinned source checks:

- `TauCeti.Toric.Fan.ext`, `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean`, lines 65–122; blob `1307c2afe0e5d505deb0bbb921d3e15240786b24`. The finite-cone structure and extensionality proof were read.
- `TauCeti.SplitTorus.groupScheme`, `TauCeti/Algebra/AlgebraicGroup/SplitTorus/Scheme.lean`, lines 15–83; blob `35edca4c8e433270976821c2e9c878ddbb86228e`. Its arbitrary commutative base-ring and finite-rank hypotheses were checked.
- `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`, `TauCeti/AlgebraicGeometry/IrreducibleOfConnectedDomainStalk.lean`, especially lines 320–430; blob `79389ce59eb9c5115c3c07c5e0ede52bd5be6054`. This is a **scheme** theorem; it is not asserted to prove the algebraic-space conclusion by itself.

Limited searches with no matching normal-crossings or dense-preimage result are not exhaustive absence certificates. The advanced PEL-target planning relies on the reviewed audit, the exact source objects and explicit owner interfaces, not on those negative searches alone.

## Primary reading and source limitations

All access dates are 26 September 2026.

- Lan's author-hosted thesis revision dated 14 March 2021, `https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf`: the exact ranges are listed in the packet. Principal new passages are 6.2.5.25–6.2.5.27, 6.3.2.5–6.3.2.9, 6.3.2.16, 6.3.3.1–6.3.3.4 and the quotient/stratum descent through 6.3.3.16. The relevant theorem/proof in 6.4.1.1 and B5 consumer in 7.1.2.14 were also read. Printed pp. 503, 519–523 and 539 were inspected as rendered pages in this turn. The image request for p. 504 failed; its parsed text was read.
- Author-hosted errata, `https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf`, items 60–74, especially ordinary étale/finite-type corrections and the actual torsor/stack description and equivalence-class labels.
- Stacks `https://stacks.math.columbia.edu/tag/0CBN`: absolute normal-crossings definitions and intersection proof; branch normalization was only a lead for the non-neat work, not a proved relative stack interface.
- Stacks `https://stacks.math.columbia.edu/tag/0A18`, including proofs of the Noetherian algebraic-space Stein theorem and its finite-étale refinement, also opened at `https://stacks.math.columbia.edu/tag/0E0D`.

The publisher edition was not inspected. Binary downloads failed, so no PDF hash is invented or copied. The source list is **not** a declaration that all of Lan's chapters 4–7 or every source for the eight-stage roadmap has been decomposed. Known errata are incorporated as requirements; `sourceIssues` is empty and no new paper-error claim or author contact is made.

## Validation actually performed

The prepared packet passed a local Python JSON round trip; exact eight-stage coverage; five unique ids; all-node unchecked status; partial-coverage safeguards; an internal topological-order check; no reverse B5 supplier request; and short-excerpt checks. The committed packet is checked independently by repository submission CI, whose result must be observed rather than inferred from those local checks.

A separate executed finite regression enumerated **4,681 cases**: ranks 0–4, all subsets J and exponent vectors with entries 0–3. A monomial lies in the coordinate ideal generated by variables in J exactly when its product with the complementary-coordinate monomial does, and the exponent shift is injective. This checks a finite sample of the coordinate saturation/injectivity mechanism. It is not a proof of density, a general polynomial test, a PEL calculation or a Lean test.

The suggested file **was not compiled**. No complete local repository checkout, full repository unittest suite, global stage-cycle check or pinned Lean run was available. Three typed examples reuse checked declarations but are not represented as compiled results. Current-head changed paths and submission/blueprint CI are to be recorded on the PR after observation; no predecessor result is borrowed.

## Exact continuation work

Preserve the five node ids and their neat, good-prime, relative-chart hypotheses. Review the exact-pattern argument against the source's global branch and equivalence-class labeling, rather than reducing it to total-space density or silently extending it to non-neat levels.

The next construction chain is **C0's relative integral regular-coordinate theorem together with C4/C5's actual good algebraic models**: read the full algebraization and approximation proof leading to 6.3.2.5, create the construction node/API/tests on the real torsor, family and chart carriers, and then decompose the relation and effective quotient in 6.3.3. Do not assume those carriers as arbitrary schemes with a list of desired properties. Use the existing finite Fan and base-ring split torus only in their stated scope.

In foundations, locate or implement the precise algebraic-space component detector after proper coherent cohomology and Stein factorization, reusing the scheme-only component theorem where applicable. This is one shared theorem for C5 and B5, not two copies.

For **non-neat** levels, construct the actual proper branch/normalization or stack/level-change comparison and prove coverage of every geometric component and the needed descent. Neither a generic absolute normal-crossings normalization nor a neat cover alone is the required theorem. Retain the separation from coefficient completion/base-change and all remaining C5 positivity/minimal/normalization targets.

Complete the other stage source decompositions without duplicating the RS-32 suppliers, and replace the current signature gap only when the geometric statements can be typed against genuine pinned-compatible objects.
