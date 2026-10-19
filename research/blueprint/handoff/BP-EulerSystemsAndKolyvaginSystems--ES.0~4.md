# Euler systems and Kolyvagin systems: revision four

Job `BP-EulerSystemsAndKolyvaginSystems--ES.0~4`, issue #10951. Codex,
session `codex-cCZWmK`, 2026-10-19. The claim was confirmed by the bot at
[comment 6270087366](https://github.com/CBirkbeck/tauceti-explorer/issues/10951#issuecomment-6270087366).
This is a completed revision, ready for independent review, not a checkpoint.
Only the four deliverables named by the issue changed.

## Findings addressed

The [revision-three review](../reviews/REV-EulerSystemsAndKolyvaginSystems--ES.0~3.md)
stopped at the mandatory shape gate. The suggested file was rebuilt from a blank
file against the available carriers, rather than shortening the old development
until it met the size limit. It now has 278 lines, compared with 5,497 previously.

| Finding | Resolution |
| --- | --- |
| More than 5,000 lines | The representative signatures are 278 lines. Every mathematical target remains in the reader. |
| Admitted decomposition/inertia data and dependent local representations/cohomology | All removed from Lean, including their dependent signatures. The local arithmetic definitions, hypotheses, APIs and Checks remain reader targets with their supplier contracts. |
| Admitted quotient representation, carrier identification and quotient map | All removed from Lean, together with dependent propagation and quotient-Selmer signatures. No carrier is retained by hiding its admission behind an alias. |
| Admitted Cartier-dual representation and carrier identification | All removed from Lean, together with dependent pairing and duality signatures. The reader distinguishes continuous Cartier duals from O-linear duals and retains the general-R and finite self-injective scopes. |
| Admitted rationalisation data and dependent lattice conditions | All removed from Lean. Canonical, unramified, finite and saturated conditions remain exact reader targets. |
| Other admitted data beyond the review's examples | The same rule was applied to the whole file: towers, systems, sheaves, arithmetic bidual adapters, geometric inputs and all dependent signatures are reader targets. The data checker reports no offenders. |
| Weak arithmetic signatures with unavailable hypotheses omitted | Removed. In particular, no Nekovář bound, elliptic comparison, local finite-torsion theorem or Rubin–Stark conclusion is stated with its geometric, purity/polarization or regulator hypotheses missing. |

The packet's old independent `review` object is unchanged. Its `needs_changes`
verdict is historical evidence, not a verdict this worker can replace. The next
independent reviewer must perform the full acceptance audit that the shape gate
prevented. The five `sourceIssues`, including their revision-two review verdicts,
are likewise unchanged; this revision does not assign them new independent verdicts.

## Earlier arithmetic corrections kept together

The reader's coefficient dictionary and the three earlier negative controls were
checked together. The source statements and node hypotheses were preserved.

| Correction | Current contract and control |
| --- | --- |
| R1: support | Every Selmer support contains the primes above p, the infinite places and the ramified primes. Duality, quotient propagation, modification and restriction of the auxiliary prime set preserve this support. For the trivial F_p-module over Q, empty support is inadmissible; for odd p its Cartier dual μ_p ramifies at p. These are reader Checks, since the actual Selmer and local Galois dictionaries are not available at the pins. |
| R2: coefficient category | Real-bodied Lean predicates specify complete noetherian local rings with finite residue field of prime characteristic and the maximal-ideal topology; finite-type compact coefficients with the module topology and jointly continuous action; and discrete, smooth, maximal-ideal-power torsion coefficients of cofinite type. Z_p and F_p are positive checks; discrete Q and a discrete fraction field of a DVR are excluded. Finite modules lie in both categories. |
| R2: evaluation and duality consumers | The reader requires compact coefficients for the relevant evaluation maps. Discrete Q has unramified H¹ equal to zero, whereas its trivial-Frobenius coinvariants are Q. MR04's general quotient/dual identification keeps (H.0), (H.1), (H.3); the finite self-injective identification uses BSS II Proposition 3.5, Lemmas 3.6–3.7 and Corollary 3.8. An O-only supplier theorem is not used to establish a general-R claim. |
| R3: F_ur | MR16 Definition 5.1, pp. 9–10, means the saturation of the intersection of corestriction images from all finite unramified extensions above p; at infinity it is relaxed, and away from p it is the rational inertia kernel. Lemma 5.2, Corollary 5.3 and Theorem 5.4 retain their hypotheses. For Z_p(1) over Q_p, p odd, the inertia kernel is zero while the universal-norm condition has rank one. The unavailable construction and its consumers remain in the reader rather than as admitted Lean data. |

The Cartier dual of a lattice is continuous Hom into μ_{p^∞}, with coefficient
action through the source. An O-linear dual into Φ/O requires its own explicit
comparison; no unspecified trace identifies them. MR16's signed core rank and
MR04's positive-part convention, and truncated artinian versus untruncated DVR
divisibility, remain distinct.

## Retained Lean and convention checks

The file uses `TauCetiRoadmap.EulerSystemsAndKolyvaginSystems`, with its
`KolyvaginSystems` and `EulerSystems` subnamespaces. Public `TauCeti.*` names in
the reader are library targets, not a promise that every API item appears in
this representative file.

| Retained definitions/signatures | Instances checked |
| --- | --- |
| Coefficient predicates | Finite field, Z_p, finite discrete modules, discrete Q and the fraction field of a DVR, as above. |
| Euler polynomials from the reversed characteristic polynomial of an actual finite-free endomorphism | Zero rank gives 1. Frobenius scalar q gives Rubin 1−X versus MR 1−qX. The rank-two comparison gives the q⁻¹ quadratic coefficient. The comparison scales X by q⁻¹; q is supplied as a unit. No Frobenius is chosen by an admitted definition. |
| Integral group-ring norm and derivative | Trivial group: norm 1, derivative 0. Order two: norm 1+σ, derivative σ. Order three: derivative σ+2σ². The telescoping theorem explicitly requires a generator; generator change is modulo the order. The group-ring norm acts as Mathlib's `Representation.norm`. |
| Augmentation identities | Use the existing pinned `TauCeti.MonoidAlgebra.augmentation` directly. It is baseline declaration 26, not a new ES definition. Basis augmentation is 1, norm augmentation is the group order, and twice derivative augmentation is n(n−1). |
| Elementwise `divisibilityIndex` | Zero has value ∞, a nonzero residual class has value 0, and p^j in Z_p has value j. This light definition does not replace the distinct finite-artinian system invariant. |
| Off-diagonal determinant `deltaCorrection` | Empty determinant 1, singleton 0, two-prime value −P₀₁P₁₀. The elementary expression does not require BSS Hypothesis 6.11; the arithmetic local-relation theorem still does. |

No generic bidual/Fitting theory, Selmer construction or arithmetic system is
developed in Lean. The full higher derivative still uses the group ring of
E(n)/K without assuming a splitting of that Galois group.

## Existing suppliers and the generality boundary

The current read-only roadmaps and current Tau Ceti source were inspected in
addition to the atlas snapshot and reviewed library audit. In particular,
`LocalGaloisGroups` and `ProfiniteArithmetic` supply their existing field and
subgroup interfaces. Current Tau Ceti already supplies `TauCeti.fittingIdeal`
and its generic presentation/base-change API; the roadmap consumes them and no
presentation-minor replacement survives in Lean.

- [SelmerIwasawaCohomology PR #869](https://github.com/TauCetiProject/TauCetiRoadmap/pull/869),
  inspected head `964eaa843413cb7832d529423c3414973126681e`: consume §§2.1–2.3,
  §2.9 and §2.13 for Selmer diagrams, changes of condition, arithmetic
  instantiation and duality. The exact general-R extension is proposed as
  **SelmerIwasawaCohomology, Part II**, building first on this O-adic work.
- [ArithmeticGaloisDuality PR #858](https://github.com/TauCetiProject/TauCetiRoadmap/pull/858),
  inspected head `9fcc0f88cfca194cda9d0164e71369f8f4604b60`: consume §R02.2.3
  for compact restriction/corestriction and §§D7.4–D7.7 for pairings and dual
  local conditions. Open upstream work is consumed, not planned again here.
- [PadicMeasuresIwasawaAlgebras PR #780](https://github.com/TauCetiProject/TauCetiRoadmap/pull/780),
  merged at `b0b73ac03`, inspected head `f566626ffb4bb5be4d69664471b785efb3e15608`:
  §§6.4–6.7 supply compound matrices, Fitting identities and exterior-power
  annihilators. They do not supply the complete BSS bidual/transfer contract.
  **PadicMeasuresIwasawaAlgebras, Part II** is therefore an explicit extension
  proposal, with the merged roadmap as its first prerequisite. Its generic
  transfer has normalization i(N_H^{∧r}x)=N_Hx. ES.7 owns the arithmetic
  auxiliary-field projection, independence and corrected rank-one comparison
  after the generic maps are supplied.

The other requests keep their precise owners: native ClassFieldTheory Layers
13/7/5, native Chebotarev Layer 10, ClassicalArithmeticCompletion CA.7 for the
noncommutative maximal-order pairing bound, HE.7 for CM-point/Kummer geometry,
HE.0 for Howard's inert ring-class local dictionary, and I.7 Part II for the
ordered archimedean regulator. These are contracts recorded in this packet;
no other roadmap, upstream file or live atlas edge was edited.

RT-AREA-iwasawa-1/10 and /36 routing is retained: ES.5 owns Howard's abstract
self-dual DVR theory; ES.8 owns his Λ-adic theorem and is outside this part.
HE.6/HE.8/GH.5 consume that theory. ES.2 and ES.4 supply the generic cyclotomic
and Kato carriers/bounds. The four earlier restructuring proposals remain,
with the two Part II proposals above added explicitly.

## Counts and validation

All 89 node IDs, statements, hypotheses, source locators, existing 272 API items
and existing 135 tests are retained. Two light APIs and seven discriminating
checks were added. No node was added or removed.

| Item | Result |
| --- | --- |
| Nodes | 89: 30 definitions, 10 constructions, 33 theorems, 7 lemmas, 6 applications, 3 comparisons |
| API items / unit tests | 274 / 142 |
| Planets | 35, by layer: 6/3/3/5/5/5/4/4 |
| Baseline declarations | 26; statements read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 |
| Supplier requests / gaps | 10 / 5 |
| Coverage | ES.0, ES.1, ES.2, ES.3, ES.4, ES.5, ES.6, ES.7 all planned; none closed |
| Pass / implementation | complete target-level pass; all 89 implementation statuses unchecked |

- `scripts/check_blueprint.py`: zero errors and zero warnings against the
  pinned declaration index.
- `scripts/check_sorry_data.py`: exit zero, no reported declarations.
- `lean-check`: exit zero; 27 warnings, all `declaration uses sorry`; no other
  warnings or errors. Memory was checked before compilation. Proofs are
  admitted; successful elaboration does not establish mathematical truth.
- Field-by-field comparison: all 89 reader sections match the packet's
  statements, hypotheses, proof sketches, prerequisites, acceptance tests,
  source matches, uses, APIs, tests and proposed names; all 10 requests,
  5 gaps and 8 coverage records match as well.
- Structural comparison: review and source findings unchanged, all old targets
  and APIs retained, no excerpt fields; intake file checks and `git diff --check`
  pass. Only the four authorized deliverables are submitted.

## Source reading and follow-up

This round's reading is bounded and recorded separately from the historical
fuller reading records: MR04 coefficient/support conventions, Lemma 1.2.1,
Definitions 2.1.1/2.2.1/2.3.1 and §§3.2/3.5; MR16 Definition 5.1 through
Theorem 5.4, pp. 9–11; Rubin IV Lemma 1.2, p. 57 and Definition 4.1 with
identity (4), p. 62; BSS II Proposition 3.5 and §6.4, pp. 15 and 40–42.
Fingerprints match the previously recorded versions. Source passages were not
copied into the repository. No new full reading of the private LTXZZ paper,
Kolyvagin's original article or Curtis–Reiner is claimed. Earlier source
findings remain attributed to their independent review.

The next step is an independent acceptance audit of the revised package,
including every node/baseline citation, R1–R3 together, the five source
findings, closure and RT10/RT36 ownership. Subsequent implementation/refinement
must fulfil the general-R L2 contract, L6 bidual/transfer contract, CA.7
maximal-order bound and HE/I.7 geometric/regulator contracts; refine the
lemma-level steps named in each coverage record; and keep ES.8 in its own
part. The five gaps are explicit: unread Kolyvagin original, general-R duality,
maximal-order input, transfer/coefficient dictionaries, and geometric/regulator
carriers. No stage is claimed closed and no acceptance is claimed by this worker.
