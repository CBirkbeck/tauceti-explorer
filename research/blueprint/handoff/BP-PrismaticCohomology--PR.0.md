# BP-PrismaticCohomology--PR.0 — δ/Frobenius/Witt checkpoint

Issue #978. Agent: ChatGPT Pro (GPT-6 Astra Pro).
Session `gpt-20260926-c4e7b2`, 26 September 2026.
Claim comment `5849875178`; bot confirmation `5849876082`.
Branch `gpt-20260926-c4e7b2-978-delta`.

## Status and preservation

**Partial checkpoint**, not completion of PR.0–PR.7 or a Lean implementation. All four issue paths were absent when read and are created here. No integrated data, roadmap content, other packet, label or issue state is changed manually.

The accepted integrated decomposition is `data/decompositions/PrismaticCohomology.json`, blob `2e5612e9f207b5e343060de4b845bd349c341f5c`. Its eight-node R2 review is inherited evidence, not this worker's review. The ID `PrismaticCohomology:PR.0/delta-frobenius-dictionary` is retained for the definition and refined by separate Frobenius and Witt constructions. The six other integrated PR.0 IDs and PR.1/prismatic-structure-sheaf are explicitly listed as remaining work. Their accepted corrections and gaps are preserved in the untouched integrated file. PR.8 is outside this issue.

## Advance

Sixteen declaration-sized nodes develop the elementary dictionary rather than storing it in an equivalence field:

- The integral addition correction, with the coefficient division performed before evaluation, and its cleared-denominator identity.
- The actual δ-axioms, an ordinary Frobenius-lift subtype, construction of the associated ring endomorphism, and its inverse exactly when multiplication by p is injective. Morphism reflection needs cancellation only in the target.
- The canonical integer operation, the integer-cast identity without cancellation in the target, and descent to a δ-stable quotient. Frobenius-stability alone is explicitly rejected.
- An actual central-square-zero extension with a family of δ-operations indexed by F_p. For a base δ-ring B mapping to F_p, the operation is
  δ_lambda(a,b)=(δ_B(a),(lambda-abar^(p-1))*b).
  The addition correction and multiplication calculation verify the axioms. Every parameter has the same Frobenius (a,b)↦(φ_B(a),0), but its value on epsilon is lambda*epsilon. This works at p=2 and over p-local bases as well as over Z.
- The two length-two Witt coordinate formulas, proved by cancellation only over universal integer polynomial rings followed by coefficient evaluation and truncation. The resulting equivalence uses the existing TruncatedWittVector carrier and actual ring-map sections of its first coordinate. Zero padding is not treated as a ring map, and ghost coordinates are not assumed injective on a torsion ring.

The square-zero family is an authored acceptance argument, not a claimed source example or erratum. For B=Z it also disproves replacing p-torsionfreeness by CharZero; for B=Z_(p) it lies in the source category. It does not say that a ring with some p-torsion cannot carry δ-data. It is not a prism example.

The polynomial prefix is deliberately generalized to commutative rings. Bhatt–Scholze's p-local, completeness and derived hypotheses remain required for all subsequent prismatic applications. The full Witt adjunction and derived Frobenius-homotopy comparison are not constructed here.

## Counts and genuine remaining work

**16 nodes:** 3 definitions, 5 constructions, 6 lemmas, 2 theorems.
**24 API items**, **24 definition/construction tests**, **3 planets**, **20 pinned baseline declarations**, **8 source records**, **3 gap records**, **0 open requests used by this elementary prefix**. Every implementation status is unchecked. All eight stages remain partial or not_read.

The suggested file gives the sixteen core declarations and all twenty-four API items and test examples on actual carriers. The prime hypothesis is explicit in the new defining carriers; the characteristic-p cancellation countertest also binds its prime explicitly. Opposite and central scalar actions are kept in the square-zero signatures. **It has not been compiled.** No typechecked δ or prism construction is claimed.

Free δ-algebras, localization/completion/perfection, distinguished elements, prisms and their ideals, boundedness, rigidity, regular envelopes, perfect-prism/perfectoid equivalence, the four actual prism examples, and the full PR.1–PR.7 cohomological/coefficient theory remain required. The packet records the prior specific source leaves instead of pretending this prefix closes those arguments.

## Evidence and ownership

Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Read the worker/blueprint rules, the full issue and confirmed claim, PrismaticCohomology's atlas and roadmap, the accepted integrated node/review records, RS-01's decisions and accepted review, and the scoped AUDIT-38 entries with accepted REV-AUDIT-38. The reviewed audit distinguishes the missing δ-structure theory from the existing Witt primitives. Fresh concept searches were limited and are not asserted as an exhaustive absence certificate. Earlier upstream ModularCurves/GrothendieckEulerForms readings informed interface style; they were not re-reviewed as part of this job.

All twenty baseline declarations were inspected at the exact pin. The seven files and blobs are recorded in the packet: binomial divisibility and expansion, finite-field Frobenius, central square-zero rings, truncated Witt rings and their surjective truncation, coefficientwise Witt maps and ghost components, and the first two Witt polynomials. The general polynomial derivative calculation in the reader is termwise finite algebra, not a new calculus library.

Primary mathematical source: Bhatt–Scholze, arXiv:1905.08229v4 (12 January 2022). The opening p-local convention, Definition 2.1, Remarks 2.2–2.5, Example 2.6 and Lemma 2.9 were read. Lemmas 2.11, 2.15 and 2.17 were read as context but are not completed by this checkpoint. Printed p.14, PDF index 13, was successfully inspected as an image. Requests for pp.13 and 15 failed; those are parsed-only reads. No fresh PDF-byte hash, publisher-edition comparison or whole-paper certification is claimed. No new source issue or author communication is part of this job.

## Checks actually run

Local Python checks passed for JSON syntax, the exact eight-stage scope, unique node/source/baseline IDs, resolution of every declared prerequisite to a local node or one of the inspected baseline references, the displayed-node DAG, required fields, source-excerpt bounds, planet constraints, unchecked statuses, and exact API/test-name agreement between the drafted packet, reader and prototype. The seven retained integrated IDs are explicitly recorded. These are not the repository-wide validator or a global atlas-cycle check. Publication condenses the drafted packet's prose without changing its declaration/API/test inventory; the uploaded packet must also pass the actual submission check.

Thirty symbolic identities passed over integer polynomial rings, at p=2,3,5,7,11: the correction identity and symmetry, its two first-order coefficient identities, and the two Witt ghost-coordinate identities. Cancellation is justified in these integer polynomial rings, not inferred from a computation modulo p.

Exact integer/F_p calculations checked **40,743 parameter/input pairs**, each for both δ-addition and δ-multiplication, on B=Z with integer scalars from -4 through 4, and **747 associated-Frobenius evaluations**. The zero, one and epsilon values were also checked for every parameter. The integer coordinate remains an integer; it was not reduced modulo p^n to manufacture a nonexistent finite δ-ring.

Exact p-local rational/F_p calculations checked **24,903 parameter/input pairs**, each for both axioms, using denominators prime to p. They also checked that every base δ-value still had denominator prime to p and that all associated Frobenius maps agreed on the test points. These are finite regression sets, not proofs of universal statements. The general proofs are written in the reader and packet.

No Lean/Lake executable, pinned checkout, full-repository check_blueprint.py, or global stage-DAG check was available locally. Current-head submission CI must be observed and reported separately; neither success of a predecessor nor this finite testing establishes elaboration.

## Continuation

Elaborate the actual-carrier prefix, especially the prime parameters, integer quotient formulas, central/opposite actions and coefficient transports in the Witt section construction. Keep the universal integer-polynomial cancellation proof: cancellation in an arbitrary target would silently destroy the torsion case.

Next refine the existing free/localized/completed δ-algebra and distinguished-element source nodes before moving to prism ideals. Import DD.1's derived-completion theory, CR.0's divided-power theory and Q0's integral-perfectoid prefix rather than creating private replacements. Preserve R2's complete-flatness and regular-envelope hypotheses. Finish the actual crystalline, A_inf, Breuil–Kisin and q-prism conditions; no result here identifies an arbitrary δ-ring as a prism.

The full source and cohomology worklists remain in the eight coverage records. This checkpoint must stay partial until those dependencies and the typed implementation interfaces are genuinely closed.
