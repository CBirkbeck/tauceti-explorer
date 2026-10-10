# PKG-GL2AutomorphicRepresentationsAndTransfer — blocked checkpoint

Issue: #7901. Worker: Codex, session `codex-yPoVRs`. Date: 2026-10-10.
Continues PRs #8068, #8149, #8161, #8174 and #8190.
Status: **partial; blocked on mathematical prerequisite closure**. Do not send
this package upstream as a completed roadmap.

The bot confirmed this claim in
[comment 6092871066](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6092871066).
None of the manager's listed issues was available. This available focus package
was selected under WORKERS.md; no second issue was claimed. The branch starts
with the session id. The clone was updated to include #8190, which merged just
after its initial snapshot, before the final changes were made.

## What this run changed

The existing Casselman and full Iwahori signatures now have explicit local
subgroup inputs for their compact-open admissibility and fixed-space comparison.

- `localK0_isCompact`, `localK0_isOpen`, `localK1_isCompact` and
  `localK1_isOpen` state compactness and openness in the topology of the existing
  GL₂(F) matrix unit group. They use the already defined valuation-ring subgroup
  images. They do not introduce another carrier or assemble adelic groups.
- `localK0_scalar_mul_localK1` supplies the exact algebraic input: every element
  of localK0(n) is an integral scalar times an element of localK1(n). For n>0,
  its lower-right integral matrix entry is a unit and is the scalar to use;
  for n=0, take scalar 1. The proof uses invertibility of the reduced triangular
  matrix, multiplication by the scalar inverse, and the earlier membership API.
- `localK0_invariants_eq_localK1` equates the actual invariant submodules at
  every level if all integral scalar units act trivially. It requires neither
  irreducibility nor a chosen spherical vector. Apply the decomposition above
  and Mathlib's `Representation.mem_invariants` in both directions. In the
  irreducible spherical case, the scalar action is trivial because the group
  span of a nonzero spherical vector is the whole representation.
- Three additional examples test the level-zero/level-one Weyl boundary, the
  distinction between a scalar in K₀ and in K₁, and necessity of the scalar-action
  hypothesis in the fixed-space comparison. The scalar subgroup test assumes
  a nonidentity residue unit, so it imposes no false existence assertion over
  residue field F₂. For the fixed-space non-example, an integral scalar acting
  by a≠1 forces K₀ invariants to vanish: (a−1)v=0 implies v=0. Nonzero K₁
  invariants then preclude equality of the submodules.
- The README records these inputs and tests and explains their use in the
  Iwahori argument. Repeated explanatory prose in the conductor and projectivity
  sections was shortened to keep the complete document below 200,000 bytes.
  Every inherited target heading remains.

All earlier positive work is preserved, including #8190's full finite-sum
Iwahori operator, quadratic relation, repeated-root tests and determinant-character
counterexample. The Casselman, tensor, newform, projectivity and GL₂(F₃) section
interfaces remain. No signature omission is counted as a declaration, and no
accepted packet or another job's files were changed.

These are suggested signatures with `sorry` proofs, not implementations. The
new local subgroup inputs do not close the unrelated character-extension gap.

## Why completion is blocked

Both accepted input packets retain eight gaps and zero closed stages. The
specific ownership blocker is their R17.5 full-local character-extension gap,
consumed by `tunnell-primitive-globalization` and `prescribed-local-induction`.
It needs a global Hecke character with prescribed characters on full local
multiplicative groups; the latter consumer additionally prescribes compatible
CM infinity components. The accepted plan explicitly records that no Atlas
stage owns the needed Chevalley S-unit congruence and prescription theorem.

This run rechecked current GlobalNumberFields Layers 9–10 and the library's
`HeckeCharacter`, `finiteComponent`, `ofRayClassCharacter`,
`isFiniteOrder_iff_exists_rayClassCharacter`,
`exists_modulus_embeddingCharacter_eq_one`, and
`isOfFinOrder_embeddingCharacter_units`. They supply carriers, components,
factorization, or compatibility for a character χ already given as input;
they do not construct one with simultaneous full local prescriptions.
ClassFieldTheory's scope still excludes prescribed local abelian extensions
and Grunwald–Wang. Its existence/Kummer targets are not that extra theorem.
Searches of the nine newer roadmaps' suggested files found no competing
local-character prescription or K₀/K₁ subgroup contract. The newer
SmoothRepresentationsOfLocalGroups scope and Whittaker contracts likewise do
not supply the missing prescription theorem.

Patrikis's author revision was reread at Lemmas 2.3.1 and 2.3.6 and their proof
context, printed pp. 28 and 30–31. The former is an infinity-type existence
criterion; the latter extends a character on the torsion-idele quotient.
Its domain is not the full local multiplicative group. It cannot justify the
two consumers' prescribed-local clause by itself.

The issue explicitly says **“Change no packet; if the plan has a mistake,
describe it in the handoff note.”** WORKERS.md and PROTOCOL.md §§3, 15 and 20
require exact ownership and gap-free package dependencies. A package-only edit
cannot route and repair the accepted plan's missing owner/proof chain.
This is a mathematical/scope blocker, not a time-limit checkpoint or a wait
for supplier implementation. The next action is a maintainer routing decision
and the corresponding plan repair, as detailed below.

`metadata.toml` remains absent. `issues.deliverables_complete` treats this package
as complete if all output paths exist, irrespective of an incomplete handoff.
Adding the metadata would misclassify this checkpoint. Once the substantive
closure requirements are met, add `topic = "math.NT"` and complete the omitted
interfaces. Do not complete this job by adding only the metadata.

## Validation

`lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`
exited **0**, with **144 warnings, all declaration uses `sorry`**, no errors
and no other warnings. Available memory was 104 GB before the final check.
The managed build uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
This establishes elaboration only. No Lean process remains running.

Both input `scripts/check_blueprint.py` checks report **zero errors and
warnings**, 55/57 nodes, eight gaps each, 32/35 requests and zero closed stages.
The scoped intake file check and `git diff --check` pass. All 115 inherited
target headings remain; the README is **199,924 bytes**.

An independent exhaustive calculation over GL₂(ℤ/25ℤ) checked the scalar
factorization for all 50,000 lower-left-level-5 matrices and all 10,000
lower-left-level-25 matrices: their lower-right entry is a unit, scalar-inverse
multiplication gives the last-row subgroup, and scalar multiplication recovers
the matrix. It also checks the Weyl and scalar-2 subgroup distinctions.
These finite calculations test conventions; they are not proofs of the local
field theorems or an independent review of this job.

## Reading receipts

Current read-only TauCetiRoadmap:
`dea8191cc6047d6142a65872ebce6eeeb841a29b`.
Current read-only Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
These are audit references, not the compilation pins. This run read the
GlobalNumberFields and ReductiveGroups READMEs, the relevant current
GlobalNumberFields/ClassFieldTheory Suggested contracts, the SR.2.3 Whittaker
and scope contracts, and the current Hecke-character declarations named above.
It consulted the reviewed `data/library-coverage.json` for every GL₂ layer.
The pinned local-field, matrix-group and invariant-submodule declarations were
read directly. Neither read-only checkout nor its build was changed.

Public sources read directly on 2026-10-10:

| Source | Locations inspected | SHA-256 |
| --- | --- | --- |
| [Casselman, *On some results of Atkin and Lehner* (1973)](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf) | Printed pp. 302 and 306, viewed as page images: subgroup/central-character convention and fixed-level dimension corollary. | `7f91ebae1a8f5e695800f4afb9fc06d0e2ea0b3a476751a31a7c8c3f38ad537d` |
| [Patrikis, author revision of 31 July 2016](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf) | Lemma 2.3.1 and surrounding definitions, p. 28; Lemma 2.3.6 and its proof, pp. 30–31. | `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81` |

No private book was needed; no source file, source passage or private path is
committed. The inherited CG20, Carayol, Gelbart–Jacquet, Tunnell and DLB source
contracts are preserved, without claiming they were reread in this run.
The detailed earlier closure audit follows.

## First blocking mismatch: prescribed local characters

Consumers: `R17.5/tunnell-primitive-globalization` and
`R17.5/prescribed-local-induction`.

Needed: given a number field M, finitely many finite places S and finite-order
characters of the full multiplicative groups M_u×, construct a finite-order
Hecke character with exactly those components, allowing auxiliary ramification.
For the prescribed CM infinity type, also prove the compatible type-A
infinity-type and local-component version (with the chosen norm twist for an
algebraic type). Carayol requires finite order only for the specified finite
component after its norm twist: globally the nonzero angular infinity type
persists, so this is not a global finite-order assertion. Tunnell's
quasi-character version
needs continuous extension from an embedded local multiplicative group to the
idele class group. Each statement needs the global-unit compatibility and
topological extension argument, not just an abstract character-extension lemma.

`R17.5/finite-hecke-extension` has a different domain: the torsion-idele subgroup
μ_n(M)\μ_n(A_M). [Patrikis, Lemma 2.3.6, pp. 30–31](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)
was reread and states this torsion-domain extension, including its complex-place
condition and Grunwald–Wang ambiguity. It does not prescribe a character on
every element of M_u×. Therefore the reader's references to that node do not
close the globalization argument.

Current GlobalNumberFields Layers 9–10 define Hecke characters, local components,
conductors and infinity types, but do not state this existence theorem.
ClassFieldTheory's scope excludes prescribed local abelian extensions; its
Kummer and Chebotarev inputs do not themselves give the required extension.
The accepted R17.3 packet records the same missing contract, proposing a
Chevalley congruence theorem for S-units and an extension after GlobalNumberFields
Layer 9. Do not re-plan GlobalNumberFields or invent a citation to a layer that
does not supply it. The maintainer needs an owner for that additional theorem
and its proof chain, then these two targets can import that exact contract.

## Other inherited closure requirements

These are the accepted gaps, not new red-team work. None should be silently
removed merely because the package has target headings for its consequences.

| Input gap | Disposition and resume point |
| --- | --- |
| R16: archimedean owner and complete comparisons | AF.1 supplies the intended classification/globalization; AL.2 owns factors. Full real/complex chamber and limit representations, epsilon signatures and the SU(2)/real-quaternion character comparison still need exact contracts. The proposed AF.1b split is not an installed layer. |
| R16: automorphic and test-function carriers | Keep the explicit omissions for local admissible classes, quotient measures, cusp classes, LLC and trace distributions. Do not restore the stale assembly's false theorems on arbitrary types. These omissions alone are not a reason to wait for implementation; the issue is supplying faithful signatures against sufficiently specified dependency interfaces. |
| R16: newvectors and ramified factors | The existence, dimension, ω(d) K₀ action and Whittaker evaluation now have faithful signatures on actual GL₂(F) representations. SR.2.3 supplies the chosen nonzero Whittaker functional. The ramified primitive U_p comparison still needs the precise AL.2/ModularForms Layer 4 interfaces, and source-level principal-series/Steinberg tests still need their SR.2 models. Do not call this whole recorded gap closed. |
| R16: primitive wild dyadic example | A tame quadratic example is insufficient. Supply an explicit primitive dyadic parameter, its Swan/conductor computation and quaternion matching test function on the stated ET.6 normalization. |
| R16: Galois normalization | The arithmetic/geometric inversion and half-twist are explicit. Matching nebentypus reciprocity, the cohomological dual and ramified N remains the attachment owner's comparison, rather than a reverse dependency on R19. |
| R16: singular and continuous trace terms | JL §16 is a sketch. The AS.6/ET.4 specialization must account for identity, unipotent, intertwining-derivative, quadratic exceptional and norm-character/residual terms with the fixed measures and one-half Weyl weights. Generic cancellation does not supply the calculation. |
| R16: supplier conditions and full tensor types | The full Hilbert tensor/action, dimension, dual and base-change algebraic carrier is now prototyped. Actual Weil induction, primitive cusp subtype, orbital integrals and support/volume conditions remain omitted. Do not call the entire recorded gap closed. |
| R16: global quaternion existence | Current **GlobalQuadraticForms §4.4**, especially `exists_hilbertSymbol_eq_neg_one_iff_pair`, supplies a,b with prescribed finite/real Hilbert signs for an even ramification set. Combine it with **QuadraticFormInvariants Layer 2**'s existing `(a,b)` algebra. This is an existing existence route, now cited in the README and Lean comment. Check the exact uniqueness/isomorphism-class interface separately; local classification or parity alone is insufficient. Do not add a second quaternion carrier. |
| R17: highly ramified GL₃ converse | The generic AL.3 reduced-rank converse is not the needed highly ramified T variant. [Gelbart–Jacquet §9.1–9.2, pp. 531–534](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf) was reread: it uses partial products, trivial central character, attached generic representations, an exponent bound, the highly ramified functional equation and a slowly increasing realization, followed by separate constant-term branches. The omitted T factors contribute cubes of character epsilon factors. Supply this exact contract and its JPSS §13 reconstruction proof chain to AL; twists unramified at S cannot replace it. |
| R17: original nonnormal cubic transfer | The README preserves the weak Tunnell theorem and does not identify it with the all-place Carayol assertion. Obtain the original JPSS proof or a complete later proof and the local restriction comparison. Nonnormal cubic transfer cannot be constructed by a cyclic tower. |
| R17: prescribed-supercuspidal globalization | CDN20's use of Clozel, with prescribed finite component, archimedean type, central-character adjustment and coefficient extension, requires a limit-multiplicity contract. An AS.6 trace-formula stage alone is not that theorem. |
| R17: reduction-compatible solvable projective lift | Tate's complex obstruction vanishing does not ensure reduction to the given residual representation. Supply the integral projective lift and final scalar twist. Separate the prime-to-p case from p=3, A₄/S₄, where the explicit GL₂(F₃) section is available. The latter section elaborates, but is not by itself the full residual lifting theorem. |
| R17: local–global character extension | The blocking domain mismatch is detailed above. |
| R17: all-place Artin upgrade | Tetrahedral/octahedral almost-everywhere matching needs a separate all-place argument using JL70 §12's fully twisted analytic hypotheses and local factors, or a proved equivalence of Langlands's two constructions. Good-place uniqueness is insufficient to establish local parameters at bad places. |
| R17: GL₃ recognition signature | The actual global admissible/cuspidal, completed twist, epsilon and pole carriers are omitted by name. The algebraic adjoint Satake calculation is not the converse theorem or pole criterion. |
| R17: transfer signature omissions | Global JL, cyclic/solvable/cubic transfer, induction, Artin automorphy and the characteristic-two modularity applications still require the exact carriers and hypotheses listed in their omission blocks. Do not count those blocks as declarations or the fragment examples as full source-level tests. |

## Downward ownership moves

WORKERS.md forbids the four upward prerequisite edges in the accepted R17.3
packet. Its `rt-technical-lemma` cites the higher R19.1 weight-one and
higher-weight attachment nodes and R19.4 conductor comparison;
`weight-two-witness` also cites the higher-weight attachment.

The README now names three required local targets at the start of R17.6:

| Old owner | New local target |
| --- | --- |
| AutomorphicGaloisRepresentations `R19.1/lambda-adic-representation-of-a-weight-k-eigenform` | `R17.6/classical-higher-weight-attachment` |
| AutomorphicGaloisRepresentations `R19.1/weight-one-artin-representation` | `R17.6/classical-weight-one-attachment` |
| AutomorphicGaloisRepresentations `R19.4/conductor-and-local-factors-classical` | `R17.6/classical-conductor-comparison` |

The scope is the **classical ℚ input** required by these residual arguments,
not all Hilbert/geometric Galois attachments or compatible systems. The higher
roadmap should import these classical results from the completed lower owner.
These are provisional mathematical contracts, **not certified closed moves**:
the rank-two eigenprojector realization for k=2, symmetric-power realization
for k≥3, coefficient descent and integral ramified local comparison must be
attached to exact lower owner contracts. HilbertModularVarietiesAndShimuraCurves
R18.4 is a cohomological interface, not automatic proof of all of those bridges.
Deligne–Serre Theorem 6.1 states the higher-weight input it uses; a citation to
that statement alone is not a construction proof. The Lean file names the
three signature omissions honestly. Accepted packets and higher consumers
have not been changed, per the issue's file restrictions.

## Resume here

The maintainer must route and accept the **prescribed-local-character theorem
and proof chain** in its owning plan. Reconcile that owner with both consumers
and with the infinity-type compatibility requirements, rather than citing the
torsion-domain lemma. The issue's packet-edit prohibition prevents this package
worker from making that plan change. Also resolve the three downward classical
attachment proof chains above, and audit every remaining gap against its exact
supplier contract. Do not treat an implemented carrier, a stage name or a
signature omission as the missing mathematical bridge.

Use the corrected individual R16.1/R17.3 packets and per-part files, together
with the current package. Do not regenerate from the stale assembled suggested
file: it contains old unrestricted arbitrary-carrier transfers. Preserve the
positive tensor, projectivity, newform, matrix-section and newvector repairs.
Read current upstream roadmaps and current library separately from the pinned
compilation baseline. Once closure is established, complete the faithful Lean
interfaces and definition tests, add metadata, and rerun the packet, Lean and
scoped intake checks for independent package review.

Scratch logs and downloaded public articles are disposable; all state needed
by the next worker is in this handoff and the submitted package files. No second
job was claimed.
