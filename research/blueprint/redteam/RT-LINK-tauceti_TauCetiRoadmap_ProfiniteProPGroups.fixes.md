# Profinite/pro-p link corrections

Completed for issue #5034 by Codex, session `codex-J6LwjP`, on 2026-09-30,
at base `aa27ea5`. All four findings are addressed according to the
[independent verifier's narrower instructions](RT-LINK-tauceti_TauCetiRoadmap_ProfiniteProPGroups.review.json).
The verifier confirms /3 and /4 as supplier-note corrections, downgrades
their severity to medium, and rejects /4's proposed new arrows. Accordingly
all **34 original links and their evidence remain unchanged**.

## /1 — normalized sections are already library theorems

Rewrote overlap 0's detail/proposal and appended the corresponding
ProfiniteCohomology screening correction. Retained its two stage IDs,
`rescope` recommendation and the instruction for PPG Layer 5's cocycle/extension
work to cite the normalized section through PC Layer 0. Removed the option
of moving and reproving the elementary finite-kernel theorem.

Read the statements and contexts at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` in
`TauCeti/Topology/Algebra/Group/Profinite/Section.lean`:

- `TauCeti.exists_continuous_section` (line 226): for a compact totally
  disconnected topological group and closed subgroup H, a continuous section
  of `G → G/H` normalized at the identity coset.
- `TauCeti.exists_continuous_section_of_le` (line 253): the normalized
  continuous section between the quotients for `K ≤ H`, with H closed.

A finite subgroup of a profinite Hausdorff group is closed. A finite-kernel
wrapper therefore only specializes the existing result. Reviewed AUDIT-22
already classifies this PPG Layer 5 target as `tauceti`, with the available
theorem more general. No new section-theorem request is created.

## /2 — import algebraic Weierstrass; retain the analytic work

Rewrote overlap 5's algebraic claim and appended the PMIA screening correction.
At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read
`Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean` and its section
variables for all four named imports:

- `PowerSeries.exists_isWeierstrassDivision` (line 504).
- `PowerSeries.IsWeierstrassDivision.unique` (line 594).
- `PowerSeries.exists_isWeierstrassFactorization` (line 813).
- `PowerSeries.IsWeierstrassFactorization.unique` (line 855).

Their coefficient ring is commutative/local and adically complete for its
maximal ideal, and the divisor has nonzero residue reduction. Read the
concrete `IsAdicComplete` instances for local-field integer rings and p-adic
integers; an abstract complete-DVR interface must still supply that instance.
Reviewed AUDIT-26 distinguishes the built algebraic theorem from absent
continuity of division. AUDIT-22 calls the specialized evaluation/division
criterion partial because identifying the constant remainder with evaluation
is still needed.

The remaining obligations are explicit: continuity, coefficient/coordinate
comparisons and the remainder-evaluation identity. The upstream specialized
ℤ_p coordinate, elementary linear-division proof, generator substitution,
dyadic group-ring branch and **(p,T)-adic**, rather than T-adic, topology
caveat are preserved. PMIA's broader algebraic theorem is imported, not
planned again. Its source README was not edited.

## /3 — Shapiro correction is a supplier note

Added request **PPG-R01** to the ProfiniteCohomology maintainer. Layer 10's
`shapiroCochainIso` cannot be a degreewise isomorphism between the two
canonical complexes. The request instead calls for a named chain comparison
proved a quasi-isomorphism, or a chain-homotopy equivalence, inducing
`shapiroIso` with its degree-0/1/2 compatibility. Coinduced acyclicity and
dimension shifting remain downstream. It cross-references the already
recorded `gaps[0]`, “Shapiro complex-level contract needs clarification,” in
the partial, unreviewed ProfiniteCohomology link packet.

The PPG links themselves require valid cohomology statements. Their PC10→PPG6
and PC10→PPG7 reasons and evidence are unchanged; no PPG-local replacement
theory is proposed. Read the supplier's exact Layer 10 paragraph and the
pinned Mathlib definitions `resolution'X` and `homogeneousCochains` in
`RepresentationTheory/Homological/ContCohomology/Basic.lean`, lines 94–131.
For `G=C₂`, `H=1`, `A=𝔽₂`, degree zero on the G side consists of equivariant
maps `C₂ → Map(C₂,𝔽₂)`, determined by one arbitrary coefficient vector.
There are four; the H side has two. Exhaustive enumeration reproduces **4
versus 2**, precluding a degreewise isomorphism while leaving Shapiro's
cohomology isomorphism intact.

## /4 — use the exact completion, without new links

Added request **PPG-R02** to correct ProfiniteCohomology §6's arbitrary-procyclic
alternative. The example must use the existing profinite completion of the
integer group, or a group equipped with an explicit isomorphism to it.
Read Mathlib's `ProfiniteGrp.profiniteCompletion` and
`ProfiniteGrp.ProfiniteCompletion.lift`, `lift_unique`, `homEquiv` in
`Topology/Algebra/Category/ProfiniteGrp/Completion.lean` at the same pin.
These supply the object and universal property directly.

For trivial coefficients in `𝔽₂`, `C₂` is procyclic but has nonzero H².
The normalized cocycle with sole nonzero value `c(1,1)=1` survives every
normalized coboundary. Exhaustive enumeration reproduces **two cocycles and
one coboundary**, hence two H² classes. This rules out the supplier's
arbitrary-procyclic replacement.

The verifier rejects PPG4→PC4/6/10/11, and also PPG0→those examples: the
examples consume the Mathlib completion, not PPG Layer 4's maximal-pro-p
quotient or Sylow comparisons. No such edges, new carrier owner or
ring-of-profinite-integers task is added. This is a maintainer request to
correct the supplier text, not a direct edit to an upstream roadmap.

## Validation and scope

- `check_links.py`: **0 errors, 0 warnings**; 34 links, seven overlaps,
  217 historical examined entries.
- Both new request quotations match the current supplier README literally
  after whitespace normalization.
- Structural comparison shows changes only to overlaps 0 and 5, the two
  corresponding examined notes, and the new `requests` array. Every link,
  endpoint, confidence, edge-evidence field, overlap stage/recommendation,
  other examined result and historical review record is unchanged.
- In-memory production assembly has 2,840 stages and 8,249 distinct edges;
  all 34 original links are present. Merging the original or revised packet
  produces the same edge set and passes the assembler's cycle check.
- The independent finite diagnostics give the Shapiro degree-zero counts
  4/2 and normalized C₂/𝔽₂ cocycle/coboundary counts 2/1.
- `intake.py check-files` passes for both deliverables; JSON parses;
  `git diff --cached --check` passes.

No Lean file was required or compiled, and no library build/cache/LSP was
started. Only the assigned research link packet and this report changed.
The section and Weierstrass proof reuse is explicit, while supplier-document
requests remain assigned to their maintainers. Revised packet acceptance
and promotion follow the normal intake workflow.
