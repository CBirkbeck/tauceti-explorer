# PKG-GL2AutomorphicRepresentationsAndTransfer — blocked checkpoint

Issue: #7901. Worker: Codex, session `codex-yQpilr`. Date: 2026-10-10.
Branch: `codex-yQpilr-gl2-package`. Continues checkpoint #8207 and its
inherited package files. Status: **partial; accepted prerequisite plan needs
repair**. This submission changes the handoff only.

The bot confirmed this session's claim in
[comment 6093423303](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6093423303).
The open `swarm` / `state:available` issue list contained none of the manager's
priority numbers; this focus package was selected under the fallback order.
One issue was claimed, and no further job is taken.

## Blocking prerequisite and the permitted scope

The accepted R17.3 input still records the gap **Local–global extension of
characters (Chevalley's congruence theorem for S-units)**. Its consumers are
`R17.5/tunnell-primitive-globalization` and
`R17.5/prescribed-local-induction`. Their listed GlobalNumberFields prerequisites
supply carriers, extraction of local components and ray-class factorization,
not existence with prescribed characters on the full local multiplicative
groups. The separate `R17.5/finite-hecke-extension` has a torsion-idele domain;
it cannot supply uniformizer values.

The current GlobalNumberFields Layers 9–10 and ClassFieldTheory §1 and Layer 12
were checked again. The latter explicitly excludes prescribed local abelian
extensions. Reading `HeckeCharacter.Basic`, `FiniteComponent`, `FiniteOrder`
and `UnitCompatibility` confirms the distinction: the factorization and
compatibility theorems start with a global character already given. They do not
construct one from arbitrary specified finite components. Current read-only
revisions remain TauCetiRoadmap `dea8191cc6047d6142a65872ebce6eeeb841a29b`
and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The issue's full instructions say: **Change no packet; if the plan has a
mistake, describe it in the handoff note.** PROTOCOL.md §20 requires the package
README to claim nothing unsupported by the accepted plan. The owner and
prerequisite repair therefore cannot be made in the authorized deliverables.
This is a scope blocker, not a wait for a library implementation. Do not add
`metadata.toml`: the intake's existence test would classify the package as
complete despite its still missing contracts.

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
pp. 36–39, for a repaired owner contract. Read directly from the
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
targets or claims of completed closure. No finding against the published
source is asserted; the withdrawn argument was the inherited handoff's own
restatement. The corrected route avoids relying on the alternative remark.

## Shared-owner routing lead

The same general congruence theorem is also used in
`PotentialAutomorphyInfrastructure:PA.2/determinant-neat-level-shrinking`,
whose source is Allen et al., Lemma 5.4.15, pp. 1019–1020, and in the
`ShimuraVarieties--V0` packet's **CM norm-kernel inputs** gap (Milne's
Lemma 3.6). The former node only states its application to ordinary integer
units and level shrinking; the latter records a proposed ClassFieldTheory,
Part II supplier. Neither is the full S-unit character-prescription contract.
The maintainer should reconcile these leads and the earlier proposed
GlobalNumberFields extension into **one** general owner, preserving the finite
set of primes to avoid. Do not cite the determinant application as if it
already supplied arbitrary finitely generated multiplicative subgroups.

Then add the finite-character consequence, the one-place quasi-character
consequence, and the CM infinity-type compatibility contract described below;
repair both R17.5 consumers' exact prerequisites. The other inherited closure
requirements remain and must be handled separately. This run makes no
ownership change or downward move.

## Validation in this session

- Both input `scripts/check_blueprint.py` checks: **zero errors and warnings**;
  55/57 nodes, eight gaps each, 32/35 requests, zero closed stages. Accepted
  target-level status alone does not discharge the recorded gaps.
- `lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`:
  **exit 0, 144 warnings, all declaration uses `sorry`, no errors or other
  warnings**. Available memory before the run was 108 GB. Managed pins:
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. No compilation remains running.
- A residue calculation checked simple roots of `X⁸ − 16` at all **167**
  odd primes below 1000. The all-prime argument above supplies the reason;
  this finite computation is a regression check, not its proof.
- The package README and Lean file are unchanged: **199,924** and **79,108**
  bytes respectively. Every inherited signature, test and explicitly named
  omission is preserved. Compilation establishes elaboration only.
- The current GlobalNumberFields and ReductiveGroups READMEs were read in
  full; the relevant ClassFieldTheory scope and GlobalNumberFields suggested
  contracts and the library's character statements were read. The reviewed
  AUDIT-14 layer entries were consulted. No read-only checkout was modified or
  used to run Lake. No private book was needed.

The scoped intake file check and `git diff --check` pass. The output-existence
check still returns **False** for completion. Public source files and scratch
logs are disposable; all resume information is here. The previous handoff
below retains the finite-character construction, CM qualification, remaining
closure inventory and historical source receipts. Its discarded shortcut has
been replaced by a pointer to this correction.

---

# Previous handoff: checkpoint #8207

Issue: #7901. Worker: Codex, session `codex-gJ1wpQ`. Date: 2026-10-10.
Continues merged checkpoints #8068, #8149, #8161, #8174, #8190 and #8196.
Status: **partial; accepted-plan repair required**. This is not a completed
package and must not be sent upstream as one.

The bot confirmed the claim in
[comment 6093150000](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6093150000).
Every issue on the manager's priority list was checked; none was available.
This available focus package was selected under WORKERS.md. Only this job was
claimed. The working branch is `codex-gJ1wpQ-gl2-package`.

## What this run establishes

This run changes the handoff only. It preserves the inherited README, Lean
signatures and tests, and all explicitly named signature omissions. It supplies
an independently checked, publicly readable source and a concrete construction
for the first mathematical blocker, rather than repeating an unsupported
request for a character-extension theorem.

The two consumers are `R17.5/tunnell-primitive-globalization` and
`R17.5/prescribed-local-induction`. The accepted R17.3 packet records their
missing local–global extension theorem as a gap without an owning node.
`R17.5/finite-hecke-extension` instead concerns the torsion-idele quotient;
Patrikis, Lemma 2.3.6, printed pp. 30–31, does not prescribe a character on a
full local multiplicative group. Uniformizer values are missing from that
input. The additional construction below resolves the mathematical source and
proof-route uncertainty; it does **not** assign an owner or change the plan.

Current GlobalNumberFields Layers 9–10 and current Tau Ceti still provide
Hecke-character carriers, local components, infinity types, and ray-class
factorization of an existing character, rather than this simultaneous
prescription theorem. In particular:

- `HeckeCharacter/Basic.lean`, `isFiniteOrder_iff` and
  `ofRayClassCharacter`, start with a character or a ray-class character.
- `HeckeCharacter/FiniteOrder.lean`,
  `isFiniteOrder_iff_exists_rayClassCharacter`, factors a character already
  supplied as input; it does not solve the local prescription problem.
- `HeckeCharacter/FiniteComponent.lean`, `finiteComponent`, extracts an
  existing character's component.
- `HeckeCharacter/UnitCompatibility.lean`,
  `exists_modulus_embeddingCharacter_eq_one` and
  `isOfFinOrder_embeddingCharacter_units`, take an existing global character
  and an agreement hypothesis. They establish necessary compatibility, not
  arbitrary local-component existence.

These files are under Tau Ceti's `NumberTheory/NumberField/Global/` namespace.
The current ClassFieldTheory scope excludes prescribed local abelian
extensions and Grunwald–Wang; its existence and Kummer contracts do not state
the missing result. Searches of the nine newer upstream roadmaps' suggested
files found no contract that supplies it. No existing roadmap is replanned.

The issue requires the accepted plan to be the source of truth and explicitly
says to change no packet and describe plan mistakes in the handoff.
PROTOCOL.md §20 also requires that the README claim nothing unsupported by
that plan. Consequently the package worker cannot declare this absent
prerequisite closed by adding an unaccepted theorem or an invented supplier
citation. The routing/plan repair is the blocking next action; it is not a
wait for library implementation or exhaustion of this run's time.

## Repair proposal: Chevalley congruences and full local prescription

**Source, read directly:** C. Chevalley, *Deux Théorèmes d'Arithmétique*,
J. Math. Soc. Japan **3** (1951), 36–44,
[original publisher PDF](https://www.jstage.jst.go.jp/article/jmath1948/3/1/3_1_36/_pdf/-char/en),
[DOI](https://doi.org/10.2969/jmsj/00310036).
Theorem 1 is on printed p. 36; its proof is in Part I, §§1–5, pp. 36–39,
with the alternative Galois/Chebotarev argument in the following remark,
pp. 39–40. The page image was checked: the theorem number is **1**, although
plain-text extraction misreads it as 7. The following is a proposed owner
contract and our derivation, not a quotation or a source synopsis.

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
M×. Rapinchuk–Segev, *Valuation-like maps and the congruence subgroup
property*, §4, final paragraph on printed p. 582, also records precisely this
finite-index formulation.

**Proof-route correction.** The earlier general-splitting-field shortcut is
withdrawn. Use the prime-power/cyclotomic/Kummer proof obligations in the current
session’s correction above. The congruence theorem and the following conditional
character construction remain; the shortcut is not an established proof.

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
the prescribed infinity type is preserved. This last finite-order property
must be proved in the Carayol construction; it cannot be inferred merely
from the global character having type A. The existing handoff's distinction
between global angular type and finite-component order remains binding.

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

## Required next action and inherited work

The maintainer must route the congruence contract and the finite and
single-place character consequences to one owner compatible with the tier
order, then repair the accepted prerequisites of both consumers. The accepted
gap proposes an extension after GlobalNumberFields Layer 9. That is a
proposed placement, not a citation to an existing target, and no edits to
GlobalNumberFields are made here. A repair must name exact lower contracts
for the proof inputs above and the CM compatibility clause, and reconcile
both consumers with those statements. The full-local contract must remain
separate from the torsion-domain lemma.

Both accepted packets still have eight gaps apiece and zero closed stages.
This proof route addresses one of them only. Preserve and discharge the other
closure requirements and the downward classical-attachment moves listed in
the inherited record below; in particular, do not count signature omissions
as declarations or cite the stale assembled arbitrary-carrier signatures.

`metadata.toml` remains absent because `issues.deliverables_complete` regards
all output files existing as a completed package regardless of the handoff.
Adding only `topic = "math.NT"` would misclassify this partial work.

## This run's validation and reading receipts

`lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`
completed with exit **0**, **144 warnings, all declaration uses `sorry`**,
no errors and no other warnings. Memory available before the check was 108 GB.
The check waited for a shared compilation slot, then elaborated the inherited
file without changes. The managed pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. This is elaboration, not a
formal proof of any target. No Lean check from this run remains running.

Both input packet checks returned **zero errors and warnings**, with 55/57
nodes, eight gaps each, and zero closed stages. The scoped intake file check
and `git diff --check` pass. The unchanged README is **199,924 bytes**.
A direct `issues.deliverables_complete` check returns **False**, confirming
that the checkpoint is not classified as a complete package.

Current read-only TauCetiRoadmap was checked at
`dea8191cc6047d6142a65872ebce6eeeb841a29b`; current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are audit revisions,
separate from the compilation pins. The GlobalNumberFields and ReductiveGroups
READMEs, relevant GlobalNumberFields/ClassFieldTheory contracts, and the
Hecke-character declarations above were read. Neither checkout was modified
or used to run Lake.

Public sources inspected directly on 2026-10-10:

| Source | Locations read | SHA-256 of public PDF |
| --- | --- | --- |
| [Chevalley, 1951 publisher version](https://www.jstage.jst.go.jp/article/jmath1948/3/1/3_1_36/_pdf/-char/en) | Theorem 1, p. 36; Part I §§1–5 and alternative proof remark, pp. 36–40. | `c8ca4e2dac91b20836adaf90ac5300f7dd197bb8f7145d5c422791d436358493` |
| [Rapinchuk–Segev, author-hosted article](https://uva.theopenscholar.com/files/ixqrlw/files/rapinchuk-segev2001_article_valuation-likemapsandthecongru_8.pdf) | §4, final paragraph, p. 582: arbitrary finitely generated multiplicative subgroup and finite-index congruence formulation. | `16c7ac758f17c66cbd91d4a40d7754c8ea70d6f180d3bde8b93b5d9d00edea9f` |
| [Patrikis, author revision of 31 July 2016](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf) | Lemma 2.3.1, p. 28, and Lemma 2.3.6 with proof, pp. 30–31. | `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81` |

No source files or passages are committed. Downloaded public PDFs and logs
are disposable; the URLs, exact locators, proof proposal and remaining work
are recorded here for the next worker. Earlier validation and reading receipts
below belong to the prior run and are preserved as historical evidence.

## Inherited record from checkpoint #8196

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
