# BP-PadicMeasuresIwasawaAlgebras — clopen measure topologies

Codex — codex-7e92bd. Refs #555. Claim5853060858 was confirmed by
bot5853061619; the whole issue was read before and after confirmation.
This partial continuation preserves all 142 predecessor node objects,
146 baseline records, thirteen source findings and thirteen planets.
No stage is closed and every implementation status remains unchecked.

Totals: **157 nodes** (2 definitions, 25 constructions, 97 lemmas,
20 theorems, 13 comparisons); **141 API items**; **109 packet tests**
(99 on definitions/constructions); **120 typed examples**; **13 planets**;
**157 baseline references**; **8 gaps**, **0 requests**, **13 source findings**.
There are fifteen new nodes, eleven new baseline records and seven new tests.
No new definition or carrier is introduced.

## Supplied comparisons

Mathlib already defines AbstractMeasure.WeakTopology and StrongTopology,
deliberately without global instances. The weak topology is available for
normed commutative ring coefficients. The pinned strong topology and the native
continuous-dual operator norm require a nontrivially normed field. Every new
signature selects the relevant existing topology explicitly.

L0 now supplies weak continuity of native pushforward and existing intrinsic
clopen restriction, a closed embedding of clopen measures, and a homeomorphism
for the existing complementary decomposition. Evaluation on fixed test
functions proves continuity; the continuous section/retraction gives closed
range in the Hausdorff ambient weak dual. No weak completeness or compactness
of the full continuous dual is assumed.

For field coefficients, native pushforward and clopen restriction contract
the operator norm, and clopen inclusion preserves it. The strong closed
embedding and complementary homeomorphism use these bounds. The inverse
product map has bound two with the maximum product norm over general normed
fields. An ultrametric isometry is not silently applied to an archimedean field.

L2 transports these comparisons to the actual p-adic unit group, including
p=2. The existing unit-measure/psi-kernel equivalence is a homeomorphism for
the weak topology and, separately with field coefficients, for the strong
topology. Unit inclusion preserves the field-valued measure norm. The pinned
integral Amice equivalence is a homeomorphism from weak measure topology to
coefficientwise series topology, using the existing inverse-evaluation
continuity. The existing unit-series kernel equivalence inherits this
homeomorphism. These results compare the actual maps and native submodules;
additive and multiplicative convolutions remain distinct.

## Reading and ownership

Read the full current campaign and handoff, all 142 predecessor statements,
the focal clopen/unit/Amice proof dependencies and suggested interfaces.
Read the reviewed AUDIT26 L0 row in full and the other seven target lists.
The binding protocols, accepted RS16/RS14 decisions and previously read upstream
LocalFieldsRamification and Multiquadratic models match the earlier continuous
session's full reads. The three existing supplier link files are unchanged;
the exact new AdicSpaces link was read. All five records naming PMIA stages
were checked against those reads. Stage descriptions repeat the campaign
contracts; all touching stage-edge endpoints were screened.

The baseline audit explicitly lists the native topology definitions, so none
is reconstructed here. The whole pinned source search and packet inventory
found no existing clopen-measure continuity/norm comparison with these exact
maps. Every one of the eleven added baseline declarations was statement-read
at the pin. The native norm bounds retain their nontrivially normed field
hypotheses. Existing source findings E9–E11 retain their convergence,
completeness and noncompact-domain qualifications.

Fresh public source: [RJW published version](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf),
full PDF20–22 / printed119–121 and PDF28–30 / printed127–129, read on
27 September2026. This includes Definitions3.5,3.7–3.8, Remarks3.9–3.12,3.31,
Corollary3.32 and Remark3.33 with their surroundings. SHA256:
`78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.
The topology comparisons and generality are worker derivations from these
formulas and existing library APIs. All thirteen findings are preserved;
there is no new source finding, independent review or whole-source reading claim.

## Validation

The actual full suggested file compiles with **0 errors and 339 expected
placeholder warnings only**. All **2,737 reached Mathlib source modules** match
the pin; no Tau Ceti module is imported. The import scan excludes examples
inside comments. All prior suggested-file bytes remain between two new native
imports and the appended block.

Two complete scratch Lean proofs establish weak continuity and operator-norm
contractivity of the actual native pushforward, with **0 errors, 0 warnings
and 0 placeholders**. They use only baseline declarations, not planned maps.
The weak-continuity proof even needs no compactness assumption. These validate
the generic steps; all roadmap implementations remain unchecked.

**32,336 exact assertions** check signed rational atomic measures on a
three-point space for p=2,3,5,7, with weights −p,−1,0,1,1/p, every clopen and
every map to a two-point space. The p-adic dual norm is the maximum of the
atomic absolute values and the archimedean dual norm is their sum; both are
attained by test functions. The tests check contraction, inclusion norm,
complementary bounds and three kinds of false-isometry controls. Monomial
coefficient controls distinguish coefficientwise and supremum convergence.
They do not prove infinite-dimensional topology or compactness.

Unmodified-index blueprint: **zero errors and warnings**. Exact four-file
intake: **zero problems**. The source-finding wrapper, all preservation checks,
reader/signature/test parity and scoped mutation checks pass. The 644-edge
prerequisite graph is acyclic and reaches only named nodes and baseline leaves.

Suggested-file SHA256: `27c29b8325f215ed2a485876347af830290ad94002ac5e5e663fa44f198c6395`.
Complete pushforward-proof SHA256: `4301eb978e50ef6f4a814e32c7cd20b5764caaf9f881ad1a5a54fb399058e1e6`.

Final guard: all 49 captured inputs and the four predecessor outputs
match main `9fa426198d5d4239f7ec0fa83df8b5ebaa859308`; the issue body and winning claim
are unchanged. The refreshed Coleman input equals our merged PR3187 artifact.
Exactly the four authorized deliverables are published through Git Data REST.

## Exact continuation

Coleman can consume clopen-inclusion-weak-closed-embedding,
unit-measure-kernel-weak-homeomorphism and unit-measure-amice-weak-homeomorphism
for its actual integral measure target. The field-valued strong comparison
is separately available. The integral strong/norm request still needs the
actual integral-lattice embedding in a field dual; no norm on the integral
measure carrier was smuggled in through a field instance. Consumer files are
unchanged by this job.

L0 continues with bounded finitely additive clopen data, integral lattices,
finite-extension scaling, general coefficient extension and completed tensors,
and the precise completeness, weak compactness and norm noncompactness
statements. L2 continues coefficient towers and norm/lattice comparisons,
convolution and multivariable theory, general residue classes and the
convergent unit-dilation/substitution comparison. The new homeomorphisms remove
only the specified weak/clopen and field-valued strong comparison work.

The other six coverage records and gap records are unchanged. In particular,
completed-group-algebra coordinates retain the upstream joint adic topology
gate, and the remaining character-space, pseudomeasure, Weierstrass,
determinant, exactness and order-duality targets still need full decomposition.
The predecessor handoff is available in [PR3181](https://github.com/CBirkbeck/tauceti-explorer/pull/3181).
