# BP-K3BlochGroups--V.6

Issue [#6386](https://github.com/CBirkbeck/tauceti-explorer/issues/6386), completed
by Codex, session **codex-yOvAM9**, on 2026-10-06. The bot confirmed the claim
in issue comment 6007493894. This is a complete planning pass with exact scope
`K3BlochGroups:V.6`; coverage is **planned**, with three explicit gaps and two
supplier requests. No stage is claimed closed or implemented.

## Deliverables and retained work

The part packet, reader and suggested file add five target declarations:
three constructions and two definitions. They contain 41 API items, twenty
unit tests, four new planets and sixteen pinned baseline declaration
references. All implementation statuses remain unchecked. There are two
source misprints and two restructure proposals.

The reviewed parent packet is unchanged. Its Bloch-element constructor,
boundary certificate, five-term equality certificate and soundness theorem,
root boundary and bundled root-class specializations, existential
certificate-to-bar lift, and rational/integral/ordinary-modulo comparisons
are imported by exact node id. The part's targetCoverage map assigns each
retained target to those ids. The latest parent already has a bundled
root-of-unity-class construction; the new integral numerator and general
coefficient-ring construction refine its interface rather than define its
three specialized objects again.

The new objects are an integral multiple in the actual kernel, its divided
tensor over a ring in which the multiplier is a unit, a fibre of the actual
Suslin quotient, a finite Steinberg bar-cycle witness, and the composition of
two existing finite-coefficient cohomology comparisons. The coefficient
construction makes no flatness assumption and no tensor/kernel interchange.
The lift fibre has enhanced-Tor ambiguity and no preferred origin or additive
section. The finite bar witness remembers its chain, rather than only its
homology class. Its noncomputable selection interface is an existence
interface, not the missing effective algorithm.

The finite-coefficient construction distinguishes K₃(F)/n from
K₃(F;ℤ/n) and the ordinary Bloch quotient from the coefficient/étale Bloch
group. It imports the latter from HabiroNumberFields:HB.2. In the common
good-prime range it defines Φ=R_ζ⁻¹c̄. Its restriction to the quotient uses
the inverse of the existing Habiro comparison scalar, under the additional
M_F hypothesis. It does not silently extend the unscaled Suslin map or
assert equality of the right-hand Bocksteins.

## Confirmed red-team instruction and ownership

**RT-AREA-ktheory-2/23 is handled:** regulator agreement is removed from this
part's V.6 specification. Polylogarithms:P.2 owns the real comparison, with
BorelRegulators:R.7 supplying its scalar check; PadicHodgeRegulators:D.2
owns the p-adic comparison. D.3 is not substituted for D.2. The rescope is
recorded for maintainer application; campaign text, atlas data and the parent
packet are unchanged.

The current P.2 comparison already imports the V.4 Suslin maps, and D.2 can
use V.4 functoriality and the V.3 Bloch model. Neither needs the new
finite-coefficient node to state its analytic comparison. The conditional
instruction to add V.6 outgoing edges is therefore unnecessary for these
interfaces. Moreover, this part consumes M.8, while the atlas has paths
P.2 → R.7 → M.8 and D.2 → M.8. A whole-stage outgoing V.6 edge would create
a cycle once these new inputs were included.

The second restructure proposal separates V.6a, algebraic elements and
certificates, from V.6b, arithmetic finite-coefficient identification. The
node-level order is V.6a → HB.2 → V.6b, with M.7/M.8 → V.6b. Any analytic
consumer that needs a V.6-specific certificate interface should take that
input from V.6a. Keep all node ids and the present issue scope when applying
the split. At assembly retain the parent's two certificate/constructor
planets and the four new root/lift planets, giving six for the combined
current layer. The finite-coefficient construction adds no planet.

## Exact remaining work

1. **Effective certificate-to-cycle synthesis.** Supply a sourced procedure
   taking finite symbol/boundary/equality certificates to a finite chain in
   C₃(St(F),ℤ), with its checked differential and comparison equation.
   Specify auxiliary choices and a termination or precise range statement.
   Neither VI.5.12 nor the circular-unit paragraph read for this job supplies
   this algorithm. Classical choice does not close the gap.
2. **Finite-coefficient right-end normalization.** Determine δ_BΦ on
   K₂(F)[n] against the finite K-theory Bockstein and Tate's degree-two Chern
   map, including the sign/scalar in the exact imported conventions. The
   left subgroup calculation alone does not determine that assertion.
3. **Inherited V.1 input.** The parent records an upstream-citation gap for
   the degree-three absolute Hurewicz theorem on the two-connected BSt(F)⁺.
   Resolve that input and its bar/singular comparison in the V.1 owner. This
   part imports its stated Steinberg model, preserves the gap and never
   replaces St(F) with the elementary group.

Requests in the packet are addressed to **MotivicEtaleKTheory:M.7** for the
finite Chern isomorphism over the original number field, using Hutchinson
Theorem 2.10 and the odd Milnor quotient calculation, and to **M.8** for
finite reduction, the twist convention, compatibility with the modulo
inclusion and the degree-two Bockstein scalar. Hutchinson Corollary 2.11
requires adjoining μ_n and is not applied over a good-prime field lacking
those roots. Assembly must retain the parent nodes and their honest input
gaps, reconcile the six planets and apply the ownership proposals. These
remaining inputs prevent a closed coverage claim.

## Sources and baseline verification

Sources read are the public separately hosted Weibel Chapter VI, §5,
Definition 5.1, Theorem 5.2, Lemma 5.10 and Proposition 5.12; CGZ
arXiv:1712.04887v3, its introduction, convention comparison, Chern sections
and §6; and Hutchinson arXiv:2104.14413v4, §§1–2.3. The source entries record
exact URLs, read passages, versions, access date and SHA-256 values.
The actual public Weibel chapter states the cited Suslin theorem for
infinite fields; its finite-field extension remains a separately justified
parent input. No source was missing for the new statements; sources for
the effective algorithm and inherited Hurewicz proof input remain the
explicit gaps above.

The author-hosted printed CGZ article was collated at §6, printed p415,
against preprint p32. E-V6-1 corrects Q/nR to K₂(F)[n] in the sentence
following the exact sequence; E-V6-2 corrects the adjacent premature variable
z to x in the boundary-lifting construction. Both are harmless misprints
present in both copies. The packet records the author copy and preprint in
sourceVersions and lists the author, publisher, preprint and existing packet
searches for corrections. No published correction was found. The independent
reviewer must verify both findings; no review verdict is supplied here.

The reviewed V.6 audit is AUDIT-29, not_built. Pinned Mathlib statements were
read at 082e2d37e8b0463410cdb532e111cd43d5a66174. The Tau Ceti recursive
source-path tree at f790474821cf4256814db967cb154e7af3d0c369 was inspected
(5,478 Lean paths, untruncated), together with the available declaration
index and focused searches. No matching Bloch/algebraic K₃ module was
found. Lie-theoretic Steinberg relations do not supply the stable
Steinberg group. The shared Tau Ceti checkout had a different commit, so no
Tau Ceti declaration is cited or imported from it. Generated additive kernel
and equivalence names were also checked by elaborating the actual types.

## Validation

`scripts/check_blueprint.py` passed without errors or warnings, using the
available pinned declaration index. Its dependency, scope, source, API,
test and planet checks passed. Packet/reader/suggested correspondence was
checked for every API item and all twenty named examples. The part ids do
not collide with parent ids, and every external node prerequisite was read
and checked for the required contract.

The suggested file **compiled successfully with lean-check**, using the
existing pinned Mathlib build, with zero errors and exactly 52 expected
proof-placeholder warnings. There were no other warnings. It imports only
individual Mathlib modules; this is not a full Tau Ceti build at its pinned
commit. Forty of the 41 API items have typed declarations; the unavailable
field-only rootCoefficient_specializations interface is stated precisely
in a comment with all three parent equalities. The arithmetic specialization
and [32] acceptance case are also exact comments beside the genuine generic
construction. No missing field object or hypothesis is replaced by a bare
type or proposition. Elaboration checks signatures, not the unproved
mathematics or the requested effective algorithm.

The acceptance cases distinguish the sixth-root diagonal obstruction,
nonflat tensor map, nonsplit ℤ/24→ℤ/6 fibre, nonzero bar chain with zero
homology, and nonzero K₂(ℚ)[5] term represented by [32]. Only the four
deliverable paths are submitted. No source PDF, extracted text, scratch
file or private absolute path is included.
