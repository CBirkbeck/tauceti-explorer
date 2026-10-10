# PKG-GL2AutomorphicRepresentationsAndTransfer — checkpoint

Issue: #7901. Worker: Codex (GPT-6), session `codex-FgD9hP`. Date: 2026-10-10.
Continues the 2026-10-09 checkpoint by `codex-FOIVIP` (PR #8068).
Status: **partial; blocked on mathematical prerequisite closure**. Do not send
this package upstream as a completed roadmap.

The issue describes its input as complete, but both accepted packets retain
eight gaps, and the assembly predates their latest corrections. The packet
checker accepts a complete planning pass with recorded gaps; that is different
from WORKERS.md's requirement of a roadmap with no gaps. The issue explicitly
forbids changing packets and directs the worker to describe plan mistakes here.
The unresolved owner contracts below cannot be repaired by joining documents,
renaming a prerequisite, or making the surviving algebraic fragments elaborate.

## This continuation

The claim bot confirmed session `codex-FgD9hP` in issue comment
[6091792408](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6091792408).
No second issue was claimed. This is a blocked checkpoint, not a completed
package or a claim that the inherited gaps have been closed.

- Corrected the two globalization targets' reliance on
  `R17.5/finite-hecke-extension`. Their character input is on the **full local
  multiplicative group**, whereas that lemma prescribes only torsion ideles.
  The reader now states the full-domain extension and the simultaneous
  local/infinity-type compatibility requirements explicitly. In Carayol’s
  case the finite-order-after-norm-twist condition is local; the global
  angular infinity components are nontrivial and of infinite order.
- Updated the complex local and global Whittaker prerequisites to current
  SmoothRepresentationsOfLocalGroups **SR.2.3/whittaker-functionals**, including
  its dimension-one and one-dimensional nongeneric cases. SR.5 now concerns
  integral families, rather than this complex multiplicity theorem. The DLB
  smooth coefficient-descent variant remains an additional requirement:
  the reader specifies F=ℚp, trivial central character, the cyclotomic
  coefficient algebra L∞, and the relation φ(ax)=σ_a(φ(x)). It cites DLB
  Remark 7.10 (p. 39) and the proof of Theorem 11.7 (p. 62). That comparison
  has not been certified supplied by the complex Whittaker theorem.
- Removed `supercuspidalProjective`'s unrestricted lifting of **functions of
  sets**. That statement admits a choice-theoretic section for every
  surjection and says nothing about representations. Its explicit omission
  now retains the intended name and records linearity, GL₂-equivariance,
  smoothness, the fixed central-character category, supercuspidality and
  characteristic-zero coefficients. DLB footnote 52, p. 64, was read directly;
  its application has trivial central character. No fake representation
  projectivity theorem replaces the omitted signature.
- Checked the newer current Tau Ceti Hecke-character implementation separately
  from the worker pin. The character carrier now exists; the prescribed-local
  **existence theorem** is still not supplied by the contracts inspected below.

The accepted R17.3 packet already records this exact missing character theorem
in its gap titled “Local–global extension of characters (Chevalley's congruence
theorem for S-units)”. Its proposed extra owner after GlobalNumberFields Layer 9
is not an installed layer. The issue prohibits packet edits and says to record
plan mistakes in this note. A package-only change cannot assign or accept that
new owner and its prerequisite chain. Completing the remaining files while
retaining a nonexistent supplier would misstate closure; repeating compilation
cannot resolve it. The maintainer must route/accept that mathematical addition
before this package can honestly be completed in its stated scope.

## Work preserved

- `packages/GL2AutomorphicRepresentationsAndTransfer/README.md` contains all
  112 accepted targets, their 81 API items and 66 tests, in twelve R16/R17
  layers. It is 194,801 bytes, below the 200 KB limit. Statements retain the
  latest corrected hypotheses, normalizations, cuspidal/isobaric distinctions
  and weak/all-place distinctions. Sources identify editions and theorem,
  section and printed-page locators. Prose is mathematical, with no programme
  process terminology or verbatim source passages.
- `packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean` joins the
  corrected **individual parts**, rather than the stale assembly. It imports
  the pinned matrix, representation, newform, symmetric-power and projective
  representation modules. Explicit omission blocks preserve the names of
  interfaces whose actual conditions cannot yet be typed. Those comments are
  not signatures, and the remaining examples are sometimes only components
  of the full README tests.
- The Hilbert coefficient prototype now uses the actual finite tensor of
  `Sym[K]^(k i - 2) (Fin 2 → K)`, with the product-group action and determinant
  twists. It states scalar weights, purity, dimension, dual weights and
  coefficient extension on that carrier. The tests use actual weight-two,
  weight-three and mixed-parity data. It does not substitute an arbitrary
  vector space of a stipulated dimension.
- The scalar normalization test uses the actual
  `HeckeRing.GL2.Newform.qExpansion_coeff_one` API. Matrix-power, adjoint
  Satake, nonzero monodromy, characteristic-two determinant normalization,
  finite projective lifting and the explicit mod-three integral section
  remain honest algebraic/arithmetic prototypes with their stated hypotheses.
- No packet, assembled reader, assembled suggested file, other job's output,
  atlas data or existing upstream roadmap was edited.

`metadata.toml` is **not submitted**: intake's completion predicate treats a
package as finished when all output files exist, irrespective of the handoff's
partial status. Its intended content is `topic = "math.NT"`. Create it when the
substantive completion conditions below have been met; its absence keeps this
submission a checkpoint and makes the job available for continuation.

## Validation

The final command was:

```text
lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean
```

It exited **0**, with **111 warnings, all “declaration uses `sorry`”**, no errors
and no other warnings. The shared build reports Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is the worker pin
`f790474821cf4256814db967cb154e7af3d0c369`. Available memory was 103 GB before
the final check. This validates elaboration, not proofs or omitted signatures.

Both input packets passed `scripts/check_blueprint.py`: zero errors and zero
warnings. Their summaries still show 8 gaps each, 32 and 35 requests
respectively, and **zero closed stages**. A name/heading audit found all 112
target headings, all 81 API names and all 66 test names in the README, and
every proposed declaration/API/test name in the Lean code or its explicit
omission blocks. This is name coverage, not full Lean signature coverage.

The internal packet prerequisite graph was checked for cycles and none was
found. README prerequisites contain no `FoundationsAndLibraryIntegration`,
`UPSTREAM:` or higher-tier R19 citation. For this continuation,
`python3 research/blueprint/intake.py check-files`
checked the three changed deliverables with **zero problems**, and
`git diff --check` passed. Only README.md, Suggested.lean and this handoff
were changed; the packets and their accepted reviews were preserved.

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

## Current-library and source audit (2026-10-10)

Current TauCetiRoadmap commit: `37769f03c170a7bc3e1082df70522a0ad59c5ffd`.
Current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
These are read-only audit references, **not the Lean compilation baseline**.
The current GlobalNumberFields and ReductiveGroups READMEs were read in full
for upstream form; relevant ClassFieldTheory exclusions and SR.2.3's exact
Whittaker contract and Suggested.lean were read separately. The inspected
current Hecke-character modules are under
`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/`:

| Module / API | What its statement supplies |
| --- | --- |
| `Basic.lean`: `TauCeti.GlobalNumberFields.HeckeCharacter` | Continuous characters of the actual idele class group into ℂˣ; use this carrier when compiling against a baseline that contains it. |
| `Basic.lean`: `HeckeCharacter.ofRayClassCharacter` | Pulls back an **already given** ray-class character. This does not construct one with prescribed local values. |
| `FiniteComponent.lean`: `HeckeCharacter.finiteComponent` | The continuous character of `(v.adicCompletion K)ˣ` obtained by the chosen local-idele embedding. This makes the required domain precise. |
| `FiniteOrder.lean`: `HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter` | Factors an **existing** finite-order Hecke character through some ray class group. Its χ argument is not an existential construction from a list of local characters. |
| `UnitCompatibility.lean`: `HeckeCharacter.exists_modulus_embeddingCharacter_eq_one` and `HeckeCharacter.isOfFinOrder_embeddingCharacter_units` | Necessary unit compatibility for an **existing** χ whose infinity type agrees with a specified algebraic type. Both take χ and its agreement proof; neither proves the converse with finite local prescriptions. |

The current Hecke-character subtree search and inspection found no theorem
constructing the simultaneous prescriptions needed here. The worker pin has
no `HeckeCharacter` or `Whittaker` module in its source tree. Accordingly the
Suggested.lean does not import the newer modules or restate their definitions
on arbitrary groups. The positive findings above supersede any inference
that the current character carrier itself is missing.

A small domain check makes the distinction concrete: the smooth unramified
quadratic character x↦(−1)^{v₂(x)} of ℚ₂× restricts trivially to
μ₂(ℚ₂)={±1}, just as the trivial character does, but takes value −1 at 2.
Consequently prescribing torsion values alone cannot prescribe even this
uniformizer value. This is a domain witness, not a counterexample to the
full character-extension theorem.

Public source receipts (all accessed 2026-10-10; no source text committed):

- [Patrikis, author revision of 31 July 2016](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf),
  Lemma 2.3.1, printed p. 28 (PDF p. 32), and Lemma 2.3.6, printed pp. 30–31
  (PDF pp. 34–35). The first treats an infinity type; the second extends the
  torsion-idele character with its complex-place condition. Neither statement
  prescribes all finite local components. SHA-256:
  `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81`.
- [Carayol, published Numdam scan](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf),
  §11.2, printed p. 450 (PDF p. 43), and §12.2.3, printed p. 458 (PDF p. 51).
  The former prescribes a whole local character, complex infinity components
  and non-norm behavior at the auxiliary place; the latter consumes finite-image
  Tunnell globalization. Neither supplies a proof of the missing extension
  contract. SHA-256:
  `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8`.
- [Tunnell 1978, GDZ article scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf),
  Theorem 1.3 and proof, printed pp. 182–183 (PDF pp. 5–6), read visually
  because the article has no useful extracted text layer. The proof uses
  extension of a one-dimensional local Weil representation, hence a character
  on the full local multiplicative group under reciprocity. SHA-256:
  `9f3e94853253589ac99f0b8ba5e67e90b6f33a581857a4f6083f92d6375ce066`.
- [Dospinescu–Le Bras, arXiv 1509.00606v2](https://arxiv.org/pdf/1509.00606v2),
  §7.5, Remark 7.10, p. 39; §11.2, proof of Theorem 11.7, p. 62; footnote 52,
  p. 64. These locators support the specific smooth descent application and
  trivial-central-character projectivity, rather than an arbitrary function
  lifting assertion. SHA-256:
  `bdf8f14fb4bfb4fe43980fdbff088b33469a16a9c0260616a0630de48de8cd68`.

## Other inherited closure requirements

These are the accepted gaps, not new red-team work. None should be silently
removed merely because the package has target headings for its consequences.

| Input gap | Disposition and resume point |
| --- | --- |
| R16: archimedean owner and complete comparisons | AF.1 supplies the intended classification/globalization; AL.2 owns factors. Full real/complex chamber and limit representations, epsilon signatures and the SU(2)/real-quaternion character comparison still need exact contracts. The proposed AF.1b split is not an installed layer. |
| R16: automorphic and test-function carriers | Keep the explicit omissions for local admissible classes, quotient measures, cusp classes, LLC and trace distributions. Do not restore the stale assembly's false theorems on arbitrary types. These omissions alone are not a reason to wait for implementation; the issue is supplying faithful signatures against sufficiently specified dependency interfaces. |
| R16: newvectors and ramified factors | The README records the lower-last-row K₁ convention and ω(d) K₀ character, transported from Casselman's convention via the contragredient. The full newvector Whittaker evaluation and ramified primitive U_p comparison still need the precise SR.2.3/AL.2/ModularForms Layer 4 interfaces. |
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

## Materials and next actions

Read the two individual accepted packets and their corrected per-part readers
and suggested files, all under `research/blueprint/`. Do not regenerate this
checkpoint from the assembled reader/suggested file: those still contain the
old unconditional arbitrary-carrier transfers. The package's hand-built tensor
prototype and newform test must survive any regeneration.

The previous checkpoint read the upstream ReductiveGroups and
ProfiniteArithmetic READMEs in full for structure and density; this
continuation read current ReductiveGroups and GlobalNumberFields in full.
The current nine post-snapshot roadmaps
and library were checked for relevant overlap; LocalGaloisGroups supplies local
Galois foundations, not automorphic/Weil–Deligne transfer objects. Current
GlobalNumberFields Layers 9–10 and GlobalQuadraticForms §4.4 were checked for
the specific contracts above. The reviewed `data/library-coverage.json` and
the pinned declarations underlying the imports were consulted. No upstream
checkout or its Lake environment was changed. No cleared private book was
needed and no source file or extracted passage is committed.

Resume by resolving the **prescribed-local-character owner** and the three
downward classical attachment proof chains. Then audit every row above against
the precise accepted lower-layer contracts and mark only genuinely supplied
requirements discharged. Keep mathematical requirements in the README and
process/blocker records here. Recheck the full signatures and definition tests;
name presence does not establish their adequacy. Add `metadata.toml` only when
ready to submit a completed package, rerun `lean-check` and the scoped file
checks, and submit the continuation for independent package review.

Scratch scripts and logs are disposable; this note and the two submitted
package files contain the state needed for continuation. No second issue was
claimed in this run.
