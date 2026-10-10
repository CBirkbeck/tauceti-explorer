# PKG-GL2AutomorphicRepresentationsAndTransfer — blocked checkpoint

Worker: Codex (GPT-6), session `codex-j31rIK`. Issue: #7901.
Date: 2026-10-10. Branch: `codex-j31rIK-gl2-package`.
Status: **partial; blocked by unresolved mathematical supplier contracts in the accepted plan**.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6096626584).
This session claimed only this job. None of the manager's priority issues
was available; this available focus package was selected under WORKERS.md.

## Current continuation: repair the inputs before another package pass

The inherited blockers were independently checked against the accepted plans,
the tier order, current upstream scope and five current library statements.
Both accepted GL2 plans and both current read-only revisions are unchanged
from the preceding checkpoint. The relevant character contracts remain
unchanged. This session adds the Fong–Swan repair lead below, with the exact
lattice output, its arithmetic consequences and its unverified proof boundary.
No mathematical target was added and no claim of closure was made. Only this
handoff changes in this submission; preserve the
package README and Suggested.lean, including all predecessors' substantive repairs.

The binding issue instruction is: **“Change no packet; if the plan has a
mistake, describe it in the handoff note.”** Completing the package requires
repairing contracts beyond those permitted deliverables. The blocker is not
waiting for Lean implementations or insufficient runtime. PROTOCOL.md §§3,
15 and 20 and WORKERS.md's tier rules require a specified proof route and a
single permitted owner; a package cannot replace a missing theorem with a
carrier or silently certify the provisional moves below.

WORKERS.md permits moving a required higher-tier result down into the package
and recording the move here. That authorization is already in force; moving
ownership does not require permission. The substantive blocker is the missing
specified proof chain for the moved results and the full-local prescription
theorem. Merely leaving the higher packets unchanged is not, by itself, a
reason to stop package work.

The decisive checks are:

1. `R17.5/finite-hecke-extension` extends a character on the quotient of
   **n-torsion ideles**. It does not prescribe a character on a full local
   multiplicative group, including its uniformizer. The accepted plan's
   **Local–global extension of characters (Chevalley's congruence theorem for
   S-units)** gap still names `R17.5/tunnell-primitive-globalization` and
   `R17.5/prescribed-local-induction` as consumers. These are actual source-proof
   inputs, not merely unavailable Lean types. Patrikis, *Variations on a theme
   of Grothendieck*, Lemma 2.3.6, printed pp. 30–31 (PDF pp. 34–35), was
   checked directly: its input is exactly this torsion quotient. A
   uniformizer lies outside the local torsion subgroup; the package's proved
   `unramifiedQuadraticTwo` test is trivial on torsion but takes value −1
   on 2. Torsion restrictions cannot determine the required full-local twist.
2. The higher `PotentialModularityAndCompatibleSystems:R23.1/cht-character-extension`
   has the needed full-local finite-character conclusion, but its request to
   ClassFieldTheory Layer 12 is still `open` and explicitly requires the S-unit
   congruence argument. Its tier is 22; GL2 is tier 15. ClassFieldTheory §1
   excludes prescribed local abelian extensions, and its Layer 12 norm-index
   and Kummer targets do not state this prescription theorem. GlobalNumberFields
   Layers 9–10 provide carriers, factorization and infinity-type interfaces,
   rather than the missing finite-component existence theorem.
3. Reading the current library's statements confirms the same distinction:
   `HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter`,
   `exists_modulus_finitePart_eq_one`, `exists_modulus_finiteComponent_eq_one`
   and `exists_modulus_embeddingCharacter_eq_one` all take an existing global
   Hecke character. `unitsCongruenceSubgroup_finiteIndex` takes a modulus and
   proves a finite-index subgroup of integer units. None of these five
   statements takes arbitrary prescribed local characters, or an arbitrary
   finite-index S-unit subgroup and constructs a modulus away from S. This is
   a scoped statement check, not an absence audit of the entire newer library.
4. The accepted GL2 plan still has exactly four upward R19 prerequisites:

   | Consumer | Higher prerequisite |
   | --- | --- |
   | `R17.6/rt-technical-lemma` | `R19.4/conductor-and-local-factors-classical` |
   | `R17.6/rt-technical-lemma` | `R19.1/weight-one-artin-representation` |
   | `R17.6/rt-technical-lemma` | `R19.1/lambda-adic-representation-of-a-weight-k-eigenform` |
   | `R17.6/weight-two-witness` | `R19.1/lambda-adic-representation-of-a-weight-k-eigenform` |

   These R19 targets belong to AutomorphicGaloisRepresentations at tier 18.
   The package's three provisional local attachment targets remain proof-route
   proposals, not completed ownership moves.

**Resume gate for the manager:** reconcile the character theorem with one
owner at GL2's tier or below; install its congruence, finite-quotient and
CM infinity-type proof inputs; update the two GL2 consumers and the higher
CHT consumer. Install the three classical attachment/conductor proof chains
and reconcile the higher R19 consumers. The exact affected files and inherited
proof obligations are preserved below. Queue the package continuation after
these mathematical repairs; repeated package-only checks cannot perform them.
This is a routing recommendation, not a change to queue files or issue labels.

## New repair lead: lift the solvable linear image, not just its projectivization

The accepted `R17.6/odd-residual-lift` target asks for a characteristic-zero,
finite-image, absolutely irreducible and totally odd lift of an absolutely
irreducible two-dimensional residual representation with solvable image,
at a prime p > 2. Its existing projective-lifting route leaves compatibility
with reduction unproved. Fong–Swan is a possible replacement proof route for
this target; it is not an installed supplier or a reason to mark the gap closed.

**Statement checked.** Peter Webb, *A Course in Finite Group Representation
Theory*, author manuscript dated 23 February 2016, §9.4, Theorem 9.4.12,
printed p. 156, states the following lifting result, credited to Fong, Swan and
Rukolaine: over a splitting p-modular system (K, R, k), a simple k[Γ]-module
for a finite p-solvable group Γ is the reduction of an R[Γ]-lattice. Here R is
a discrete valuation ring, K its characteristic-zero fraction field and k its
residue field. This is an actual lattice with the required reduction, rather
than an equality of virtual classes. The manuscript explicitly gives no proof
of this theorem and refers to Curtis–Reiner, *Methods of Representation
Theory*, Vol. I, Theorem 22.1. That book is not among the cleared sources and
was not read. The prime-to-p special case is proved in Webb's Theorem 9.4.11,
pp. 155–156; it does not cover the wild cases.

**Proposed arithmetic deduction, conditional on that lattice theorem.**

1. Take Γ to be the finite **linear** image of the residual representation.
   Solvability implies p-solvability by refining a solvable series. Extend the
   finite coefficient field to a splitting field and choose a splitting
   p-modular system. Absolute irreducibility supplies a simple k[Γ]-module V
   of dimension two. A faithful Γ-action is already part of this input;
   projecting to PGL₂ discards information which is needed for reduction.
2. Obtain a Γ-stable free rank-two R-lattice L with an equivariant
   isomorphism L/𝔪L ≅ V. Inflate its characteristic-zero action along the
   original finite quotient of the absolute Galois group. This gives a
   continuous finite-image lift. The conclusion must include the displayed
   reduction isomorphism; a statement about characters alone would need the
   Brauer-character-to-module comparison as an additional proof input.
3. The characteristic-zero representation is absolutely irreducible: after
   a finite coefficient extension, intersect any invariant line with L.
   This is a saturated rank-one sublattice whose reduction is a nonzero
   proper invariant subspace of V, a contradiction. State the saturation and
   reduction argument explicitly, including preservation after coefficient
   extension.
4. At a real place, the image of complex conjugation is an involution.
   Its characteristic-zero determinant is ±1, and its reduction is −1.
   Since p > 2 these values remain distinct, so the determinant is −1.
   This proves total oddness without prescribing a projective section or
   correcting the lift by an unspecified scalar character.
5. The target asks for a number field E, a prime λ above p, and an integral
   realization. Choose the splitting p-modular system algebraically at the
   start, with K = E and R = (𝓞_E) localized at λ, instead of starting over
   an arbitrary p-adic field and assuming its lattice basis has algebraic
   coefficients. A sufficiently large cyclotomic E supplies a splitting
   field for Γ; enlarge it if necessary to embed the original residual
   coefficient field into its residue field. The required interfaces are
   existence of this splitting system, its residue embedding and its
   compatibility with scalar extension of V. Apply the lattice theorem over
   that system to obtain the target's integral model directly. This is a
   proposed arithmetic specialization, not a verified supplier contract.
   This route claims no preservation of the conductor.

**Ownership and tests needed before adoption.** The current upstream
`RepresentationTheory/ModularInduction` roadmap concerns exact G₀ and modular
Artin induction; its scope excludes Brauer characters and the decomposition
map. Its `modularArtin_exists_nsmul_mem_indCyclicCoprime` conclusion is a
statement about a positive multiple of a class and does not give this simple
lattice lift. The representation-family index and a scoped name search in
the current roadmaps and library found no Fong–Swan supplier. Those checks
are not a comprehensive library absence audit. Route the general finite-group
lattice theorem and its proof to a single lower-tier representation-theory
extension, with the Galois inflation and oddness deduction kept at GL2. Do
not duplicate the existing exact G₀, character or induction carriers.

The repaired supplier should distinguish: a prime-to-p example such as the
standard S₃ representation at p = 5; the natural absolutely irreducible
two-dimensional representation of GL₂(𝔽₃) at p = 3, where p divides the group
order; and the determinant of an involution with residual eigenvalues 1 and
−1 at an odd prime. In the second case a projective cover cannot substitute
for the rank-two lift: its dimension is divisible by 3. The third case must
retain p > 2, since reduction at 2 does not distinguish ±1. These are proposed
source-level tests, not newly elaborated Lean declarations.

This may remove the need for the reduction-compatible projective lift in the
existing proof of `odd-residual-lift`. It does not resolve the character
prescription, attachment/conductor or other recorded gaps. Before adopting
it, read a cleared or freely accessible proof of Fong–Swan, specify the
algebraic splitting-system interfaces, and reconcile the accepted target and its
single supplier. The package issue forbids editing those packets.

## Validation in this session

- Both accepted GL2 packets pass `scripts/check_blueprint.py`: zero errors
  and zero warnings. The R16.1 part has 55 nodes, eight gaps and 32 requests;
  the R17.3 part has 57 nodes, eight gaps and 35 requests. All twelve stages
  are `planned`, none `closed`. A passing structural checker does not remove
  their recorded mathematical gaps.
- `lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`
  exits successfully: 144 warnings, all `declaration uses sorry`, no errors
  and no other warnings. Available memory before the check was 103 GB. The
  shared checker used the atlas pins, Mathlib `082e2d3` and Tau Ceti `f790474`.
  No build or Lake command ran in either current read-only source tree.
- The twelve GL2 entries of the reviewed `AUDIT-14` library audit were read.
  These historical audit entries are distinct from the current statement
  checks above.
- Current read-only revisions: TauCetiRoadmap
  `48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688`; Tau Ceti
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- This session read the current GlobalNumberFields and
  RepresentationTheory/ModularInduction roadmaps in full, the representation
  family index, and the relevant ClassFieldTheory exclusion and character
  signatures. The reviewed AUDIT-14 entries and five current library
  statements listed above were checked independently of the pinned build.
- New source receipt: Webb's author manuscript, dated 23 February 2016,
  §9.4, pp. 150–156, and §10.2, pp. 176–179, read 2026-10-10 from the
  [author's PDF](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf).
  SHA-256: `3053d04310d379844d0ccac2ae078124492730a116e63343014d276169fb4c24`.
  The receipt verifies the lifting statement, the proved prime-to-p special
  case and the Brauer-character comparison. It does **not** certify that the
  Fong–Swan proof was read or that its supplier plan exists.
- Preserved preceding-session primary-source receipt: Patrikis, *Variations on a theme of
  Grothendieck*, revision dated 31 July 2016, Lemma 2.3.6 and its proof,
  printed pp. 30–31 (PDF pp. 34–35), read 2026-10-10 from the
  [author's PDF](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf).
  SHA-256: `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81`,
  matching the accepted packet's source version. This receipt verifies the
  torsion-domain contract, not the proposed Chevalley supplier proof. Other
  source receipts and proof proposals below remain attributed to their
  earlier sessions.
- `metadata.toml` is still absent; `issues.deliverables_complete` is false.
  This is a checkpoint and is not ready for package review. Adding the
  metadata alone would make the existence-based package intake mark all
  deliverables complete without repairing these mathematical contracts.
- Scoped intake file/scope checks and `git diff --check` pass. The only
  changed repository file is this job's handoff; no source passage or private
  path is included. No Lean process remains running.

The accepted-plan fingerprints remain:

| File | SHA-256 |
| --- | --- |
| R16.1 plan | `c1e3b586b2534254b10be3884e88b4c33a3dd6e8e2068f2dc809757bca89ebce` |
| R17.3 plan | `2fcb2c938001426f0c1019d99a2bd9ba47cf82ec91ab2ad5305ef7b896301b65` |

## Preserved preceding handoff

Everything below is the preceding session's handoff, retained to keep its
mathematical repairs, source receipts and resume instructions available. Its
first-person checks belong to that session, not this continuation.

### Preceding blocked checkpoint

Worker: Codex (GPT-6), session `codex-ycig9K`. Issue: #7901.
Date: 2026-10-10. Branch: `codex-ycig9K-gl2-package`.
Status: **partial; the accepted supplier/consumer contracts need repair outside
this package job's permitted deliverables**.
[Bot claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6095751653).
Only this job was claimed. None of the manager's priority issues appeared in
the open `swarm`, `state:available` list. There was no eligible available
`top` job or focus plan/package review, so this focus package came next under
WORKERS.md.

## Outcome and resumption gate

This continuation independently checked the inherited blockers against the
accepted plans and current upstream source trees, reread the primary
character-extension and congruence sources, and added proved finite-group
order tests. The accepted plans and current source revisions are unchanged
from the preceding checkpoint. Completion is blocked by unresolved
mathematical inputs and ownership contracts, rather than the run's time limit
or a need to wait for Lean implementations.

The issue says: **“Change no packet; if the plan has a mistake, describe it in
the handoff note.”** Its only authorized repository outputs are the package
README, Suggested.lean, metadata and this handoff. WORKERS.md requires lower-tier
ownership, and PROTOCOL.md §§3, 15 and 20 require exact supplier contracts,
one owner per result and a package supported by the accepted plan. Renaming a
package citation alone would leave the accepted higher owner and consumer
contracts inconsistent. No accepted plan or other roadmap was edited.

Before another package continuation, reconcile the general character theorem
with one owner at GL2's tier or below, update its consumers and supplier proof
inputs, and repair the four upward R19 prerequisites. Then resolve the other
inherited closure requirements listed below. The historical proof proposals
are continuation material, not installed lower-owner contracts.

## New proved character-order checks

The finite-quotient step in the proposed full-local character construction
extends a character of a subgroup of a finite abelian group. It must allow
increased order. The package now includes a worked test on the existing
Mathlib carrier `AddChar (ZMod 4) ℂ`, beside the full-local domain tests:

- `quarticCharacter` sends a to i^a and is proved additive-to-multiplicative
  by checking all sixteen pairs. It sends 2 to −1 and has fourth power one.
- Its restriction to {0,2} has square one: for any character χ, the equation
  a+a=0 implies χ(a)²=1. Since its value at 2 is −1, the restriction is
  nontrivial and quadratic.
- `characterExtensionOrder_square_ne_one` proves that **every** character
  sending 2 to −1 has square different from one: χ(1)²=χ(2)=−1. This proves
  that the quadratic character has a quartic extension but no extension
  whose order divides two.

All five new examples, the character definition and the obstruction lemma
have complete proofs with no `sorry`. This is an algebraic regression check
for the finite-quotient construction, not a new arithmetic supplier or a
Grunwald–Wang counterexample. The README states the example and its limit in
the Tunnell consumer's order test. Introductory prose was shortened to keep
the document under 200,000 bytes; no target or source locator was removed.

## Fresh contract checks

The following are direct statement reads, not a comprehensive absence audit of
the newer library.

| Contract | Result of this run's check |
| --- | --- |
| `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension` | Its input is a character of the quotient of **n-torsion ideles**, with a complex-place condition. It does not prescribe characters on full local multiplicative groups, including their uniformizers. |
| `R17.5/tunnell-primitive-globalization` and `R17.5/prescribed-local-induction` | Their statements and proof steps require full-local character extension. The accepted R17.3 plan retains the corresponding local–global character gap. The CM construction also needs its infinity-type existence and compatibility. |
| `PotentialModularityAndCompatibleSystems:R23.1/cht-character-extension` | It states full-local finite-order extension, allowing increased order and a p-primary refinement. Its ClassFieldTheory Layer 12 request remains **open** and includes the S-unit congruence input. Its tier-22 ownership cannot be imported into tier-15 GL2. |
| Current `ClassFieldTheory` README, §1 and Layer 12; Suggested.lean's global-existence inputs | The roadmap explicitly excludes prescribed local abelian extensions and Grunwald–Wang. The global-existence inputs concern norm subgroups; they do not state the missing arbitrary-local-character prescription theorem. |
| Current `GlobalNumberFields` README, Layers 9–10, and the character/infinity-type signatures in Suggested.lean | These provide character carriers, ray-class factorization and infinity-type comparisons. They do not supply the full finite-component prescription contract. |
| `HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter` | Starts with an existing global Hecke character and identifies its ray-class factorization. It does not construct one from local data. |
| `HeckeCharacter.exists_modulus_finitePart_eq_one` and `HeckeCharacter.exists_modulus_finiteComponent_eq_one` | Start with an existing global character and find congruence depths it kills. Their conclusion does not prescribe full local components. |
| `HeckeCharacter.exists_modulus_embeddingCharacter_eq_one` | Requires an existing Hecke character and a matching infinity type. It does not construct either. |
| `unitsCongruenceSubgroup_finiteIndex` | Starts with a supplied modulus and yields a finite-index integer-unit subgroup. The missing Chevalley input starts with an arbitrary finite-index S-unit subgroup and constructs a congruence modulus away from specified places. These directions and domains differ. |

The five current library declarations above were read in
`TauCeti/NumberTheory/NumberField/Global/`: `HeckeCharacter/FiniteOrder.lean`
(line 80), `HeckeCharacter/FiniteComponent.lean` (lines 127 and 150),
`HeckeCharacter/UnitCompatibility.lean` (line 144), and
`RayClass/Finite.lean` (line 82). These checks use the newer library revision
below; they are separate from elaboration at the atlas pins.

The four upward edges were independently enumerated from the accepted R17.3
plan. `upstream/CaraianiNewton.md` places GL2 at tier 15,
AutomorphicGaloisRepresentations at tier 18 and
PotentialModularityAndCompatibleSystems at tier 22.

| Consumer | Higher-tier prerequisite still present |
| --- | --- |
| `R17.6/rt-technical-lemma` | `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical` |
| `R17.6/rt-technical-lemma` | `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation` |
| `R17.6/rt-technical-lemma` | `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform` |
| `R17.6/weight-two-witness` | `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform` |

## Repair routing

The following paths are relative to `research/blueprint/` and outside this
job's permitted edit set. This list records where repairs are needed; it does
not authorize edits by a package worker.

- `packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json`: reconcile
  the two R17.5 character consumers with a full-local lower owner, and the two
  R17.6 attachment consumers with the three classical lower targets described
  in the inherited notes below.
- `packets/PotentialModularityAndCompatibleSystems--R23.1.json`: reconcile
  `R23.1/cht-character-extension` and its open ClassFieldTheory request with
  that same owner; retain increased order, auxiliary ramification and the
  p-primary refinement. Preserve the separate CM infinity-type requirements.
- `packets/AutomorphicGaloisRepresentations.json`: reconcile R19.1 attachment
  and R19.4 conductor ownership with the lower classical targets. Their proof
  inputs must include eigenprojectors, symmetric powers, coefficient descent
  and integral ramified comparison; a cohomological carrier alone is not that
  bridge.
- The affected reader and suggested files: expose the corrected mathematical
  interfaces and proof chains along with the dependency changes.

The same general congruence input is used by the PA.2 determinant application
and the Shimura CM norm-kernel need identified in the inherited routing notes.
Reconcile them with the single general owner instead of adding competing
special-purpose suppliers.

## Validation and preserved work

- Both `python3 scripts/check_blueprint.py` checks passed with **zero errors
  and warnings**. R16.1 has 55 nodes, eight gaps and 32 requests; R17.3 has
  57 nodes, eight gaps and 35 requests. All twelve stages are `planned`, none
  `closed`. These passing structural checks do not establish proof closure.
- `lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`
  elaborated without errors: **144 warnings, all `declaration uses sorry`,
  zero other warnings**. Available memory before compilation was 112 GB. The
  check used the shared pinned build, Tau Ceti `f790474` and Mathlib `082e2d3`.
  No Lake command ran in either read-only current checkout.
- The twelve reviewed AUDIT-14 layer entries in `data/library-coverage.json`
  were read. Their historical absence claims are not an audit of the newer
  library; the current checks above are explicitly scoped to the statements
  inspected.
- Current read-only source revisions: TauCetiRoadmap
  `201bcaee1f4014c91897d50cdb7631fc6d6a6d71`; Tau Ceti
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both match the preceding checkpoint.
- This run changes the README, Suggested.lean and handoff. The accepted plans
  retain their fingerprints below. README is 199,996 bytes; Suggested.lean
  is 85,813 bytes. Preserve the corrected matrix K₀/K₁ and Whittaker/newvector
  interfaces, Hilbert tensor action, projective lifts, newform carrier,
  GL₂(𝔽₃) section and proved character-domain/order tests. The assembled suggested
  input is stale; do not regenerate the package from it.
- `metadata.toml` remains absent and `issues.deliverables_complete` remains
  **False**, so this submission is a checkpoint. Add `topic = "math.NT"`
  when the mathematical package is ready for its independent review.
- Scoped intake `check-files` and `git diff --check` pass. The intake scope
  check finds no automatic refusal for this package checkpoint. No source
  file, source passage or private path is committed; no process remains running.
- This run reread CHT Lemma 4.1.1 and its proof, printed p. 116, and Chevalley's
  Theorem 1 and primary proof, Part I §§1–5, printed pp. 36–39. CHT's printed
  conclusion does not explicitly require finite order; the finite-quotient
  proof obligation in the inherited proposal retains that requirement.
  Other historical source receipts were not refreshed. No ownership move,
  accepted-plan repair or certification of the remaining proof chains was made.

| Current file | SHA-256 |
| --- | --- |
| Accepted R16.1 plan | `c1e3b586b2534254b10be3884e88b4c33a3dd6e8e2068f2dc809757bca89ebce` |
| Accepted R17.3 plan | `2fcb2c938001426f0c1019d99a2bd9ba47cf82ec91ab2ad5305ef7b896301b65` |
| Package README | `e77a1f6462d89f5394ba96057a92f50d013a08a1a62d3eaec56391b52a846889` |
| Package Suggested.lean | `fe71b7a221f388f86e45d87f75a93001710b4182c6e50f661062b6de45a78113` |

The following sections preserve predecessors' source receipts, corrected proof
proposals, outstanding closure requirements and resume instructions.

## Historical source receipts

These receipts identify predecessors' readings. This run reread CHT
Lemma 4.1.1 and Chevalley's primary proof at the locations stated above and
verified their PDF fingerprints. The other receipts remain historical; no
complete supplier proof chain is certified by this table.

| Source | Locations inspected by predecessors | SHA-256 |
| --- | --- | --- |
| [Clozel–Harris–Taylor, published PMIHES 108 (2008)](https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf) | Lemma 4.1.1 and proof, printed p. 116; Lemma 4.1.2 and proof, p. 117. Read by codex-uaDzfI; its printed extension statement does not explicitly state finite order, which the higher target derives via a finite quotient. | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| Chevalley, *Deux Théorèmes d'Arithmétique* (1951) | Theorem 1, printed p. 36; proof pp. 36–39, cyclotomic calculation p. 38. | `c8ca4e2dac91b20836adaf90ac5300f7dd197bb8f7145d5c422791d436358493` |
| Patrikis, author revision dated 31 July 2016 | §2.3, Lemmas 2.3.1 and 2.3.6, printed pp. 28, 30–31. | `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81` |
| [Casselman, *On some results of Atkin and Lehner* (1973)](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf) | Printed pp. 302 and 306: subgroup/central-character convention and fixed-level dimension corollary. | `7f91ebae1a8f5e695800f4afb9fc06d0e2ea0b3a476751a31a7c8c3f38ad537d` |
| [Carayol, published Numdam scan](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) | §11.2, printed p. 450 (PDF p. 43). | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` |

## Repair proposal: Chevalley congruences and full local prescription

**Primary proof reread in this run; repair proposal inherited from codex-wTnU0d:** C. Chevalley, *Deux Théorèmes d'Arithmétique*,
J. Math. Soc. Japan **3** (1951), 36–44,
[original publisher PDF](https://www.jstage.jst.go.jp/article/jmath1948/3/1/3_1_36/_pdf/-char/en),
[DOI](https://doi.org/10.2969/jmsj/00310036).
Theorem 1 is on printed p. 36; its proof is in Part I, §§1–5, pp. 36–39,
with a further remark on pp. 39–40. The theorem number is **1**;
plain-text extraction can misread it as 7. The following owner contract and
finite-quotient derivation are inherited repair proposals, not accepted targets
or a claim that their proof chain is closed.

**Congruence contract.** For a number field M, a finitely generated subgroup
E of M×, a finite set S of finite places outside which every element of E is
a unit, and a finite-index subgroup E′ of E, there is a nonzero integral ideal
𝔪 supported outside S such that

`{a ∈ E : a ≡ 1 (mod 𝔪)} ⊆ E′`.

Equivalently, some finite collection of places outside S and positive local
congruence depths cuts out a subgroup contained in E′. Chevalley's Theorem 1
supplies the stronger power-subgroup form: for every n > 0 one may force a
congruent element of E to lie in Eⁿ while avoiding any specified finite set
of rational primes. Take n to be the exponent of E/E′, and exclude all
rational primes below S, to obtain the displayed ideal form. The S-unit
finite-generation input is indispensable; the statement is not about all of
M×. The inherited source audit additionally cites Rapinchuk–Segev,
*Valuation-like maps and the congruence subgroup property*, §4, p. 582
(final paragraph); codex-wTnU0d checked Chevalley’s theorem directly.

**Proof-route correction.** The earlier general-splitting-field shortcut is
withdrawn. Use the corrected prime-power/cyclotomic/Kummer proof obligations
below. The congruence theorem and the following conditional character
construction remain; the shortcut is not an established proof.

**Finite character contract.** Given M, finite S, and continuous finite-order
characters ξᵤ : Mᵤ× → ℂ× for every u ∈ S, there exists a continuous
finite-order Hecke character ξ of M whose full u-component equals ξᵤ.
It may ramify at auxiliary places outside S. It can be chosen trivial on
the full archimedean multiplicative group. No assertion that its order equals
the least common multiple of the prescribed orders is needed or justified.

Here is a construction with the actual subgroup and continuity conditions.
Let E = O_{M,S}× and let E′ be the kernel of a ↦ ∏_{u∈S} ξᵤ(a).
This has finite index, so choose 𝔪 from the congruence contract. Inside the
idele group form the open subgroup

`B = M∞× × ∏_{u∈S} Mᵤ× × ∏_{w∉S} U_w(𝔪)`,

where U_w(𝔪) is the local principal-unit group of the indicated depth at
w dividing 𝔪, and the full unit group otherwise. Set θ(b) = ∏ ξᵤ(bᵤ).
The diagonal intersection B ∩ M× consists exactly of S-units satisfying
the congruences at 𝔪. Hence θ is trivial on it and descends to D, the image
of B in the idele class group C_M. The subgroup H = image(ker θ) is open.
It contains the image of a ray congruence subgroup: choose principal-unit
depths at each u ∈ S on which ξᵤ is trivial and keep the depths at 𝔪.
Consequently C_M/H is finite by ray-class finiteness. The character of the
subgroup D/H extends to the finite abelian group C_M/H because ℂ× is
divisible. Pull it back to C_M. This produces a continuous finite-order
character and gives the desired values on **every** element of each Mᵤ×,
including a uniformizer. The full archimedean factors lie in ker θ, so the
extension is trivial there. This finite quotient construction avoids an
unproved appeal to topological character extension on an arbitrary quotient.

**Single-place quasi-character consequence.** A continuous character
α : Mᵤ× → ℂ× has finite-order restriction to Oᵤ×: its compact image is a
quotient of a profinite group and a closed subgroup of the circle, so is
finite. Choose a uniformizer π and s ∈ ℂ with qᵤ^(−s) = α(π).
Then ν = α |·|ᵤ^(−s) is finite order, since it is trivial on π and has
finite image on units. Extend ν by the finite contract and multiply the
global extension by |·|_A^s. The product formula makes this a Hecke character
with full component α. This is the single-place quasi-character clause
needed for the Tunnell consumer, not an unrestricted simultaneous prescription
of incompatible complex norm exponents at several places.

For the CM consumer, first retain the infinity-type compatibility criterion
of Patrikis, Lemma 2.3.1, printed p. 28. Once an initial character with the
specified infinity type and norm twist is constructed and its selected finite
component is proved finite order, correct the finite-order discrepancy using
the finite contract above. Because that correction is trivial at infinity,
the prescribed infinity type is preserved. The README already exposes the
proof of this last finite-order property at a nonsplit CM place; it cannot be
inferred merely from global type A. The distinction between global angular
type and finite-component order remains binding.

Recommended interface checks for the repaired plan include: S empty gives
the trivial character; prescribed unit and uniformizer evaluations both
hold; and a finite correction trivial at infinity preserves each infinity
component. A sharp domain test is M = ℚ, S = {2}, and the unramified quadratic
character of ℚ₂× taking 2 to −1. It is trivial on all local units, including
torsion, whereas the trivial character takes 2 to 1. A global extension is
the even quadratic Dirichlet character modulo 5 (whose value at 2 is −1).
Thus torsion or unit data alone cannot distinguish the two prescriptions,
and auxiliary ramification really is allowed. Requiring an everywhere
unramified finite global extension would fail in this example.


## Correction to the inherited congruence proof proposal

The full-local finite-character construction in the inherited handoff remains
useful **conditional on the congruence contract**. Its proposed shortcut to
that contract, using derangements for every proper subgroup of an arbitrary
Galois splitting field, is withdrawn. A local root of a reducible binomial
need not belong to the global root orbit whose field is being tested. Roots
chosen at two completions need not generate the same intermediate field.
Consequently the claimed contradiction from a prime with no degree-one place
in one chosen root field does not follow.

A precise regression case is `X⁸ − 16` over ℚ. It has no rational root,
because `8 v₂(y) = 4` would require a nonintegral valuation. Nevertheless it
has a root over every ℚₚ for odd p. The factorization is

`X⁸ − 16 = (X² − 2)(X² + 2)(X² − 2X + 2)(X² + 2X + 2)`.

At least one of 2, −2 and −1 is a square in every odd residue field: if both
2 and −1 were nonsquares, their product −2 would be a square. The first two
quadratics give roots when 2 or −2 is square; the last two have discriminant
−4 and give roots when −1 is square. Every such root is nonzero and is a
simple root of the binomial, so Hensel lifts it. The three possible root fields
are ℚ(√2), ℚ(√−2) and ℚ(i); the example exposes exactly the orbit mismatch.
It does not refute Chevalley's congruence theorem: having a local eighth root
is much weaker than the congruence condition that theorem chooses.

Use the primary proof of Chevalley's **Theorem 1**, printed p. 36, Part I,
pp. 36–39, for a repaired owner contract. The preceding checkpoint read the
proof directly from the
[publisher PDF](https://www.jstage.jst.go.jp/article/jmath1948/3/1/3_1_36/_pdf/-char/en)
on 2026-10-10; SHA-256
`c8ca4e2dac91b20836adaf90ac5300f7dd197bb8f7145d5c422791d436358493`.
The power-subgroup separation has the following proof obligations, which
preserve the roots-of-unity hypothesis that the shortcut lost:

1. For finitely generated E ⊂ M×, its saturation E₀ is contained in an S-unit
   group, is finitely generated, and E₀/E is finite. If d kills that quotient,
   forcing x ∈ E to be an nd-th power in M forces it to be an n-th power in E.
   Reduce the required exponent to its prime-power factors and combine their
   congruence moduli.
2. For exponent pᵉ, first arrange that −1 is a square if p = 2. When it is
   not, work in M(i) with exponent 2^(e+k), where 2ᵏ is the largest order of
   a 2-power root of unity in M(i). If y^(2^(e+k)) ∈ M, let f be the least
   exponent for which y^(2^f) ∈ M. Quadratic conjugation makes its ratio on y
   a primitive 2^f-th root of unity; hence f ≤ k, and the desired 2ᵉ-th root
   lies in M. The increase of exponent is necessary.
3. For odd p, or for p = 2 with i ∈ M, use prime-power radical descent from
   M(μ_{pᵉ}) to M. The initial cyclotomic step has degree prime to p and
   uses a norm/Bézout argument. In each following degree-p step, if
   y^(pᵉ) ∈ M, the conjugation ratio on y lies in μ_p; multiplying y by a
   suitable power of the next cyclotomic generator makes it invariant
   without changing its pᵉ-th power. The degree-two initial exception is
   excluded by i ∈ M. This is a distinct lower contract, not an unconditional
   assertion that radicals descend from every cyclotomic extension.
   The crucial calculation, checked by codex-wTnU0d against Chevalley,
   p. 38, is as follows. At the step from M(μ_{pʰ}) to M(μ_{pʰ⁺¹}), let σ
   generate the degree-p extension and write σ(y)/y = ζ_{pᵉ}ᶠ. Extend σ to
   M(μ_{pᵉ}), with action ζ ↦ ζᵍ. Since g ≡ 1 modulo pʰ and σᵖ(y) = y,
   pᵉ divides f(1 + g + ⋯ + g^{p−1}). This sum is p modulo p²: h ≥ 1
   suffices for odd p, and h ≥ 2 is needed for p = 2. Hence p^{e−1}
   divides f, giving the asserted μ_p ratio. The ratio σ(ζ_{pʰ⁺¹})/ζ_{pʰ⁺¹}
   generates μ_p, so a power of this cyclotomic root cancels the ratio;
   its pᵉ-th power is one. This verifies the descent step's algebra and
   explains the i ∈ M hypothesis. It does not install the lower owner API.
4. Over a field containing μ_{pᵉ}, adjoining the pᵉ-th roots of finitely
   many generators of E gives a finite **abelian p-extension** L/M.
   For each degree-p intermediate field choose, by Chebotarev, an inert
   finite prime unramified in L and away from the excluded rational primes and p.
   Choose a
   rational modulus divisible by the primes below these chosen primes.
   If x ∈ E is congruent to 1 modulo this modulus, Hensel gives a local
   pᵉ-th root at every chosen prime. Here all roots differ by multiplication
   by an element of μ_{pᵉ} ⊂ M, so their fields coincide: the root field is a Galois p-extension
   inside L and has a degree-one place at each chosen prime. A nontrivial
   root field would contain a degree-p subfield, contradicting the prime
   chosen inert there. This proves root existence in M.

These are proposed proof inputs for the owner's repaired plan, not new package
targets or claims of completed closure. The historical source-audit session read the primary proof,
checked the specific cyclotomic calculation and rechecked the conditional
finite-quotient character construction. The lower contracts and their supplier
edges still need to be installed in the owning plan. No finding against the
published source is asserted; the withdrawn argument was the inherited
handoff's own restatement. The corrected route avoids relying on the
alternative remark.


## Shared-owner routing lead

The same general congruence theorem is also used in
`PotentialAutomorphyInfrastructure:PA.2/determinant-neat-level-shrinking`,
whose source is Allen et al., Lemma 5.4.15, pp. 1019–1020, and in the
`ShimuraVarieties--V0` packet's **CM norm-kernel inputs** gap (Milne's
Lemma 3.6). The former node only states its application to ordinary integer
units and level shrinking; the latter records a proposed ClassFieldTheory,
Part II supplier. Neither is the full S-unit character-prescription contract.
The maintainer should reconcile these leads, the existing higher
`R23.1/cht-character-extension` target and the earlier proposed
GlobalNumberFields extension into **one** lower-tier general owner, preserving
the finite set of primes to avoid. Do not cite the determinant application as if it
already supplied arbitrary finitely generated multiplicative subgroups.

Then add the finite-character consequence, the one-place quasi-character
consequence, and the CM infinity-type compatibility contract described above;
repair both R17.5 consumers' exact prerequisites. The other inherited closure
requirements remain and must be handled separately. No ownership change or downward move has been installed.


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
| R17: highly ramified GL₃ converse | The generic AL.3 reduced-rank converse is not the needed highly ramified T variant. [Gelbart–Jacquet §9.1–9.2, pp. 531–534](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf) was reread in an earlier checkpoint: it uses partial products, trivial central character, attached generic representations, an exponent bound, the highly ramified functional equation and a slowly increasing realization, followed by separate constant-term branches. The omitted T factors contribute cubes of character epsilon factors. Supply this exact contract and its JPSS §13 reconstruction proof chain to AL; twists unramified at S cannot replace it. |
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

The maintainer must relocate/reconcile the existing higher CHT target with
the **prescribed-local-character theorem and proof chain** at GL2 itself or
one lower-tier owner. Reconcile that owner with both consumers and with the
infinity-type compatibility requirements, rather than citing the
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
