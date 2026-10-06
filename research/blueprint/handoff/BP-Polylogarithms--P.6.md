# BP-Polylogarithms--P.6 handoff

Job #6391; Codex — codex-Omyv0N. Complete planning pass for the sole stage
Polylogarithms:P.6. All three deliverables accompany this note. No second job
was claimed. The accepted base packet is unchanged.

## What is complete

The base coverage's sole local remaining target, the weight-three differential
of L_3 as an API item of P.1, has a theorem node
`Polylogarithms:P.6/single-valued-trilogarithm-differential`. It states real
differentiability and the exact real-linear derivative for z other than 0,1,
including points of the principal cut. The source convention Lhat_2=iD is
converted explicitly; the angular term is -D, and beta_2=1/3.

The application `Polylogarithms:P.6/trilogarithm-differential-regression-tests`
adds five exact examples, at 1/2, 2, -1, a general unit-circle point, and i. Each
includes differentiability so Mathlib's totalised fderiv cannot pass a false
claim. The suggested file states the theorem and all five examples. Its three
function prototypes are supplier objects from the base P.1 plan, not new nodes.
The base regulator, equivalence, exact five-term, numerical-error, real-place and
boundary-certificate plans are reused by id in `targetCoverage`.

Counts: two nodes (one theorem, one application), no new definition/construction
or definition API item, five exact acceptance examples, one new planet, four
pinned baseline declarations, zero new local gaps, three supplier requests.
The checker counts only definition/construction tests and consequently reports
zero `unitTests`; the application has five tests and five Lean examples.
Implementation status is unchecked throughout. Packet status is complete;
stage coverage is planned, not closed.

## Confirmed red-team finding and ownership

RT-AREA-ktheory-2/26 is handled by requesting and assigning the shared completed
unit map, strong-Leopoldt proposition and defect to IntegralIwasawaTheory I.2.
The packet's rescope proposal records I.2 -> L4, I.2 -> AutomorphicPadicLFunctions
L0 and I.2 -> P.6. This interface requires no Zagier or polylogarithm dependency.
P.6 retains its regulator and equivalence. Ordinary units need an explicit
pro-p/principal-unit passage, and p-primary torsion cannot be discarded when
comparing completed-map injectivity with a free-rank calculation. Weak
cyclotomic Leopoldt and the abelian strong theorem remain distinct.

The base already requests I.2, but its `leopoldt-statement` still has a stale use
saying ownership is in P.6. This follow-up supersedes that ownership rather than
editing another job's file. The shared statement's planet belongs at I.2.

## Precisely what remains and where to resume

Assembly, together with supplier work, has three bounded tasks:

1. Bind the inherited regulator-equivalence adapter to I.2 declaration-level
   nodes for the completed map, strong proposition and defect, and D.1's
   normalised logarithm/rank comparison. D.1 must expose the kernel on algebraic
   local units and compatibility with finite embeddings, treating finite torsion
   explicitly. L4 supplies only the abelian special-case theorem.
2. Recast the old P.6/leopoldt-statement node as an imported I.2 adapter; remove
   its stale ownership sentence and P.6 planet. Add the early I.2 -> P.6 edge
   without a reverse dependency. Keep P.6/padic-regulator and equivalence.
3. Add the new differential node as prerequisite of the old P.6/tests node and
   replace its finite-difference-only clause. Remove only the weight-three
   differential clause from the old source gap. The general-weight differential,
   higher-Bloch descent, Zagier normalisation and P.5 current/source obligations
   stay with their original owners; this follow-up does not certify those gaps.

No new V.6 request is needed: its Bloch-element constructor and five-term
certificate nodes exist and were read. No additional mathematical target is
left local to this follow-up. The three requests are I.2, D.1 and L4, with exact
needs in the packet. Do not reopen the pointwise differential as a source gap.

## Sources and verification

Read Goncharov, *Explicit regulator maps on polylogarithmic motivic complexes*,
[arXiv math/0003086v1](https://arxiv.org/pdf/math/0003086v1), accessed 2026-10-06:
§2 items 1,4,6 and §4 Proposition 4.1 with its complete proof, equations (28)–(38),
printed pages 17–20. PDF SHA-256:
47a616bada4abeaee1672679593e5b69e6d293b2cf98e08de6b726072f9a69ea.
The differential proof and exact test derivations are in the packet and reader.
Finding Polylogarithms/E22 records the misprinted logarithm exponent n-k on
printed page 3, checked against the page image, and its correction to k in
(33). The published full text was not obtained; the finding is scoped solely to
this preprint. No external corrigendum was established by the recorded search.

The NSW electronic URL redirected to a landing page, so that text was not read
in this run. Its regulator and equivalence locators are reused from the accepted
base packet, with no fresh verification claimed. Their owner requests remain
visible. Reviewed audit entries P.1/P.6, the roadmap and its relevant stage links,
and the binding protocols were read. The upstream ConformalMapping and
ArithmeticDirichletSeries README documents were read in full.

Pinned Mathlib statements were read at 082e2d37e8b0463410cdb532e111cd43d5a66174;
the Tau Ceti source search used f790474821cf4256814db967cb154e7af3d0c369.
The classical-polylogarithm design in open
[Mathlib PR #44531](https://github.com/leanprover-community/mathlib4/pull/44531)
was read at head 7d07d5f2ab28d30d107139029aff9ffe2e4aa0c7: Complex.polylog,
the recurrence, analyticity and lower-side cut convention. It is not a baseline
citation and does not prove this differential. P.1 should follow its design
and adopt it upon integration; integer weights become complex-weight inputs.
No code from that PR was integrated. Public Zulip/archive searches located no
additional design discussion.

Checks passed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/Polylogarithms--P.6.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/Polylogarithms--P.6.lean`: exit 0,
  only the intended seven declaration warnings for proof placeholders. The
  shared build uses the exact pinned Mathlib; this file imports only Mathlib,
  so the shared build's newer Tau Ceti checkout supplies no imported declaration.
  Available memory was 112 GB before compiling. No server or build was started.

The scratch directory is disposable; all resume information is in this note and
the deliverables. No source PDF, extracted text or local path is needed by the
next worker.
