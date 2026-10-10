# PL.6 continuation handoff

Issue #7839; Codex session codex-98h9KP. This is a complete target-level planning
pass, not a closed layer. Only PL.6 is in scope. The accepted parent packet and
its fifteen PL.6 node identifiers are imported without edits.

## Deliverables and checks

The packet and companion reader add eight theorem targets: polarized
imprimitivity detected in reduction, weak generic restriction, residual-image
invariance, splitting-field coefficient stability, general-Schur relative
cotangent control, weak Taylor–Wiles cotangent control, block-sign equivariant
patching, and generic Hecke-kernel containment. There are no new definitions or
constructions, so there are zero new API items and unit tests. The object APIs
and discriminating tests stay with the imported parent and supplier nodes.

Counts: eight theorem nodes; fifteen imported parent nodes; one planet
selection; three pinned baseline declarations; one mathematical gap; six
supplier requests. PL.6 has coverage `planned`, with zero closed stages. The
packet status is `complete`; implementation status remains `unchecked`.

The suggested file elaborated using `lean-check` at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369 on 10 October 2026. Exit status was zero;
the only diagnostics were the nine expected placeholder-proof warnings. The
finite-image signature is fully stated. Other signatures display concrete
algebraic outputs and identify their missing hypotheses in comments; the reader
is definitive. No opaque proposition fields stand in for the planned objects.
The blueprint checker reports zero errors and zero warnings.

## Mathematical conclusions and the remaining gap

The selfdual midpoint lattice supplies actual residual induction, rather than
only its semisimplification. A quadratic totally ramified change makes the
midpoint lattice integral without changing its residue field. Schur
semisimplicity then identifies its reduction with the original residual
representation. Split independent eigenlines avoid an additional coefficient
extension in the restriction proof. This repairs the parent's E27 reduction
step over an already normalized coefficient ring.

Normalization itself can enlarge the finite residue field. Weak primitivity
over an arbitrary smaller field need not survive this: the S₃ standard
representation over 𝔽₅ is absolutely irreducible and primitive over 𝔽₅, but is
induced from an order-three character over 𝔽₂₅. Neither Schur semisimplicity nor
the bound n<l resolves this coefficient issue.

The generic Hecke-kernel theorem therefore explicitly assumes weak primitivity
over the residue field of the normalization. It applies when primitivity is
tested over an algebraic closure, or when the starting field is a common
splitting field for every subgroup of the finite residual image. The new
splitting-field theorem proves that sufficient convention by descending the
semisimple inducing module. Choosing such a field after testing primitivity
over a smaller field would change the hypothesis and is not justified.

The one remaining gap is the literal arbitrary finite-k version of ANT Theorem
4.1: establish the required primitivity over the normalization residue field
from the full ordinary arithmetic hypotheses, or prove an appropriate descent
argument for that setup. Do not replace this by blanket coefficient invariance.
No arithmetic counterexample to Theorem 4.1 is claimed. Source issue E76 records
the exact proof interface needing justification.

The arbitrary-d comparison uses the fixed group H=μ₂^d, bounded presentations
and Fitting ideals, the equivariant patched fibre identification, and the
distinct-character/special-fibre support transfer. It does not infer
transitivity for an unrestricted inverse limit. The scalar Frobenius at S_a
supplies the scalar Selmer projection: its residual conjugation is trivial but
its cyclotomic value is nontrivial. This avoids assuming that a full-image
quotient condition passes to the cyclotomic subgroup (source issue E75).

The split-algebra case S(B)=∅ retains a compact real unitary group. The imported
adelic finiteness and one-prime neatness results give the finite quotient and
exact form modules required by PL.2. No division-at-a-finite-place assumption is
inserted. The conclusion concerns J=ker(P→Hecke) extended to R; no global
R→Hecke map is constructed.

## Supplier contracts

The exact hypotheses, outputs and consuming nodes are in the packet's six
requests and the reader. They are:

1. **ReductiveGroupsPartII:RG2.2:** import its existing splittable GL norm
   building, common bases, affine segments, group action and extension scaling;
   specialize to T=u². No building is replanned.
2. **GlobalGaloisDeformations:G7:** the actual finite square-zero cocycle and
   framed-cotangent comparisons, followed by their direct union to E/A. The
   square-zero ring with E/A is not an object of the Noetherian coefficient
   category. Proposition 3.9's presentation theorem is already imported.
3. **ArithmeticGaloisRepresentations:G7:** equal-characteristic T-adic
   projective-image and polarized adjoint bounds, uniform in the torsion level.
   The restructure proposal places this extension in ArithmeticGaloisRepresentations,
   Part II; residual adequacy does not supply it.
4. **ArithmeticGaloisDuality:D8:** finite-coefficient Poitou–Tate, exact framed
   local maps and the direct-limit Euler/corank calculation over E/A. This is
   distinct from characteristic-zero lattice rationalization.
5. **LocalGaloisDeformationRings:R08.2:** completed-tensor component transport,
   flatness and unique specialization with the corrected nilreduction topology.
   Proposition 3.14 and the component/Steinberg targets of Propositions 3.15 and
   3.17 are imported; Proposition 3.16's interface is requested.
6. **DeformationAndDerivedPatchingAlgebra:R03.5:** simultaneous finite-H
   equivariant bounded patching, Fitting continuity, completed Nakayama and
   Matlis duality. Existing R03.6 nodes supply support and near-faithfulness.

## PL.7 and assembly

PL.7 consumes weak generic restriction, image-preserving restriction,
splitting-field coefficient stability and generic Hecke-kernel containment.
Keep its own lifting and finiteness nodes; this continuation does not duplicate
them. ANT Theorems 6.1–6.2 use residual primitivity over an algebraic closure and
therefore avoid the finite-k coefficient gap. The finite-k formulations of
Theorem 5.1 and Corollary 5.4 must retain the normalized-field condition or a
justified splitting-field convention. Newton–Thorne's character-ratio criterion
proves primitivity after every coefficient extension and supplies that condition
in its character applications.

ANT Theorem 5.1 has a separate numerical issue, the parent's E32. Passing a
component intersection to characteristic l can cost one additional dimension;
the available lower bound is n[L⁺:ℚ]−|R|n(n+1)−3. Thresholds with +3 suffice for
the existing proof, while the printed +2 requires a sharper argument. This
continuation does not repair that threshold. Theorems 6.1–6.2 allow arbitrarily
large auxiliary degrees. Rank-one blocks in Newton–Thorne Proposition 5.6 still
need the parent's rank-one ordinary finiteness interface; an n≥2 theorem is not
substituted for it.

At assembly, the new generic Hecke-kernel node supplies the existing
**Generic R=T theorem** planet. Replace the parent's corresponding planet and
retain its other five: the assembled PL.6 has six, not seven. Carry the
coefficient hypothesis and gap into the assembled statement. Retain the
parent's fixed-field small-rank and strong-primitivity results.

## Sources and current upstream ownership

Thorne's accepted manuscript of 16 April 2014 was read at §§3.1–3.3, 3.7, 4.6,
5.1–5.2 and the relevant §6 argument. The author-page PDF has the same hash.
The AMS published PDF returned HTTP 403, so Thorne findings are scoped to the
manuscript. ANT's version of record was read at §§3–6; Skodlerack's published
norm formulas and interpolation at §3, p.519; Newton–Thorne arXiv:1912.11261v3
at §5, pp.66–72. URLs, versions, dates and hashes are in the packet and reader.
No unavailable book is required and no source passages are retained.

Source issues E27 and E31 reuse the parent's identifiers. E74 records ANT's
published correction of generic reducedness; E75 and E76 record the newly
identified scalar and coefficient interfaces. Their deductions and the
midpoint argument require independent review. No verdict from this worker is
inserted into a review object.

Current TauCetiRoadmap commit dea8191cc6047d6142a65872ebce6eeeb841a29b and current
Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were checked read-only.
Relevant current ownership includes ProfiniteArithmetic, LocalGaloisGroups,
IntegralHeckeAndGaloisDeterminants IHG.1 §1.4 and ReductiveGroupsPartII RG2.2.
The reviewed library audit has no record for this new roadmap; the accepted
R03.6 audit and pinned-source searches support the cited absent patching
targets. None of this existing mathematics is replanned.

Resume from the coefficient-descent gap and six supplier contracts after
independent review. All durable statements and evidence are in the four
deliverables; no scratch artifact is needed by another worker.
