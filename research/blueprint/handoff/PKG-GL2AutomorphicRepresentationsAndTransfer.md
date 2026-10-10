# PKG-GL2AutomorphicRepresentationsAndTransfer — blocked checkpoint

Issue: #7901. Worker: Codex, session `codex-kkVnMc`. Date: 2026-10-10.
Continues PRs #8068, #8149, #8161 and #8174.
Status: **partial; blocked on mathematical prerequisite closure**. Do not send
this package upstream as a completed roadmap.

The bot confirmed the claim following
[comment 6092671676](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6092671676).
No issue on the manager's priority list was available at selection. This focus
package was selected under WORKERS.md. No second issue was claimed.

## What this run changed

The R16.2 Iwahori oldforms target now has a faithful suggested declaration,
`TauCeti.GL2Blueprint.iwahoriOldforms`, rather than a signature omission.

- `localK0` is an abbreviation for the coefficient-map image of the existing
  lower-left `k0` over the valuation ring. It has level-zero, antitone and
  containment API, and three tests distinguishing upper/lower unipotents and
  integral scalars. It introduces no second congruence subgroup or local-field
  carrier.
- `iwahoriOldforms_dimensions` uses an actual representation of GL₂(F),
  Mathlib irreducibility and invariant submodules, open vector stabilizers,
  finite-dimensional compact-open invariants, infinite dimensionality and a
  nonzero spherical vector. It concludes spherical dimension one and Iwahori
  dimension two.
- `iwahoriOldforms` states the full characteristic-zero cyclicity and
  quadratic relation. The operator is the finite sum of π(g_a), where the
  matrices g_a=(ϖ a;0 1) are specified and a runs through exactly one
  representative of each residue class. No independent operator, arbitrary
  Hecke algebra or conclusion about fixed-space dimensions is assumed.
  The spherical eigenvalue is imposed on the actual double-coset sum, and
  c is the actual central action of ϖ. On the basis (v,π(diag(1,ϖ))v), the
  matrix has columns (λ,−1) and (qc,0); this gives cyclicity even when the
  Satake roots coincide. The finite sum specializes the SR Hecke action;
  it does not rebuild the generic Iwahori–Hecke algebra or its center.
- Three companion-matrix tests check the repeated-root Jordan case, the
  quadratic polynomial, and failure when its constant coefficient is halved.
  These are tests of that explicit matrix comparison, not constructions of
  an automorphic representation.
- `iwahoriDeterminantCharacter` and its nontrivial-character example give
  the actual excluded family: χ∘det on ℂ, with χ trivial on O×, has both
  fixed spaces equal to the whole line. Even a nontrivial such representation
  has Iwahori dimension one. This checks the necessity of the infinite-
  dimensional hypothesis already recorded in packet source issue E13.
- The README explains the coset normalization, operator comparison, tests
  and prerequisites. Its CG20 bibliography now gives the exact title and a
  public **published** copy, rather than silently treating the author's
  advance-publication pagination as printed journal pagination.

All previous positive repairs remain: Casselman existence, dimension,
K₀ central-character action and Whittaker evaluation, the Hilbert tensor
representation, newform normalization, fixed-central-character supercuspidal
projectivity and the integral GL₂(F₃) section. Other explicit signature
omissions still mark missing interfaces; their names are not declarations.
No packet or another job's deliverable was edited.

## Blocking evidence and file restriction

Both accepted input packets retain eight gaps, with no closed stages. In
particular, `R17.5/tunnell-primitive-globalization` and
`R17.5/prescribed-local-induction` need extension of prescribed characters
on **full local multiplicative groups**, and the latter also needs compatible
CM infinity components. The cited torsion-idele extension has a different
domain. This run reread Patrikis Lemmas 2.3.1 and 2.3.6 and checked the current
upstream and library contracts; the missing supplier has not appeared.

Current GlobalNumberFields Layers 9–10 supply Hecke characters, local
components, finite-order/ray-class factorization and infinity-type
compatibility for an **existing** character. In the current Lean statements,
`HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter` and
`HeckeCharacter.exists_modulus_embeddingCharacter_eq_one` both take χ as
an input. Neither produces a character satisfying given local components.
ClassFieldTheory explicitly excludes prescribed local abelian extensions and
Grunwald–Wang. Its general existence and Kummer targets do not state the needed
Chevalley S-unit congruence/character-prescription theorem. The packet itself
records that this extra theorem has no Atlas owner.

The issue's binding scope restriction is: **“Change no packet; if the plan
has a mistake, describe it in the handoff note.”** Completing this package
would require repairing the missing owner/proof chain in the plan, or falsely
claiming a dependency supplies it. This checkpoint therefore stops on that
specific blocker; it is not a time-limit checkpoint or a wait for supplier
implementation. The additional Iwahori interface is fully stated independently
of that blocker.

`metadata.toml` remains absent, as in the earlier checkpoints. The intake's
completion predicate treats this job as finished when all deliverables exist;
creating the metadata now would incorrectly mark this mathematically open
package complete. Once closure is supplied, write `topic = "math.NT"`.

## Validation

`lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`
exited **0**, with **135 warnings, all declaration uses `sorry`**, no errors
and no other warnings. Memory available before compilation was 104 GB.
The managed build uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and the supplied Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`.
This checks signatures, not proofs. Final changes after that successful
compilation only clarified source citations in comments.

Both input `scripts/check_blueprint.py` checks report **zero errors and
warnings**, eight gaps each, 32/35 requests, 55/57 nodes and zero closed stages.
An independent exact-integer matrix calculation verified the three companion
matrix tests and g_a diag(1,ϖ)=ϖI₂(1 a;0 1) in the sample ϖ=5.
The scoped intake file check and `git diff --check` pass.
The README stays below 200,000 bytes, with every inherited target heading
retained. Successful elaboration and name coverage do not close other gaps.

## Upstream and source receipts

The current read-only TauCetiRoadmap checkout is
`dea8191cc6047d6142a65872ebce6eeeb841a29b`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
These are audit references, not the compilation baseline. This run read
GlobalNumberFields and RepresentationTheory/InductionRestriction READMEs
in full, the relevant ClassFieldTheory scope exclusion and current
Hecke-character signatures, and consulted `data/library-coverage.json` for
all GL₂ layers. The pinned `Representation`, `Representation.invariants`,
`Representation.IsIrreducible`, `Matrix.GeneralLinearGroup`, its coefficient
map and `IsNonarchimedeanLocalField` statements were read directly.
Neither read-only checkout nor its Lake environment was changed.

Public sources read directly on 2026-10-10:

| Source | Locations inspected | SHA-256 |
| --- | --- | --- |
| [Calegari–Geraghty, *Minimal modularity lifting for nonregular symplectic representations*, published Duke 169 (2020), NSF copy](https://par.nsf.gov/servlets/purl/10184292) | §1.3, printed pp. 805–806: dimensions and characteristic-zero doubling; the “not trivial” wording remains in the published text. | `900ff1b1c583366bc2a248dd09630f973a2108f5aae2204f17c7f536d9d9b1bd` |
| [Calegari–Geraghty, advance-publication author copy](https://math.uchicago.edu/~fcale/papers/Siegel.pdf) | Title page and §1.3, printed author-copy pp. 5–6; these correspond to published pp. 805–806. | `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5` |
| [Casselman, *On some results of Atkin and Lehner* (1973)](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf) | Printed p. 306, principal/special calculations and Corollary to the Proof, viewed as a page image. Earlier newvector checks are preserved from the prior checkpoint. | `7f91ebae1a8f5e695800f4afb9fc06d0e2ea0b3a476751a31a7c8c3f38ad537d` |
| [Patrikis, author revision of 31 July 2016](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf) | Lemma 2.3.1, p. 28, and Lemma 2.3.6 and its proof, pp. 30–31: infinity-type existence and torsion-domain extension. | `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81` |

The public CG20 source supports the existing corrected target; no new erratum
was added. No private book was needed, no source file or passage is committed,
and this run does not claim to have reread the sources of every inherited
target. The detailed closure audit below is retained from earlier checkpoints.

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
