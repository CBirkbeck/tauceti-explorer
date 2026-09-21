# REV-RS-28 — independent restructuring review

## Verdict and independence

**Accepted**, without substantive corrections. Reviewer: Codex, session
`codex-a71f92`, 2026-09-21, issue #855. The proposal was written by the
different worker `codex-c83e7a` on #856 and submitted in PR #897. This reviewer
did not write RS-28.

Reviewed `RS-28.result.json` (input blob
`1b737d66188fee8f1c741ab7e8b970824abf5f52`) and `RS-28.md`, against the family
definition and protocol section 15. The sole proposal edit is the required
top-level `review` object. No roadmap, layer, owner, or link decision changed;
`corrections` is empty. No anchor or atlas was edited.

## Reading and evidence

Read the entire HigherLocalFieldsAndHigherClassFieldTheory, ClassFieldTheory,
LocalFieldsRamification, and FunctionFieldArithmetic documents. Checked that
all eight member and fifteen anchor stage descriptions occur literally in
their respective documents. Read all eight reviewed AUDIT-03 library-coverage
records and the five family evidence leads.

Independently inspected the suppliers actually used: K2SymbolsBrauer
T.2:symbols, T.3:symbols, T.3:localization-comparison and T.4;
ProfiniteCohomology Layers 1, 10, 11 and 12; GlobalNumberFields Layer 6;
CrystallineCohomology CR.4; MotivicEtaleKTheory M.5/M.5d; and
KTheoryFiniteLocalFields L.3/L.5. Checked the relevant ClassFieldTheory link
packet entries, including its explicit assignment of equal-characteristic
p-primary existence to HL.3.

The mathematical inputs were read from the programme snapshot
`35e01e963a35d4ae713b71b9495df621cbb5fcf0`; the intervening changes through
`e741c6265c73436ce9aa517b55f8ada26ce743bc` were checked for relevance. The
reviewed proposal still had the input blob above. This is an ownership review
of the supplied specifications, not a new claim to have read the proofs in
Kato or the higher-local-fields volume.

Read `LaurentSeries.valued` and
`LaurentSeries.instLaurentSeriesComplete` in
[the pinned Mathlib source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LaurentSeries.lean),
lines 504 and 824. Independently fetched that pinned file on 2026-09-21 and
matched SHA-256
`dc23d8c6ba668df50051223d9099a8f0ce0e7a12385cfeb250bf2cc88f403ad9`.
These declarations give the single X-adic valued/completeness structure over
a field, not a higher topology, its continuity properties, or a residue-tower
API. The proposal makes the same distinction. No additional library
declaration is certified by this review.

## Duplication and conservation

All eight stable HL identifiers remain; seven are narrowed and HL.7 is kept.
The following checks account for each original construction and acceptance
obligation, not merely its layer title.

| Layer | Ownership and retained work |
| --- | --- |
| HL.0 | Imports the ordinary local-field substrate; retains residue towers, characteristic profiles, higher/sequential/pro-ind topology and comparisons, both Laurent examples, their residue steps and uniformizers. No unsupported local compactness or joint continuity is introduced. |
| HL.1 | Imports the all-degree algebraic Milnor presentation, residues, transfers and compatibilities from the named K2 substages. Retains the specified topological quotient, induced maps, tower assembly, projection/norm comparisons on that quotient and parameter-order/constant-unit tests. |
| HL.2 | Imports generic cohomology, dimension definitions and cups, ordinary de Rham–Witt, M.5d's comparison, and the ordinary invariant/duality in CFT's actual range. Retains higher invariants, degrees/twists, dimension computations, wild coefficient interfaces and duality, and both comparison tests. |
| HL.3 | Imports the existing finite/absolute Artin maps and available correspondence; retains higher reciprocity, norms, existence and exact kernel/completion statements, the missing equal-characteristic p-primary existence, and the two-dimensional Frobenius/norm-index test. |
| HL.4 | Imports algebraic tame symbols and ordinary ramification/K2 comparisons. Retains higher explicit reciprocity, characteristic-qualified Witt and mixed-characteristic formulas, higher filtration comparisons, differential residues, and tame/wild sign-and-trace tests. |
| HL.5 | Imports ordinary number- and function-field ideles. Retains Parshin flags, every branch of successive local construction, actual restricted-product conditions, functoriality, residue compatibility, higher idelic/cycle input, separately sourced singular extensions and the surface example. |
| HL.6 | Imports number-field and function-field reciprocity from their distinct owners. Retains arithmetic-scheme reciprocity, relations and fundamental-group comparison, tame/wild and proper/open variants, Kato complexes and boundary-square-zero, qualified Hasse principles and dimension-one comparison diagrams. |
| HL.7 | Keeps actual arithmetic consumer maps, norm/residue/corestriction comparison diagrams, complete field/surface examples, and explicit conditional statements for unproved extensions. Its audit label “process” does not justify deleting these mathematical targets. |

The 24 ownership rows distinguish construction from specialization and
comparison. In particular:

- CFT Layer 8 does not provide equal-characteristic p-primary existence or
  injectivity. HL.3 correctly extends the **existing** Artin map there; it does
  not replace it. The extension is therefore not restricted to dimension at
  least two.
- ProfiniteCohomology supplies its smooth-discrete coefficient and all-degree
  interfaces, not arbitrary discontinuous actions or higher arithmetic
  dimension computations. Ordinary CFT duality is imported only on common
  hypotheses.
- L.5's logarithmic/DVR K-theory comparison does not supply every wild
  higher-field coefficient or duality theorem. Its use, if needed in a proof,
  must be imported at its actual hypotheses. Keeping the remaining HL.2 work
  is appropriate.
- FA.4 keeps function-field global reciprocity. Its ordinary local setup
  imports CFT Layers 6–8 and the missing p-primary portion from HL.3. Neither
  FA.3's Witt extension descriptions nor number-field CFT are substitutes.
- Dimension-one scheme comparisons retain boundary/unramified conditions and
  archimedean treatment. Neither a raw Milnor group nor the full number-field
  idele class group is silently identified with an inappropriate profinite
  or scheme reciprocity target.

## Consumers, graph and format

The extension title exactly begins with the anchor's title followed by
“, Part II:”. Its reason explicitly makes Class field theory the first
roadmap prerequisite. No Tau Ceti layer appears among the changed layers.

The member has no existing external stage consumer in the checked roadmap
extracts or link packets. Every original internal dependency survives.
For each narrowed layer, checked both supplier-to-layer links and supplier
links to every existing direct consumer of its imported interface. Checked
every owner-to-former-owner handoff, including the four links into FA.4.
The direction is HL.3 → FA.4 → HL.6, never the reverse dependency.

Independent scratch checks found 8 member layers, 24 unique ownership rows,
59 unique links, 5 already-present links and 54 new links. Every new edge was
tested for a return path in the union graph: none lies on a cycle. The
conservative union included 4,196 existing endpoint pairs from raw atlas
stage edges, roadmap extracts (requirements and consumers), and link packets.
The extract/requirements/link-packet union alone has 4,146 pairs; raw atlas
adds 50 legacy foundation edges. These counts use an explicitly broader
reconstruction, rather than repeating the author's reported 4,178. No claim
is made that unrelated pre-existing cycles are absent.

The legacy raw-atlas LI.4 → HL.0 edge is absent from the current member extract
and is not a supplier in the proposal. Integration must follow the explicit
retirement decision, not restore that edge from stale raw data.

`python3 scripts/check_restructure.py research/blueprint/restructure/RS-28.result.json`
passes. The checker was matched to current-main blob
`6b55104bac20888bb964b58bdc00d38b4fca9668`. Additional checks passed for
complete layer inventory, ownership uniqueness, endpoint uniqueness,
supplier and consumer handoffs, anchor immutability, extension title and
literal description coverage. No Lean file is required or changed;
compilation is not applicable. No blueprint-v1 packet is claimed.

## Orchestrator handoff and remaining boundaries

Apply the title, first prerequisite, narrow contracts and endpoint-unioned
links together. When reconciling FA.4, express its local setup as imports plus
specialization comparisons, preserving every global target. The explicit
owner rows and four prerequisite links must not be applied as labels while
leaving duplicate local constructions in that document.

No unresolved defect blocks acceptance of this restructuring. Blueprint work
still needs exact primary-source statements and proof decomposition for the
topological Milnor quotient, each wild/duality regime, mixed-characteristic
explicit formulas, and higher-global/Hasse results. The local existence paper
alone is not a global source. Acceptance here neither closes those source
boundaries nor certifies any formalization.
