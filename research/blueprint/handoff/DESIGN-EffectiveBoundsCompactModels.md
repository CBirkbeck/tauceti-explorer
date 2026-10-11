# DESIGN-EffectiveBoundsCompactModels — complete design pass

Issue #1696. Agent: Codex, session `codex-hkuDPh`. The bot confirmed the claim
on 11 October 2026. This run takes one job and submits these five deliverables.
The new roadmap extends `tauceti:Completed/EffectiveBounds`, its first
prerequisite. The current target-level policy in `detail.json` and WORKERS.md
controls granularity over the older declaration-level issue wording.

## Delivered

All six layers are planned, with 27 nodes: 4 definitions, 5 constructions and
18 theorems. They carry 27 API items, 27 definition/construction unit tests,
27 planets (at most six per layer), and 15 cited baseline declarations. The
suggested file has those 27 tests plus an additional non-integral-basis
short-family example. The reader is approximately 6,350 words.

The arithmetic chain preserves the complex-place measure factor; the short
family's independence without integral-basis status; the saturated relation
kernel; the positive finite transpose-image index; the discriminant Gram
identity; exactly ℓ+1−n retained relations; and the same Jacobian determinant
at every embedding. The field map is a surjection from component models onto
unweighted isomorphism classes. The finite coefficient expression keeps its
natural floor and includes the component multiplier.

The plan gives explicit sufficient constants: threshold Q=65536, least
central parameter r=d, intermediate height exponent 40 log n, and the same Q
in both final theorems. These are unoptimized elementary refinements of the
published proof, rather than constants asserted to appear in the paper.

## Coverage and supplier request

The packet is `complete`, all six coverage entries are `planned`, no entry
is labeled `closed`, and there are no unrecorded gaps. The single open request
is `SchemeAndStackFoundations:SF.5`, consumed by
`EffectiveBoundsCompactModels:CM.5/isolated-components`:

Over an algebraically closed characteristic-zero field, r positive-degree
homogeneous forms in projective r-space have sum of isolated local intersection
lengths at most the product of their degrees, even with positive-dimensional
other components. The affine simple-point consequence gives at most d^r
Jacobian-open geometric points. The existing isolated-plane-Bézout node has
only r=2 and was not substituted for this arbitrary-dimensional statement.
The consumer treats zero equations and nonzero constants separately.

The request belongs to the supplier's general intersection/refined-Gysin
scope; this design does not introduce a second generic Bézout theory. CM.5's
remaining list names this precise request. The design pass itself needs no
continuation. Its independent reviewer should check the explicit estimates,
the supplier contracts, and the SF.5 request; the supplier must resolve the
request before this dependency can be considered closed.

SF.0's exact `jacobian-etale-algebra` node is used as a planned mathematical
input. Its part packet has a needs-changes review, so no accepted implementation
or discharged dependency is claimed. GN.0/GN.1 and GI.0/GI.1/GI.5 provide their
existing generic nodes. ST.0 already supplies the bridge from fixed-ambient
Hermite finiteness to isomorphism-class Northcott finiteness. ST.3 is not used.
No existing upstream roadmap is replanned, and no ownership moves or
restructuring proposals are needed.

## Source and baseline audit

Read Couveignes, *Enumerating number fields*, the published Annals 192 (2020)
version, pp. 487–497 in full, including references. Its publisher PDF is public;
URL, access date and SHA-256 are in the packet. All mathematical prose is in
our own words. Source locators distinguish Proposition 1, Proposition 2,
Theorems 1–2 and the intermediate arguments. No source issue was established.
In particular the text extractor's rendering of weak inequality symbols was
checked against the printed PDF before making any claim about an error.

Read the completed EffectiveBounds and current GlobalNumberFields documents
as upstream examples, together with relevant IntegralLattices interfaces and
the current Tau Ceti sources for overlap. Checked the reviewed library audit
and exact supplier-node statements. Searches found no compact-model or
Couveignes implementation in the pinned arithmetic sources. No private book
was required or copied. The generic SF.5 theorem is an explicit supplier
request; its proof is not claimed as independently verified here.

Every cited baseline statement was read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The shared build's HermiteCount source
was also byte-compared with that Tau Ceti revision. The newer current upstream
source was used only for overlap, not to establish pinned availability.
The default declaration index was unavailable, so the baseline checks used
those direct source reads; the packet checker did not provide an index-based
name audit.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveBoundsCompactModels.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/EffectiveBoundsCompactModels.lean`:
  exit 0 at the pinned shared build; only `declaration uses sorry` warnings.
  The final file was checked after the non-basis test and field-factor API
  were added. Native quotient/localization, dual, bounded polynomial,
  Euclidean subspace and Setoid-quotient types are used; there are no opaque
  proposition placeholders.
- Reconciled every packet node, API name and unit-test name with the suggested
  file, and every node statement with the reader. All names/statements were
  present. There are 28 explicit Lean examples.
- `git diff --check`: clean. Only the four named deliverables and this handoff
  are included in the submission.

Everything remains `implementationStatus: unchecked`. Successful elaboration
checks the forms of the proposed statements; it does not implement their
proofs. No second issue is claimed after this pull request.
