# PKG-GL2AutomorphicRepresentationsAndTransfer — blocked checkpoint

Issue: #7901. Worker: Codex (GPT-6), session `codex-r8UoJn`.
Date: 2026-10-10. Branch: `codex-r8UoJn-gl2-package`.
Status: **partial; accepted prerequisite plan needs repair**.

Claim confirmed in [comment 6093869679](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6093869679).
None of the manager's priority issues was available; this focus package was
selected in the WORKERS.md fallback order. One job only.

This handoff consolidates the mathematical resume information from checkpoints
#8068, #8149, #8161, #8174, #8190, #8196, #8207 and #8218. Their full
historical records remain in Git, including the subsequent `codex-SwZskw`
checkpoint. No accepted packet or supplier plan is changed.

## Changes and preserved work

This run adds `quadraticDirichletFive : DirichletCharacter ℂ 5`, obtained by
postcomposing Mathlib's `quadraticChar (ZMod 5)` with the integer-to-complex
ring homomorphism. Six examples prove its zero value, value −1 at 2,
evenness (value 1 at −1), square equal to the trivial character,
nontriviality, and primitivity/conductor 5. The conductor proof uses
`conductor_dvd_level` and `eq_one_iff_conductor_eq_one`; primeness of 5
leaves only conductors 1 and 5, and the evaluation at 2 excludes 1.
All new declarations are proved without `sorry` on the pinned Mathlib.

These checks complement the inherited continuous local character
`unramifiedQuadraticTwo : ContinuousMonoidHom ℚ_[2]ˣ ℂˣ`, χ(x)=(−1)^v₂(x).
Its five proved examples distinguish the uniformizer from integral units and
torsion. The new tests verify the **finite Dirichlet data**, not a Lean proof
of its associated global Hecke character or of full-local prescription.
GlobalNumberFields Layer 9 plans the conductor/parity-compatible
Dirichlet–Hecke dictionary; no such comparison was located in the current
character modules. Through that dictionary the even character gives the
arithmetic extension with auxiliary ramification at 5 described below.
The README now pairs the local and finite arithmetic tests and keeps this
comparison explicit. No new generic character carrier or theorem is planned.

The introductory prose is compressed to accommodate this test within the
200,000-byte limit, preserving owner names and mathematical conventions.
All inherited target headings, API names, tests and named signature omissions remain. Positive repairs preserved:
actual matrix-group K₀/K₁ carriers and local compact/open statements; scalar
factorization of K₀ by integral scalars and K₁; invariant-space comparison
under trivial scalar action; the full finite-sum Iwahori operator and quadratic
relation, repeated-root and determinant-character tests; actual newvector and
Whittaker signatures; full Hilbert tensor/action API; projective obstruction
and finite-projective-lift statements; primitive-newform carrier reuse; and
the explicit GL₂(F₃) section. These are suggested interfaces with placeholder
proofs unless explicitly proved, not claims of implemented automorphic theory.

## First blocking dependency and authorized scope

The accepted `GL2AutomorphicRepresentationsAndTransfer--R17.3.json` still
records **Local–global extension of characters (Chevalley's congruence theorem
for S-units)**. Consumers:
`R17.5/tunnell-primitive-globalization` and
`R17.5/prescribed-local-induction`. The required finite-order theorem prescribes
characters on full local multiplicative groups, including uniformizers, and
allows auxiliary ramification and increased character order. Tunnell also uses
a single-place quasi-character version. Carayol needs compatible CM infinity
types and the stated local finite-order-after-norm-twist condition.

`R17.5/finite-hecke-extension` instead has domain
μ_n(M)\μ_n(𝔸_M). Patrikis, Lemma 2.3.6, pp. 30–31, supplies that torsion-domain
extension, with its complex-place condition and Grunwald–Wang qualification.
It does not prescribe full local components. Agreement on local torsion cannot
supply the missing theorem, as the new actual ℚ₂ example demonstrates.

Current GlobalNumberFields Layers 9–10 supply the canonical character carrier,
local components, ray-class factorization and infinity-type comparisons.
Reading `HeckeCharacter.Basic`, `FiniteComponent`, `FiniteOrder` and
`UnitCompatibility` confirms that `ofRayClassCharacter`,
`isFiniteOrder_iff_exists_rayClassCharacter`,
`exists_modulus_embeddingCharacter_eq_one` and
`isOfFinOrder_embeddingCharacter_units` construct from a ray-class character
or assume the global character already given. None is full-local existence.
ClassFieldTheory §1 explicitly excludes prescribed local abelian extensions
and Grunwald–Wang. Its Layer 12 existence starts from an open idele-class
subgroup; it does not produce the required quotient from the prescribed data.

Read-only audit revisions: TauCetiRoadmap
`8c72a04753b11cab07fa593cc38ceaa7c0515380`; current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The reviewed library audit was
consulted, but its historical carrier absences do not override current code.
The current GlobalNumberFields and ReductiveGroups READMEs were read in full,
and the relevant ClassFieldTheory and character declarations were inspected.
Current upstream and current library are separate from the compilation pins.
This run independently rechecked the accepted gap, both consumer domains,
the current character declarations and the Chevalley/Patrikis primary sources.
The inherited domain and ownership blocker remains.

The issue explicitly says **“Change no packet; if the plan has a mistake,
describe it in the handoff note.”** PROTOCOL.md §§3, 15 and 20 require precise
ownership and dependencies and forbid unsupported package claims. The
maintainer must route the shared arithmetic theorem and repair the accepted
consumer prerequisites. That decision and those packet edits fall outside
this job's four authorized paths. This is a specification/scope blocker,
not a time-limit checkpoint or a wait for supplier implementation.

`metadata.toml` remains absent: `issues.deliverables_complete` classifies this
package as complete if all three output paths exist, regardless of the handoff.
Do not complete it by adding metadata alone. After substantive closure and
complete faithful signatures, its topic is `math.NT`.

## Repair proposal: Chevalley congruences and full local prescription

**Source, read directly:** C. Chevalley, *Deux Théorèmes d'Arithmétique*,
J. Math. Soc. Japan **3** (1951), 36–44,
[original publisher PDF](https://www.jstage.jst.go.jp/article/jmath1948/3/1/3_1_36/_pdf/-char/en),
[DOI](https://doi.org/10.2969/jmsj/00310036).
Theorem 1 is on printed p. 36; its proof is in Part I, §§1–5, pp. 36–39,
with a further remark on pp. 39–40. The theorem number is **1**;
plain-text extraction can misread it as 7. The following is a proposed owner
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
M×. The inherited source audit additionally cites Rapinchuk–Segev,
*Valuation-like maps and the congruence subgroup property*, §4, p. 582
(final paragraph); this session relies on Chevalley directly.

**Proof-route correction.** The earlier general-splitting-field shortcut is
withdrawn. Use the corrected prime-power/cyclotomic/Kummer proof obligations below. The congruence theorem and the following conditional
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
consequence, and the CM infinity-type compatibility contract described above;
repair both R17.5 consumers' exact prerequisites. The other inherited closure
requirements remain and must be handled separately. This run makes no
ownership change or downward move.


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


## Validation and source receipts

- Both accepted input `scripts/check_blueprint.py` checks: exit 0, zero errors
  and warnings; 55/57 nodes, eight gaps each, 32/35 requests, zero closed stages.
  The unchanged packets' accepted status does not discharge their recorded gaps.
- `lean-check research/blueprint/packages/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean`:
  **exit 0; 144 warnings, all declaration uses `sorry`; zero errors or other
  warnings**. Available memory before the final run: 104 GB. The new Dirichlet
  character, its helper lemmas and six tests contain no placeholder proofs.
  Its isolated prototype also passed with zero errors and warnings.
- Managed compilation pins: Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. No compile remains running.
- Scope intake: three files, zero problems. `git diff --check`: clean.
  All **115** inherited target headings are preserved in order. README:
  **199,876 bytes**; Suggested.lean: **83,998 bytes**.
- `issues.deliverables_complete`: **False**, so this remains a checkpoint.
  Only the authorized package README, Lean file and handoff are changed.

The public Chevalley PDF (Part I, §§1–5, printed pp. 36–39) and Patrikis
[author PDF](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf)
(Lemmas 2.3.1 and 2.3.6, printed pp. 28 and 30–31) were read directly
in this session; only disposable scratch held their PDFs and extracted text.
Patrikis SHA-256:
`e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81`.
No private book was needed, no source passage or file is committed, and
neither read-only checkout was modified by this run or
used to run Lake. All prose states contracts and proof obligations in our own
words. No source is claimed to have been reread merely because an inherited
receipt is retained.

Inherited source receipts from earlier checkpoints on 2026-10-10
(not reread in this session):

| Source | Locations inspected | SHA-256 |
| --- | --- | --- |
| [Casselman, *On some results of Atkin and Lehner* (1973)](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf) | Printed pp. 302 and 306, viewed as page images: subgroup/central-character convention and fixed-level dimension corollary. | `7f91ebae1a8f5e695800f4afb9fc06d0e2ea0b3a476751a31a7c8c3f38ad537d` |

No private book was needed; no source file, source passage or private path is
committed. The inherited CG20, Carayol, Gelbart–Jacquet, Tunnell and DLB source
contracts are preserved, without claiming they were reread in this run.


Scratch sources and logs are disposable; all mathematical resume information
is in this handoff and the package. No second issue was claimed.
