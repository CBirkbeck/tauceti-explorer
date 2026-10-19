# Handoff: REV-AutomorphicCongruences--L0

Issue #357; Codex session `codex-K1c0KG`; independent review completed
2026-10-19. The planning author was Claude session `claude-zBc10c`.
This is a finished review, not a checkpoint. No second job was claimed.

## Result and durable evidence

The review accepts the corrected packet as a complete target-level pass:
69 nodes, 59 corrected and 10 verified, none added or unverifiable. All eight
stages are planned under PROTOCOL §0; none is closed. Twenty precise supplier
requests and sixteen named gaps remain. Every implementation status remains
unchecked. The 17 definitions/constructions have 125 API entries and 68
mathematical tests; each has at least three tests. There are 25 planets,
with at most six per stage.

The durable review and node-by-node receipts are in
`research/blueprint/reviews/REV-AutomorphicCongruences--L0.md` and the packet's
`review.checked`. All thirteen pinned baseline declarations were read and
confirmed; four descriptions were narrowed. Current upstream roadmaps were
checked separately from the atlas snapshot, at checkout
`0d144d044dacebca17b654695b6f1ad58f159b27`. Existing generic IHG, SR and
ProfiniteCohomology results remain imports; the source-specific polarized
1+n+1 lattice theorem is owned by AC L0. PMIA was absent from that upstream
checkout and is no longer described as already upstream.

The packet records public source versions, hashes and precise review reading
limits. Its `readSections` preserves the planner's history; `reviewRead`
records this review. No source files, passages or restricted books were
copied into the repository. Source findings E8–E10 were independently
confirmed; E11–E14 record the CLW proof inequality, BCS Shapiro field,
Nakamura residual cohomology index and the CLW author addendum.

## Mathematical corrections to preserve

- The CLW addendum replaces a cofinite auxiliary ℓ-tower nonvanishing claim
  with infinitely-many nonvanishing and two auxiliary data sets. Its two
  weight-two Klingen families jointly avoid height-one primes after inverting
  p; there is no single-family simultaneous-unit theorem. Hsieh's separate
  p-tower µ=0 theorem is retained. FW's general-weight/vector-valued extension
  needs an explicit repair, recorded in `general-weight-nonvanishing-repair`.
- Selmer conditions at p persist when p belongs to Σ; T_p=0 is unramified,
  not strict. SU uses inverse Frobenius on rational inertia invariants.
  Residual Steinberg ramification does not make every removed Euler element
  a unit. General normal coefficient rings require divisorial ideals, rather
  than the supplier's UFD-only native characteristic ideal.
- Keep SU's full lattice/descent hypotheses, χ+χ′ with χ′=νχ^{-c}, its exact
  period factors, and the full-Hecke versus cuspidal-modulo-E distinction.
  The CM input is narrowed to CLW's exact theta integrality contract; an
  unread general CM main conjecture is no longer asserted.
- Preserve the four full semi-ordinary weight coordinates, the identity
  component/full finite-character algebra distinction, the sufficiently large
  classicality bound and the correct unitary Satake slopes. CW's Coleman
  maps are at p̄/F^- and p/F^+, with fractional congruence-ideal targets.
  FW's Steinberg multiplier is −ℓ^{k/2−1}. Universal non-torsion does not imply
  nonzero specialization at a prescribed point.
- Keep FW T1.7 and T5.1 distinct. Its pointwise scalar condition is automatic
  by the determinant parity argument on p. 69; the alleged missing scalar
  hypothesis is resolved. Keep the dual determinant image αΛ and primal
  image α⁻¹Λ, completed-group-algebra tensors, determinant norms, non-p local
  factors and partial/full lines. Nakamura arXiv v2 uses (77) on p. 78 for
  change of Σ; (78)–(79) on p. 80 are the H¹/H² comparison formulas. Version
  notation and published errata must not be mixed.
- BCS Shapiro groups are over K. Its quartic L-function comparison is an
  equality of ideals after inverting p, retaining period normalization. The
  BDP function is already squared, and irr_K implies van_K in Thm 4.1.3.
  Auxiliary splitting predicates include 2 when 2 divides N; an odd
  fundamental discriminant splits at 2 precisely in residue class 1 mod 8,
  and is inert in class 5.

## Programme actions after this review

There is no unfinished review work. These actions belong to packaging,
consumer or supplier jobs; this review edits none of their files.

1. Synchronize `research/blueprint/readmes/AutomorphicCongruences--L0.md`
   from the corrected packet before packaging. Issue #357 authorizes the
   packet, suggested file and review, but not the reader. Its source list,
   ownership and conventions, L0 Selmer/Euler/lattice/period/CM passages,
   L1 dual forms and eigensystems, L2s two-family theory, L2 interpolation/BF/
   exponential boundaries, L3–L4 determinant/residual contracts, L5a product
   and source-finding ledger all need reconciliation. The per-node review
   ledger is the change list; the suggested comment register is synchronized
   with the packet. Do not present the older reader as the accepted contracts.
2. Route the corrected auxiliary ℓ-tower contract to
   AutomorphicPadicLFunctions L3h. Supply the general-weight two-family repair
   in AC L2 before claiming the FW proof chain is closed. Preserve CLW's
   scalar weight-two ownership in L2s.
3. Resolve the exact integral CM-theta and EPW/SU period maps, the
   imaginary-quadratic AG2 adapter, Pottharst/Bianchi comparison, local
   unramified regulator Part II, integral Kato τ-quotient witness and the
   unconditional GL₂/type/p=3 local–global contracts. The packet's `gaps`,
   `requests` and consuming IDs specify each input; an approximately matching
   supplier theorem does not discharge it.
4. Point the other AC part's polarized SU/Wan lattice request to AC L0;
   import generic IHG algebra without assigning its rank-two Ribet result
   the 1+n+1 theorem. Keep ordinary BSTW's proposed Kato L5 owner explicit:
   Kato L4 is not that two-variable comparison. Preserve
   L5w → L5a → {L5b, HE.8b}; L5 is an aggregate, not the direct cyclotomic
   consumer input.
5. Correct the MIMC consumer's alleged scalar-gap entry using FW p. 69.
   Keep SU in L1, FW's ordinary reverse proof (including its Kato input) in
   L2, the universal zeta instance in L3 and point/family descent in L4.

## Validation and resumption

- Packet checker: exit 0, zero errors and zero warnings, 69 nodes.
- Suggested Lean: `lean-check` at pinned Mathlib `082e2d37e8` succeeded,
  with exactly 16 declaration-uses-sorry warnings and no other diagnostics.
  The file has 2,448 lines. Every data definition has a real body; the
  unavailable arithmetic carriers are mathematical targets in its comment
  register. The new splitting-at-2 example is proved by calculation.
- `scripts/check_sorry_data.py`, deliverable-path validation, node/review
  coverage, unchecked statuses, API/test counts and prerequisite-DAG checks
  passed. `git diff --check` is clean.
- Memory was checked before serial Lean runs, with over 20 GiB available.
  No language server or Lake build/update/cache command was started.

Scratch is deleted after submission. Re-fetch a source only from the packet's
public version URL and verify its recorded hash. Everything needed for
follow-through is in the packet, review and this handoff; no scratch file
is required.
