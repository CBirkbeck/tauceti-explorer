# PKG-GL2AutomorphicRepresentationsAndTransfer — blocked checkpoint

Worker: Codex (GPT-6), session `codex-eeIy2R`. Issue: #7901.
Date: 2026-10-10. Branch: `codex-eeIy2R-gl2-package`.
Status: **partial; accepted-plan repair outside the permitted deliverables is required**.
[Bot claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6095564131).
Only this job was claimed. None of the manager's priority issues was available;
there was no available top job or eligible focus plan/package review. This focus
package follows WORKERS.md's fallback order.

## Decision and resumption gate

The accepted plans and current library revision are unchanged. Upstream
TauCetiRoadmap has advanced to `201bcaee1f4014c91897d50cdb7631fc6d6a6d71`: its
delta from the preceding checkpoint changes only the
SmoothRepresentationsOfLocalGroups README and Suggested.lean. The inspected
ClassFieldTheory and GlobalNumberFields contracts are unchanged. The package
cannot be completed by editing its four authorized paths. The issue explicitly requires **“Change no packet; if
the plan has a mistake, describe it in the handoff note.”** This run therefore
records the blocker and preserves the mathematical deliverables. It does not
repeat source research as though another reading could install the missing
supplier or move ownership in the accepted plans.

Before another package continuation, repair the accepted supplier/consumer
contracts below, with their reader and suggested interfaces. The allowed
package paths do not include those files. WORKERS.md's bottom-up dependency
rule and PROTOCOL.md §§3, 15 and 20 require exact supplier contracts and one
owner; changing only a package prerequisite label cannot reconcile the plans.

## Independently checked blocking contracts

| Contract read in the current checkout | Why it does not finish this package |
| --- | --- |
| `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension` in `packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json` | Its domain is the quotient of **n-torsion ideles**, with a complex-place condition. It does not prescribe characters on full local multiplicative groups, including their uniformizers. |
| `R17.5/tunnell-primitive-globalization` and `R17.5/prescribed-local-induction` in that same accepted packet | Their statements explicitly need the full-local character-extension input. The packet itself records that missing theorem in its local–global character gap. The CM induction target additionally needs existence and compatibility of its infinity type. |
| `PotentialModularityAndCompatibleSystems:R23.1/cht-character-extension` in `packets/PotentialModularityAndCompatibleSystems--R23.1.json` | This accepted target does state full-local finite-order extension, permitting auxiliary ramification and increased order. It has an **open** CFT Layer 12 request for the congruence/S-unit and finite-ray-quotient proof inputs. It is in **tier 22**, while GL2 is in **tier 15**, so importing it as currently owned would create an upward dependency. |
| Current `ClassFieldTheory` README, §1, explicit scope exclusions | Prescribed local abelian extensions and Grunwald–Wang are excluded. Global existence is not itself the arbitrary-local-character prescription contract. No change to this upstream roadmap is made here. |
| `HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter` | Starts with an existing global Hecke character and identifies its ray-class factorization. It does not construct one from local data. |
| `HeckeCharacter.exists_modulus_finitePart_eq_one` and `HeckeCharacter.exists_modulus_finiteComponent_eq_one` | Also start with an existing global character and find congruence depths it kills. They do not prescribe its full local components. |
| `HeckeCharacter.exists_modulus_embeddingCharacter_eq_one` | Requires an existing Hecke character and a matching infinity type. It does not establish their existence. |
| `unitsCongruenceSubgroup_finiteIndex` | A supplied modulus gives a finite-index integer-unit subgroup. The missing Chevalley contract starts with an arbitrary finite-index S-unit subgroup and constructs a modulus supported away from the specified places. The directions and domains differ. |

These are direct statement checks, not an exhaustive audit of the current
library. The twelve reviewed AUDIT-14 entries were consulted; their historical
absence claims are not claims about the newer source checkout. The inherited
Suggested.lean's omission blocks and its proved ℚ₂ character tests agree with
the domain distinction above. They are not signatures of the missing theorems.

The four upward edges were enumerated directly from R17.3. The tier order is
`upstream/CaraianiNewton.md`: GL2 tier 15, AutomorphicGaloisRepresentations
tier 18, PotentialModularityAndCompatibleSystems tier 22.

| Consumer | Current higher-tier prerequisite |
| --- | --- |
| `R17.6/rt-technical-lemma` | `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical` |
| `R17.6/rt-technical-lemma` | `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation` |
| `R17.6/rt-technical-lemma` | `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform` |
| `R17.6/weight-two-witness` | `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform` |

## This run's resumption audit

This checkpoint is caused by a verified plan boundary, not the run's time
limit. The package's four permitted paths cannot change an accepted node's
prerequisites, relocate a higher roadmap's declaration or supply its missing
proof inputs. The issue's packet-edit restriction remains in force.

Fresh statement reads distinguish the two character theorems:
`R17.5/finite-hecke-extension` prescribes a character only on n-torsion
ideles, whereas both `tunnell-primitive-globalization` and
`prescribed-local-induction` require full local multiplicative groups.
The higher `R23.1/cht-character-extension` supplies the intended theorem
statement but retains an open ClassFieldTheory Layer 12 request for the
S-unit congruence argument. ClassFieldTheory's explicit scope exclusion
still rules out treating global existence as this prescription theorem.
The current library statements in `HeckeCharacter/FiniteOrder.lean` (line 80),
`FiniteComponent.lean` (lines 127 and 150), `UnitCompatibility.lean` (line 144)
and `RayClass/Finite.lean` (line 82), under
`TauCeti/NumberTheory/NumberField/Global/`, all start with an existing
character or a supplied modulus. They do not construct a character with
specified full local components.

The accepted packets and package fingerprints below are identical to the
preceding checkpoint. All four R19 prerequisites were independently
enumerated again. Their tier-18 ownership remains incompatible with this
tier-15 package. The reviewed AUDIT-14 records were read for all twelve
layers; their historical absence claims are not a substitute for the current
source checks.

For a useful next continuation, first install the lower owner and update the
consumer/supplier interfaces in the accepted plans. Relevant files outside
this job's permitted edit set are:

- `packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json`: the two
  R17.5 character consumers and the two R17.6 Galois-attachment consumers.
- `packets/PotentialModularityAndCompatibleSystems--R23.1.json`: reconcile
  `R23.1/cht-character-extension` and its open ClassFieldTheory request with
  that same lower owner; preserve the p-primary refinement.
- `packets/AutomorphicGaloisRepresentations.json`: reconcile the R19.1
  attachment and R19.4 conductor ownership with the three classical lower
  targets already specified in the package.
- Each affected plan's reader and suggested files: expose the corrected
  interfaces and proof inputs, rather than updating JSON edges alone.

These paths are relative to `research/blueprint/`. This list is a repair
routing note, not authorization to edit them in a package job. A changed
upstream revision alone is insufficient to resume: confirm that an exact
supplier now covers the missing contract, then resolve the other inherited
closure requirements below. None of those requirements was erased or
certified closed in this run.

## Required repair scope

1. Reconcile the existing higher CHT character target with **one** owner in
   GL2 or below tier 15. Preserve the full local domain, finite-image output,
   auxiliary ramification, increased-order allowance and p-primary refinement.
   Supply the finitely generated multiplicative-subgroup/S-unit congruence
   theorem, including the finite set of primes to avoid. Reconcile the PA.2
   determinant application and Shimura CM norm-kernel need with this same
   owner. The corrected proof proposals below are continuation material.
2. Repair both R17.5 consumers' prerequisites and the corresponding higher
   R23.1/R23.2 requests and interfaces. Keep the single-place quasi-character
   consequence and CM infinity-type existence/compatibility explicit; the
   finite-order theorem alone does not supply the latter.
3. Reconcile the four R19 edges with the three provisional lower classical
   attachment/conductor targets already named in the package README. Attach
   their eigenprojector, symmetric-power, coefficient-descent and integral
   ramified comparison proof inputs; update the higher consumers to import
   the lower owner. A README-only rename is not an ownership move.
4. Resolve the other inherited closure requirements listed below against
   exact supplier contracts. Fixing the character theorem alone is insufficient.

No ownership move, supplier insertion or accepted-plan edit was performed.

## Fresh validation and preserved deliverables

- Both `check_blueprint.py` checks exit 0 with **zero errors and warnings**.
  R16.1: 55 nodes, eight gaps, 32 requests; R17.3: 57 nodes, eight gaps,
  35 requests. All twelve stages are `planned`, none `closed`. A `complete`
  planning pass under §0 does not establish mathematical closure.
- `lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`
  exits **0**: zero errors, 144 warnings, all `declaration uses sorry`, zero
  other warnings. Available memory before compilation was 112 GB. The check
  finished in the shared pinned build (Tau Ceti `f790474`, Mathlib `082e2d3`);
  no Lake command ran in the read-only current checkouts. Compilation verifies
  the inherited partial signatures, not its omitted theorem interfaces.
- Current source revisions checked: TauCetiRoadmap
  `201bcaee1f4014c91897d50cdb7631fc6d6a6d71`; Tau Ceti
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Only the upstream roadmap revision
  changed; its two changed files do not repair the character or attachment
  contracts.
- Only this handoff changes. README remains 199,985 bytes; Suggested.lean
  remains 83,998 bytes. Preserve the matrix K₀/K₁ interfaces, newvector and
  Whittaker repairs, Hilbert tensor action, projective lifts, existing newform
  carrier, GL₂(𝔽₃) section and proved character-domain tests. The assembled
  suggested input is stale; do not regenerate the package from it.
- `metadata.toml` remains absent, and `issues.deliverables_complete` is
  **False**. Add `topic = "math.NT"` after the mathematics and faithful
  interfaces are complete; file existence otherwise marks the package complete.
- Scoped intake `check-files` and `git diff --check` pass. No private path,
  source file or source passage is committed. Nothing is left running.

Unchanged SHA-256 fingerprints:

| Input | SHA-256 |
| --- | --- |
| Accepted R16.1 packet | `c1e3b586b2534254b10be3884e88b4c33a3dd6e8e2068f2dc809757bca89ebce` |
| Accepted R17.3 packet | `2fcb2c938001426f0c1019d99a2bd9ba47cf82ec91ab2ad5305ef7b896301b65` |
| Package README | `8a766d83f115d719f86ec9bd61857eeeef546e914e6fb1ed49ffc62795759d30` |
| Package Suggested.lean | `e0824a42686193cd09bee31e3761d5c9c03d10ff0834d37816658a5b2643236e` |

## Historical source receipts

These receipts identify predecessors' readings; this run did not reread
the papers or certify their complete proof chains.

| Source | Locations inspected by predecessors | SHA-256 |
| --- | --- | --- |
| [Clozel–Harris–Taylor, published PMIHES 108 (2008)](https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf) | Lemma 4.1.1 and proof, printed p. 116; Lemma 4.1.2 and proof, p. 117. Read by codex-uaDzfI; its printed extension statement does not explicitly state finite order, which the higher target derives via a finite quotient. | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| Chevalley, *Deux Théorèmes d'Arithmétique* (1951) | Theorem 1, printed p. 36; proof pp. 36–39, cyclotomic calculation p. 38. | `c8ca4e2dac91b20836adaf90ac5300f7dd197bb8f7145d5c422791d436358493` |
| Patrikis, author revision dated 31 July 2016 | §2.3, Lemmas 2.3.1 and 2.3.6, printed pp. 28, 30–31. | `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81` |
| [Casselman, *On some results of Atkin and Lehner* (1973)](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf) | Printed pp. 302 and 306: subgroup/central-character convention and fixed-level dimension corollary. | `7f91ebae1a8f5e695800f4afb9fc06d0e2ea0b3a476751a31a7c8c3f38ad537d` |
| [Carayol, published Numdam scan](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) | §11.2, printed p. 450 (PDF p. 43). | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` |

## Repair proposal: Chevalley congruences and full local prescription

**Historical source audit (codex-wTnU0d); not reread in this run:** C. Chevalley, *Deux Théorèmes d'Arithmétique*,
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
