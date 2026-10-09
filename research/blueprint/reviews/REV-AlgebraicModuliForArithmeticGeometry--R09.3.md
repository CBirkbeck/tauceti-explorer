# Independent review of R09.3

Accepted on 2026-10-09 by Codex, session `codex-fhRP75`, for job
`REV-AlgebraicModuliForArithmeticGeometry--R09.3` (#6292). This session did not
write the blueprint being reviewed.

This accepts a complete **target-planning pass**, with R09.3 **planned**, not
closed. Its four supplier/interface gaps remain explicit. The mathematical
statements and conditional proof routes are sound; this decision establishes
neither implementations nor completeness of the three omitted concrete Lean
signatures. The packet's `review.checked` records the verdict and evidence for
each of its 13 nodes: five corrected and eight verified, with no nodes added or
removed. The 38 R09.3 predecessor nodes retain their existing identities and
implementation obligations.

## Counts and corrections

The final packet has 13 nodes (two definitions, seven theorems, four
comparisons), 19 baseline declarations, 20 definition API entries, seven unit
tests, six planets, six supplier requests and four gaps. No stage is closed.

- Added `relativeHomHomEquiv_points` and `weilRestrictionHomEquiv_points` to
  the packet and suggested file. Each pins the universal-property equivalence
  to the actual morphism stored by a point, through the canonical map from
  the chosen representing scheme to the presheaf pullback. A bijection with
  the right domain and codomain alone could permute sections; it would not
  justify the evaluation-based comparison proofs.
- Corrected the baseline kinds of `relativelyRepresentable.fst` and `.snd`
  from definition to abbreviation, and `.isPullback` from definition to lemma.
  Their names, modules, statements and usefulness were correct. No baseline
  citation was removed or replaced.
- Expanded the section-space proof to check every hypothesis of 05XD:
  the finite open part of the étale total space is flat and locally finitely
  presented over the test, and finite hence universally closed; its finite
  target is closed, separated and locally of finite type. The nonseparated
  case still imposes separation only on the chosen atlas maps.
- Made the relative-Hom atlas size argument explicit: affine chart indices,
  their finite subsets and the coordinate algebras remain in the fixed
  universe (05Y7, footnote 3, p.16). This does not discharge SF.1's own size
  obligations.
- Carried predecessor source issue `AlgebraicModuliForArithmeticGeometry/E4`
  into the coherent-descent proof: step 4 of 04W8 uses the fpqc pullback cover
  and the actual fibre product with the test scheme. It does not turn a
  general fpqc cover into an fppf cover. The existing finding was independently
  reconfirmed, rather than duplicated with a new identifier.
- Added the source association and independent confirmation to each of the
  three R09.3 source issues, and recorded the eight source PDF versions and
  hashes. Replaced the completed independent-review task in `remaining` with
  the actual implementation and proof obligations; updated the API count.

## Mathematical and source checks

The eight public chapter PDFs were fetched independently; all SHA256 hashes
agree with the packet. Locators below are **chapter-local printed numbers**,
not the global numbering on the Stacks HTML pages. No source passages were
copied into the repository.

The finite-source section theorem retains arbitrary étale algebraic-space
targets, including nonseparated ones. Its separated-case finite-part/open-locus
route uses Criteria Lemmas 9.1–9.2 (05XQ/05XR), pp.12–14, More on Groupoids in
Spaces Proposition 12.11 (04QH), p.19, and More on Morphisms of Spaces Lemma
49.6 (05XD), p.122. The exact latter interfaces are requested from SF.1 rather
than asserted present there.

Relative-Hom algebraicity matches Criteria Proposition 10.4 (05Y7), pp.15–16.
More on Morphisms Lemmas 68.1–68.2 (05Y6/0BL3), pp.208–209, permit arbitrary
generator and relation sets for affine targets. RG2.0a's representing-algebra
node supplies that domain; ModularCurves 0F supplies its affine finitely
presented domain. Neither construction is repeated here. The open pieces from
finite subsets of an affine atlas cover on affine scheme tests, and the
section theorem makes the induced atlas map étale and surjective.

Weil restriction keeps the equality over **Z**, not merely over B. Its
sheaf, base-change, cartesian and algebraicity targets match Criteria Lemmas
11.1–11.4 and Proposition 11.5 (05YB–05YF), pp.17–18. The fibre over the
identity of Z has exactly the section condition. These statements require no
affineness, finite presentation, separation or quasi-compactness of X for
finite locally free restriction; rank-zero source components are allowed.

The finite quotient comparison uses the supplied fppf projection and its
actual kernel pair, hence the quotient-sheaf universal property (Groupoid
Schemes Definition 20.1 and Lemma 20.3, 02VG/03C5, pp.39–40). The étale
specialization agrees with Algebraic Spaces Lemma 9.1 (0262), p.12. No claim
identifies a general invariant-ring quotient with the fppf orbit sheaf of an
action with stabilizers.

The coherent presentation theorem imports full quasi-coherent descent,
including zero and noninvertible module maps. Finite presentation descends
(Descent and Algebraic Spaces §6, pp.5–6), and on locally Noetherian spaces
it identifies coherent modules (Cohomology of Algebraic Spaces Lemmas
12.2–12.3, 07UB/07UC, p.19). Exactness is for the equivalence, while its
base-change compatibility is a natural comparison and does not assert that
arbitrary pullback is exact.

For polarized pairs the object cocycle and its line-bundle lift are actual
separate data. Lemma 23.1 (0ADT), pp.35–36, first produces a sheaf; SF.1
supplies algebraicity. Lemma 13.1 (0D3C), pp.21–22, supplies descent of relative
ampleness and scheme recovery. The requested general fppf effectivity theorem
is broader than MC0E's curve case and StableReduction Layer 2's étale case.
All comparisons, including finite structured tuples, are characterized by
their prescribed local identity; full faithfulness then preserves operations,
immersions, actions, sections and equations, with coherent base change.

The three source findings are confirmed in Criteria pp.12–14: the reversed
composition in 05XQ, the atlas separatedness sentence naming the wrong source
in 05XR, and the stray base letter in its separated-case conclusion. Live
05XQ/05XR text and comments were checked; no correction to these slips was
located in that bounded check. These are proof misprints, with the intended
theorems retained. The predecessor's 04W8 finding also remains visible in the
current PDF and tag text.

## Baseline and ownership

All 19 baseline statements were read in their named files at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. They provide the advertised
interfaces with the stated conventions:

| Entries | Confirmed content |
| --- | --- |
| `Functor.relativelyRepresentable`, `.pullback`, `.fst`, `.snd`, `.isPullback`, `.lift` | A chosen scheme representing each test pullback, both projections, the genuine pullback cone, and its lift when the functor is full. |
| `yonedaEquiv` | Morphisms from a representable identify with native presheaf sections, without enlarging the point universe. |
| `Presheaf.IsSheaf`, `Scheme.fppfTopology`, `Scheme.etaleTopology` | Native sheaf conditions and the required generated covering topologies. |
| `IsFinite`, `Flat`, `LocallyOfFinitePresentation` | The three properties used to express finite local freeness, with no positive-rank requirement. |
| `Adjunction.rightAdjointUniq`, `unit_rightAdjointUniq_hom_app`, `rightAdjointUniq_hom_app_counit` | Canonical comparison of right adjoints of the same left functor, with its unit and counit equations; these alone do not transport a descent comonad. |
| `comonadicExtendScalars` | Native module comonadicity for a faithfully flat ring map; not general sheaf descent. |
| `MorphismProperty.presheaf`, `Presheaf.IsLocallySurjective` | A scheme-representable property on every represented pullback, and local lifting on covering sieves. |

Read supplier nodes in SF.1, RG2.0a and the accepted A0-extension, the reviewed
library audit, and the current upstream README/contracts and relevant
Suggested signatures for ModularCurves, StableReduction and
AlgebraicVectorBundles. The read-only upstream checkout was at
`de435a569d325b365a30fe83269ce34674eaea80`; the current TauCeti library was at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing module pullback,
finite-presentation preservation, tensor comparisons, wrappers and invariant
affine quotients were inspected. The recorded inherited-adapter gap correctly
requires consuming these, without planning them anew.

Confirmed red-team findings `/1`, `/10`, `/11`, `/12` are respected by both
packet and reader: SF.1 owns general spaces/stack descent, MC owns effective
scheme quotients and finite descent, RG owns the affine extension, and R09.3
owns the space extension and comparisons. Grassmannians and relative
Proj/ampleness remain with MC0G and SR Layer 2. R09.1 and downstream GAGA are
outside this review's changes. Supplier tiers and the node graph introduce no
new dependency cycle.

Both definitions have at least three meaningful tests: identity, empty source
and split rank two, with the terminal-target restriction test also retained.
The split tests catch confusing products with coproducts or dropping one
component; restriction's terminal and identity tests distinguish sections
from all B-relative maps. The six planets mark central definitions and named
geometric results; supporting comparison lemmas are not separate planets.

## Validation and orchestrator follow-up

`python3 scripts/check_blueprint.py` on the reviewed packet: **0 errors,
0 warnings**. The packet source-issue validator and source-version validator
also pass. The final `lean-check` invocation exited **0**, with only
`declaration uses sorry` warnings. The two added evaluation signatures and all
seven suggested tests were included. This checks elaboration, not proofs.

No further correction is required to accept this pass. Implementation and
packaging must resolve the finite-part/open-locus SF.1 request, the general
polarized-object request, the inherited module adapter obligations and the
three concrete supplier signature omissions. When assembling the reader,
include the two added evaluation API names beside its existing natural
universal properties; this issue does not authorize editing that document.
Reconcile inherited module targets with current AlgebraicVectorBundles and
TauCeti before exporting them. No source finding or ownership issue requires
replanning an existing upstream roadmap.
