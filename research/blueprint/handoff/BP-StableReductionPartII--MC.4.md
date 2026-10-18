# BP-StableReductionPartII--MC.4 — handoff

Agent: Codex, session `codex-YQ2Yhm`. Issue: #8904. This is a completed target-level
planning pass, not a checkpoint. Packet status is `complete`; the sole scoped stage,
`StableReductionPartII:MC.4`, is `planned`, not `closed`. All implementation statuses
remain `unchecked`.

## Delivered

Import all fifteen accepted parent MC.4 targets without changing the parent packet.
Add five distinct prerequisite nodes: two constructions, two theorems and one comparison.
The constructions have ten API items and eight unit tests; the comparison additionally
has four API items and four discriminating tests. Total: fourteen API items and twelve
tests. Add zero planets and retain the parent six planets by ID. Cite five pinned
baseline declarations. Record ten supplier requests, seven gap groups, two additional
source findings, and the inherited parent findings by ID.

The uniform integral ideal construction now explicitly uses the existing
R09.1/relative-serre and R09.1/family-regularity contracts. The actual ideal is flat
because both its ambient projective bundle and quotient stable family are flat.
A single high degree works over the whole Noetherian parameter scheme over Z and
survives every fibre pullback. Generation means ideal-sheaf generation. The fixed-line
projectivity route applies openness on the proper scheme cover, and then finite
ampleness descent, without comparing varying determinant degrees or assuming arbitrary
coarse base change. Initial finite scheme covers do not require irreducibility.

DM's tame/component proof and Serre's original rigidity appendix have been read.
For connectedness use the abelian Teichmuller group `(Z/N)^{2g}`, not the symplectic
frame deck group's order. Separate homogeneous multipliers and fixed symplectic level.
The exact existing R09.4 polarized-rigidity node supplies the abelian input; the missing
curve-to-Jacobian statement is only faithfulness, rather than all of strong Torelli.

## Assembly attachment map

The parent is immutable for this job. When assembling or refining its MC.4 targets:

- Attach `MC.4/integral-hilbert-kernel` to the proof of parent
  `MC.4/finite-degree-equations` and the projectivity proof.
- Attach `MC.4/fixed-degree-ample-descent` to parent `MC.4/projective-coarse`;
  retain the explicit finite-cover, power-descent and generic positivity requests.
- Attach `MC.4/jacobi-teichmueller-comparison` to parent `MC.4/full-level` and
  `MC.4/level-connectedness` with the dual/Tate-twist convention.
- Attach `MC.4/boundary-level-normalization` and `MC.4/complex-level-orbits` to
  parent `MC.4/level-connectedness`. This normalization is a stack; do not identify
  it with naive nodal full level or with the separately chosen projective scheme cover.
- Point parent `MC.4/level-rigidity` at
  `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-automorphism-rigidity`,
  keeping the JC1 faithfulness request. Do not duplicate Serre rigidity.
- Obtain the parent normal integral cover by choosing a dominating component and
  normalizing only after projectivity and irreducibility are available.

All suffixes in this attachment map have prefix `StableReductionPartII:`.

## Proof closure still required

The exact statements and source routes are in requests MC4-R1–R10:

1. **SF.1 finite covers and descent:** publish finite scheme covers with quasi-finite
   diagonal (EHKV 2.7), proper quasi-finite finiteness, finite ampleness descent and
   algebraic-space projectivity. Check the corrected wild line-power norm cocycle;
   Keel–Mori alone gives neither finite scheme covers nor this power descent.
2. **SF.5 extensions:** publish vector nefness and the determinant quotient/Grassmann
   ampleness lemma. Reuse AlgebraicVectorBundles L0; do not replan its tensor,
   symmetric-power or determinant calculus. Generic surface ownership is proposed
   as a foundations Part II extension and needs routing.
3. **Surface inputs:** decompose the general-type criterion, exceptional resolution
   and pushforward, characteristic-zero spreading and vanishing, Ekedahl positive-
   characteristic bounds, positive twists, and genus-zero/one arguments. In the
   pointed induction, contractions can make marked sections meet; exceptional
   coefficients are `m−Σa_i`, not always nonnegative. The false higher-direct-image
   vanishing in CLM Proposition 6.7 is recorded as E-MC4-1, extending parent E12's
   different Corollary 6.6 finding. Do not claim the pointed proof closed.
4. **SF.1 tame normalization:** local Kummer charts must give flatness, geometrically
   normal fibres and smooth-cover density; then proper normal-fibre component counts.
   Finite normalization alone is insufficient.
5. **SF.3/R09.4:** Kummer/cup/Weil duality with its inverse twist and effective
   polarized relative-Jacobian descent from the MC.1 Noetherian atlas.
6. **JC1:** acquire and export curve automorphism faithfulness in every characteristic.
   The existing abelian rigidity theorem already suffices for its part.
7. **Topology/complex suppliers:** proposed FuchsianOrbifolds Part II owns connected
   marked Teichmuller moduli and its analytic orbit comparison; proposed
   GeometricTopology Part II owns the mapping-class symplectic surjectivity, with
   integral symplectic reduction for composite levels. Neither is in the current
   upstream text. No upstream files were edited.

These requests were recorded in this packet, not sent as issues or communications.
No theorem ownership moved from a higher-tier packet; the proposals above must be
routed before calling any new supplier extension accepted.

## Source receipt

Read the full 2021 CLM author manuscript, including generic positivity pp.6–22;
DM §§4–5, especially component/Kummer proof pp.103–109; Serre's original appendix
pp.17-18–17-20; EHKV v3 Theorem 2.7 and proof pp.5,12–13; Ekedahl's introduction and
Part II Theorem 1.7/proof pp.126–127; Chen–Zhang v1 Theorem 1.3 and §4 pp.2,10–11;
and the Stacks numbered tags in the packet. Public PDF URLs, exact versions,
access dates and SHA-256 receipts are preserved there. No source passage is included.

Missing original sources: Weil Bourbaki 168, Manger 1939, Mumford 1967 vanishing,
BM77 Theorem 2, Lang80 Lemma 1, and a primary proof of the JC1 faithfulness theorem.
The parent-reported corrected NSF line-power descent copy was not read in this run:
its public endpoint returned 502 through the browser and timed out through curl,
which was stopped. No correction or publisher collation is asserted. E-MC4-2 records
the harmless self-reference in the DM 5.13 proof, corrected to Corollary 5.11.
No non-cleared book copy was used.

Read current upstream StableReduction and AlgebraicVectorBundles roadmaps in detail,
with the relevant JacobianChallenge, IntegralLattices, FuchsianOrbifolds,
GeometricTopology and PeripheralActions ownership checks. Read current library sources
and pins; the receipt records their commits. Never ran Lake in either current checkout.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.4.json`
  passed with zero errors and zero warnings, using the available pinned declaration index.
- `lean-check research/blueprint/suggested/StableReductionPartII--MC.4.lean`
  passed at Tau Ceti f790474 / Mathlib 082e2d3. The suggested file has no data
  definitions and only six admitted-proof warnings. Its abelian-ring and matrix
  signatures check available carriers, not any geometric implementation.
- Reader/packet IDs, exact API and test texts, supplier requests, retained planets,
  baseline module paths and the five new-node prerequisite graph were checked.
- Only the three authorized deliverables and this handoff are submitted.

The claim bot confirmed issue #8904 for `codex-YQ2Yhm`. No second job was claimed.
The earlier higher-priority #7943 could not accept a claim comment because it had
reached GitHub's 2,500-comment limit; neither GraphQL nor REST created a claim there.
