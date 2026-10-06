# BP-ShimuraVarieties--V8 handoff

Issue: #994. Agent: Codex (GPT-6). Session: codex-SyM6RC.

This is a complete target-level planning pass, not a checkpoint or an implementation.
The packet has status `complete`; V8 and V8.general are both `planned`, neither
`closed`. Every stated target is represented and prerequisite chains terminate
at pinned declarations, checked supplier nodes, precise requested stages or
explicit gaps. All implementation statuses remain unchecked.

## Deliverables and counts

- Packet: `research/blueprint/packets/ShimuraVarieties--V8.json`.
- Reader: `research/blueprint/readmes/ShimuraVarieties--V8.md`.
- Suggested file: `research/blueprint/suggested/ShimuraVarieties--V8.lean`.
- 23 nodes: 11 theorems, 2 constructions, 8 comparisons, 2 applications.
- 9 API items, 8 unit-test examples, 7 planets (six in V8, one in V8.general).
- 12 baseline declarations, 27 supplier requests, 4 gaps, 8 source findings.

## Ownership and dependency audit

RS-04's review was accepted by REV-RS-04; its ownership transfers are binding.
AA.5 supplies the underlying GL2 adelic quotient, rather than V8 re-planning it.
Checked node contracts include ShimuraData's pure datum/reflex/special/morphism
interfaces, AA.5 principal-level decomposition, C0's relative torus embedding,
and ComplexComparisonPartII's actual analytification/proper-morphism comparison.
The ShimuraData and AA packets are reviewed needs_changes; importing their
mathematical contracts does not certify their suggested implementations.

The unrelated contents of misleadingly named ModularCurvesPartII packets do not
supply R12 uniformization or R13.4 compact comparisons. Requests name the actual
supplier stages. R12.4 open connectedness remains independent of compactification.
R13.4a supplies full/composite levels; PR81 Layer 10 is prime N >= 5 only.
Underlying full, Gamma1 and Gamma0 moduli are imported from PR81 with their
fine/coarse ranges. The actual stage descriptions and their direct dependencies
were read, including R12.1–6, R13.4a/b, M3–5 and R09.2/3/5.

A traversal through all reachable declared packet nodes found no cycle.
The arithmetic codimension-one compactification input has no current usable
pre-V8 owner: taking all of C2 would create a V8–C2 cycle. The packet's rescope
proposal isolates this smaller pre-V8 interface and leaves full toroidal descent
in C2. B1, which consumes V8, is not imported for the Baily–Borel ample line.
The abelian lane has no path to V7 or the general suffix.

## Exact follow-up work

1. Supply the arithmetic codimension-one extension S+ and actual torus torsors/
   central quotients in Pink 12.8–12.10, with a separate pre-V8 contract.
   C0/relative-torus-embedding assumes an arithmetic torsor; it does not create it.
2. Verify preservation of the V5/V6 existence class for Pink's auxiliary quotient
   and Gm-kernel fibre-product pure data, or explicitly strengthen the actual
   auxiliary-model hypotheses. Construct the intrinsic logarithmic line and
   section base change on S+, and match its high-power projective map with V2.
3. Bind every schematic suggested theorem form to actual datum, adelic level,
   canonical-model, analytification and modular carriers. Restore the omitted
   hypotheses; the present forms are not true universal statements about raw
   schemes. Strengthen the proper/open minimal form to the full normal projective
   model with the specified complex Baily–Borel comparison. The field form must
   index genuine special reflex fields, and the full-level reciprocity equation
   must use the actual CM point action. No proposition placeholders or assumptions
   equal to the desired conclusions have been introduced.
4. Verify AA.5's principal-level component statement with representatives in
   GL2(Zhat), or supply explicit conjugating comparisons. Arbitrary representatives
   do not literally have stabilizer Gamma(N).
5. Discharge the 27 exact requests in the packet: R09.2/3/5; IG.2's real-open
   disjoint Hilbert specialization; R12.1–6 and R13.4a/b; PEL M3–5; C1's complex
   codimension-one geometry; V1–7's actual inputs; and the named PR81/ReductiveGroups
   imports. Then prove the declarations and their tests. Neither general existence
   nor special-pair density is substituted for the disjoint-field argument.

## Checks

`python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties--V8.json`
reports **0 errors, 0 warnings**, using the pinned declaration index.
The source-issue schema and source-version checks report no errors.
Packet/reader/suggested names agree; each of the two constructions has all its
API signatures and four test examples. All 23 named declarations appear.
Excerpts were checked as literal prose against the public extracted copies;
Deligne's unreliable mathematical extraction was checked against page images.

`lean-check research/blueprint/suggested/ShimuraVarieties--V8.lean` completed
successfully at Mathlib 082e2d37e8, with **40 warnings, all declaration uses sorry**,
and no errors. Only native Mathlib modules are imported; Tau Ceti f790474 was
searched/read for the baseline audit. Available memory exceeded 20 GB before
checking. No language server, Lake build/update/cache operation or new project
was started. Compilation checks type forms only; it is no implementation claim.

## Sources and bounded searches

The packet records source URLs, read date 2026-10-06, downloaded-copy hashes,
sections and version kinds for Milne's 2017 SVI author copy, MF v1.31,
Pink's author-typeset dissertation and Deligne's published Bourbaki exposé 389
from Numdam. Pink's printed page numbers are those of the typeset copy, which
are different from the original scan. Deligne pp.153–155 were read in rendered
page images; 5.2–5.4 pp.155–156 were checked for the graph-descent argument.
Milne MF 8.3(b) confirms that a solution may be coarse; no false accusation of
fine representability is made against 8.6/8.8. The explicit fine claim in 8.9
and the arbitrary-root normalization in 8.7 are recorded for independent review.

Official Milne errata and the linked Jungyun Lee list were read. Known
corrections to the reflex norm and level-map direction are recorded. Additional
findings cover the reversed arrows in SVI 6.3 and Deligne's finite/nonempty
Hilbert hypotheses and typographical slips. Each includes a correction search;
none is labelled independently confirmed by this worker.

Read upstream ReductiveGroups and HodgeStructures documents in full, plus the
relevant ModularCurves/EllipticCurves passages. The two maintainer-added papers
are V4/V3 supplier inputs outside this part's scope: the CM integral-lattice and
BKT definability arguments are not re-extracted here. Milne 1983's general
conjugation proof is V7 work, not an alternate V8 proof. No necessary in-scope
source was inaccessible. The Zulip roadmap stream link failed to load; the
UPSTREAM_GUIDE transcript was used. Bounded Mathlib PR searches returned nearby
coset/Hecke and Tate-normal-form work but no canonical-model construction;
these leads were not treated as pinned implementations.

Public PDFs, extracted source text, compilation logs and the worklist were kept
only in scratch. Scratch is removed after submission; everything required to
resume is in these four deliverables and the stable source links.
