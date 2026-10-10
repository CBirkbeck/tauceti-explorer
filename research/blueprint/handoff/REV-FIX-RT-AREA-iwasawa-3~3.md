# Handoff: REV-FIX-RT-AREA-iwasawa-3~3

Refs #5869. Codex (GPT-6), session `codex-xVALZ8`, 10 October 2026.
Claim confirmed for comment 6103080946. Initial checkout:
`2c95d0676ff2064366ce7f1120da575b7417c608`.
Rebased before submission onto `2f72a720f` and retained the intervening
algebraic-geometry review (codex-f0fT1p) unchanged in history.
Its update changed no mathematical fields or Lean signatures.
Branch: `codex-xVALZ8-review-5869`. No second job claimed.

**Blocked checkpoint: reconcile the live issue's scope with the queue before
reassigning.** The issue permits the review report and Motives packet/Lean
pair. The queue also requires GH.0 and Kato pairs. [WORKERS.md](../WORKERS.md)
says: “Edit only the files the issue names, plus your own scratch space.”
I requested a four-file scope extension while doing the permitted work;
none was received. The arithmetic owner pairs were inspected read-only,
not edited or given this job's verdict.

## Completed permitted work

The [review](../reviews/REV-FIX-RT-AREA-iwasawa-3~3.md) gives all eight
finding dispositions, source receipts, the exact arithmetic-owner repairs
and the source-specific scalar calculation. It follows the prior
checkpoints and the intervening algebraic-geometry review. It is a bounded
fix review, not a fresh audit of every packet node.

The missing canonical coefficient-map prototype is now supplied in
MC.5/diagram-localisation. It uses the specified extension's degree-zero
identification, finite endomorphism restriction with a component equation,
and dual restriction on the coefficient colimit. Its finite-colimit
compatibility fixes the map on every coefficient. The localized product
and multiplicative representation are induced from the effective ones.
The ring-map promotion takes explicit unitality, and the localization
statement uses that map's algebra structure. No arbitrary homomorphism or
localization hypothesis is substituted.

Three named examples check finite-coefficient compatibility, both inverse
identities and bijectivity when chi is already a unit. Their proofs use the
named supplier contracts and existing Mathlib results; the supplier
construction/proof obligations themselves remain admitted. The proved
polynomial-to-Laurent counterexample to the arbitrary-map contract remains.

The precise missing-signature gap is removed. All 23 earlier gaps, 16
requests, other 181 nodes, coverage and implementation statuses remain
unchanged. Two actually read Mathlib localization contracts are added to
the baseline records. The preceding review is appended unchanged to
reviewHistory. The new top-level marker is
`independent-review-REV-FIX-RT-AREA-iwasawa-3~3`, still `needs_changes`:
the relative Beck preservation adapter, typed reconstruction carriers and
fifteen API/four theorem defects from the independent geomlanglands review
remain real obligations. No stage or proof is closed.

The effective/localized period presentation, typed unital/product-compatible
comparison and rank-one Tate nonvanishing contracts survive the selected
review. MC.6 remains their owner; PS.2 owns integration and ev(L)=2pi i.
The current upstream ReductiveGroups and completed HodgeStructures
READMEs were read in full, with relevant Suggested forms and current
library checks. Known-Hopf reconstruction and abstract Hodge structures
are existing suppliers, not replacements for the missing geometric pair
comparison or arbitrary-neutral reconstruction. Neither upstream checkout
was changed or built.

## Exact resumption work

1. Obtain authorization for these four additional deliverables, or have the
   manager align the queue with the intended Motives-only scope:
   `research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`,
   `research/blueprint/suggested/GeneralizedHeegnerCycles--GH.0.lean`,
   `research/blueprint/packets/KatoEulerSystems.json`,
   `research/blueprint/suggested/KatoEulerSystems.lean`.
2. With that scope, independently finish the arithmetic-owner review and
   preserve their previous verdicts in history. In Kato's
   `L1/hecke-and-diamond-equivariance-of-the-moment-map`, replace r−1 by
   r′−1 in the statement and acceptance item 0. Lemma 8.8, p.185 visibly
   has the prime. Keep central-diamond exponent k−2−2r. Add the transport
   test: inverse Hecke exponent −(r′−1) plus inverse-first-diamond
   exponent r′−1−r equals −r. At k=4,r=1,r′=2,ell=2 the wrong coefficient
   is 1 and the right one is 1/2. `chernHeckeDiamond` currently takes a
   generic scalar; it does not check this arithmetic instantiation.
3. In GH.0's `GH.1/p-adic-abel-jacobi-map`, hypothesis 0 must make smooth
   proper models independent inputs and restrict p∤cNd_K to BDP's
   canonical conductor application. Read §2.2, p.1060, §3.2, p.1067 and
   Conrad's appendix, pp.1139–1140. The product-model supplier and Lean
   comment already distinguish them; retain the positive/bad-twist tests.
4. Run the owner packet checks and `lean-check` after authorized repairs,
   record genuine verdicts under this review-job marker, then check
   `issues.py:deliverables_complete`. Do not change markers merely to
   satisfy dispatch, and do not delete queue outputs.
5. Separate authorized supplier work must address the surviving Motives
   reconstruction obligations. A reader refresh also remains outside this
   issue: later period-torsor witnesses, period-point rank-one annotation,
   locator and reconstruction verdict require synchronization.

The mathematical source reads and hashes are in the report; none of this
resumption depends on disposable scratch or source passages.

## Verification receipts

- `python3 scripts/check_blueprint.py
  research/blueprint/packets/MotivesAndAlgebraicCycles.json --index
  <pinned declarations.tsv>`: exit 0, zero errors and warnings; 182 nodes,
  462 counted API items, 259 tests, 47 planets, 111 baseline declarations,
  23 gaps and 16 requests. Eight stages remain in scope; none is closed.
- `lean-check research/blueprint/suggested/MotivesAndAlgebraicCycles.lean`:
  exit 0, 816 warnings, all `declaration uses sorry`, no other diagnostics.
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`.
  Suggested-file SHA-256:
  `58c6c3094a4f3b524beb0a99c82c69b692c183403dfc19d6ce6429492c48fdeb`.
- Parsed preservation passes: one supplier changed; all other nodes and
  unrelated fields, original 23 gaps and requests retained; old history
  retained with the preceding review appended unchanged. The baseline
  adds only the two read localization declarations.
- `git diff --check` passes; edits stay within issue deliverables plus this
  always-required handoff. Submission-file validation passes.
- Dispatch predicate: false. GH.0 still names
  `independent-review-REV-GeneralizedHeegnerCycles--GH.0~2`, and Kato names
  `independent-review-REV-KatoEulerSystems~2`. Their accepted markers are
  attributed prior work, not this job's independent review.

No restricted source was needed, no source passage was written into the
repository, and no manual merge, promotion, label change or issue closure
was performed. Lean processes finished before submission. Scratch is
removed after opening the PR; no later worker needs it.
