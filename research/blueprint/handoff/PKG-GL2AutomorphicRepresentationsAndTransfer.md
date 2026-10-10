# PKG-GL2AutomorphicRepresentationsAndTransfer — blocked checkpoint

Issue: #7901. Worker: Codex (GPT-6), session `codex-kBRc5k`. Date: 2026-10-10.
Continues PRs #8068, #8149 and #8161.
Status: **partial; blocked on mathematical prerequisite closure**. Do not send
this package upstream as a completed roadmap.

The bot confirmed this claim in
[comment 6092370908](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6092370908).
No manager-priority issue was available at selection. This available focus
package was selected under WORKERS.md; no second issue was claimed.

## What this run changed

The newvector existence and dimension signatures no longer need to be omitted.
Mathlib's pinned `IsNonarchimedeanLocalField` provides the valuation ring and
maximal ideal, and its `Representation` and `Representation.invariants` supply
the actual GL₂(F) representation and fixed-vector carriers.

- `localK1` abbreviates the existing last-row `k1` subgroup over the valuation
  ring, mapped into GL₂(F) by `Matrix.GeneralLinearGroup.map`. It introduces
  neither another local-field carrier nor another congruence construction.
  Its level-zero, antitone and integral-containment lemmas are accompanied by
  three matrix tests: upper versus lower unipotents, and a nonidentity diagonal
  unit. The tests exclude the wrong-row and principal-congruence conventions.
- `newvectorLevelExists` has actual irreducibility, open vector stabilizers,
  finite-dimensional invariants for every compact open subgroup, and infinite
  dimensionality. It concludes a nonzero fixed vector at some level; it does
  not assume that conclusion or a conductor exponent.
- `casselmanNewvector` states the full fixed-space dimension formula at every
  natural level, using the earlier least-level conductor and natural truncated
  subtraction. It does not assume that a one-dimensional fixed space exists.
- `casselmanNewvector_k0_character` states the central-character action on the
  minimal fixed space when the conductor is positive. The unit supplied to the
  character is exactly the lower-right matrix entry, embedded in F, rather
  than an arbitrary determinant. Level zero remains the spherical case.
- `casselmanNewvector_whittaker_eval` uses an actual nonzero linear functional
  equivariant for the specified upper unipotent matrices, and a continuous
  additive character trivial on O but nontrivial on the inverse maximal ideal.
  It concludes nonvanishing on the minimal fixed line without assuming that
  restriction is nonzero. Existence of the functional is imported from SR.2.3.
- The README specifies these baseline carriers and hypotheses, the subgroup
  specialization API and tests, and the precise Casselman page locators.

The local principal-series/Steinberg source models and ramified U_p comparison
remain missing interfaces. These signatures repair part of the recorded
newvector gap, **not that whole gap**. General
smoothness, admissibility, contragredients and Whittaker-functionals remain
owned by SmoothRepresentationsOfLocalGroups SR.3 and SR.2.3; this run does not
re-plan that theory.

Preserved earlier repairs include the actual finite tensor of symmetric powers
and its product action, the actual newform q-expansion normalization test, the
explicit mod-three integral matrix section, and the fixed-central-character
supercuspidal projectivity signature on existing equivariant linear maps.
Other honest omission blocks remain; their names are not full Lean signatures.

## Why the package cannot be completed in this job

The issue describes the input as complete, but the accepted packets retain
eight gaps each. The packet checker accepts a complete planning pass with
recorded gaps, whereas WORKERS.md and UPSTREAM_GUIDE.md require a gap-free
roadmap. The issue's rule is explicit: “Change no packet; if the plan has a
mistake, describe it in the handoff note.” The prescribed-local-character gap
already says that neither required extension theorem has an Atlas owner.
This run independently checked the relevant current upstream contracts and
source domains; that owner is still absent. A package-only change cannot
assign an accepted owner and proof chain to the missing theorem.

`metadata.toml` remains absent. The intake completion predicate treats the
package as finished when all deliverables exist, irrespective of a partial
handoff status. Create its one line, `topic = "math.NT"`, when the substantive
closure requirements have been met. Its absence keeps this a checkpoint.
Only the package README, Suggested.lean and this handoff were changed.

## Validation

`lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`
exited **0**, with **122 warnings, all declaration uses `sorry`**, no errors
and no other warnings. Available memory was 105 GB before the check. The build
uses pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; the newer read-only audit trees
were not used for compilation. This validates elaboration, not proofs or the
omitted interfaces.

Both `scripts/check_blueprint.py` input checks report zero errors and warnings,
eight gaps each, 32 and 35 requests respectively, and zero closed stages.
The README is **199,036 bytes**, below the 200 KB limit. All inherited target,
API and test headings remain; name coverage does not certify omitted signatures.
The scoped intake file check and `git diff --check` pass.

## Current upstream and source checks

Read-only TauCetiRoadmap commit:
`d6f707516e7ede3181dac4b2420ba25c0799d22d`.
Read-only current Tau Ceti commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
These are audit references, **not the compilation pins**. This run read current
GlobalNumberFields and ReductiveGroups READMEs in full, the ClassFieldTheory
scope exclusion, and the relevant Hecke-character declaration statements.
The reviewed `data/library-coverage.json` was consulted for the GL₂ stages.

Current Hecke-character modules live under
`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/`:

| API | Exact scope inspected |
| --- | --- |
| `HeckeCharacter` in `Basic.lean` | Continuous characters of the actual number-field idele class group into ℂˣ. |
| `HeckeCharacter.ofRayClassCharacter` | Pullback of an already supplied ray-class character. |
| `HeckeCharacter.finiteComponent` | A character on the units of the actual finite completion, derived from an already supplied global character. |
| `HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter` | Factorization of an existing finite-order character; χ is an input. |
| `HeckeCharacter.exists_modulus_embeddingCharacter_eq_one` and `isOfFinOrder_embeddingCharacter_units` | Necessary compatibility for an existing χ and its agreement with an infinity type; neither constructs a χ with simultaneous prescriptions. |

GlobalNumberFields Layers 9–10 therefore supply carriers, components and
compatibility of given characters, not the needed full-local existence
contract. ClassFieldTheory explicitly excludes Grunwald–Wang and prescribed
local abelian extensions. Its Kummer/Chebotarev prerequisites are ingredients,
not the missing theorem itself. Do not confuse this with a missing current
Hecke-character carrier, or restore a replacement carrier on arbitrary groups.

Sources read directly in this run, in our own words:

- [Casselman, *On some results of Atkin and Lehner* (1973)](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf),
  printed pp. 301–307, especially Theorem 1 on p. 302, its proof on pp. 303–306
  and the Corollary to the Proof on p. 306. The printed top-left convention
  requires the contragredient/central-character twist to obtain the lower-last-row
  convention here. The source covers dyadic residue characteristic.
  SHA-256: `7f91ebae1a8f5e695800f4afb9fc06d0e2ea0b3a476751a31a7c8c3f38ad537d`.
- [Patrikis, author revision of 31 July 2016](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf),
  Lemma 2.3.1, printed p. 28, and Lemma 2.3.6, printed pp. 30–31.
  The first specifies an infinity type; the second extends a torsion-idele
  character. Neither states simultaneous full finite local prescriptions.
  SHA-256: `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81`.

The mathematical audit below preserves the earlier checkpoints' Carayol,
Tunnell, Dospinescu–Le Bras and Gelbart–Jacquet findings. Their source editions
and precise locators remain in the package bibliography and target citations;
this run does not claim to have reread those articles. No private book was
needed, no source file or source passage is committed, and no read-only
upstream checkout or Lake environment was changed.

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
