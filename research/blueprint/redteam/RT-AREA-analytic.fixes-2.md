# FIX-RT-AREA-analytic, round 2

Issue: #6210. Worker: Codex, session `codex-utL7Fz`. Date: 2026-10-17.

## RT-AREA-analytic/1 — arithmetic-scheme Chebotarev

The confirmed supplier gap is addressed in the finished AN packet, reader and
suggested file. The proposed owner is **ChebotarevPartIIArithmeticSchemes**,
*The Chebotarev density theorem, Part II: arithmetic schemes*, extending
`tauceti:TauCetiRoadmap/Chebotarev`. It is a new-roadmap request for the
maintainer under PROTOCOL §17, not an adopted stage or an AN.4 theorem.
AN.4 retains the number-field scope established by accepted RS-07. No new
layers are inserted into Tau Ceti's roadmap.

The earlier packet already had a general ownership request. This change makes
it actionable: `ownershipRequests`, finding `RT-AREA-analytic/1`, now records
the identifier, exact theorem and density convention, proof obligations,
consumer corollaries, comparison tests, primary sources and both extraction
reroutes. The AV item20 entry in `targetLedger.routedTargets` now carries
the qualified statement and explicitly records pending ownership adoption.
The reader's scope paragraph and extension section give the same contract.
The AN.4 Lean comment marks the boundary; no schematic scheme carrier or
admitted data definition is introduced.

### Statement and normalization

The base X is nonempty, normal, integral, of finite type and dominant over
Spec Z, of Krull dimension d≥1. The cover Y→X is connected, finite étale and
Galois with finite group G; C⊆G is conjugacy invariant. Arithmetic Frobenius
acts on residue fields by the q-power map. With q_x=#κ(x), count closed
points with q_x≤Q to define π_X and the Frobenius subset count π_C. The
contract is π_X(Q)~Li(Q^d) and π_C(Q)/π_X(Q)→δ=|C|/|G|.

Serre's June2011 author text, §9.1.2 pp.132–133, §9.2.1 p.135 and
Theorem9.11/Corollary9.12 p.137 support this **natural-density** statement.
Round1's description of Serre's theorem as Dirichlet density is corrected.
First prove the affine normal case, then use Proposition9.6 p.135 and
Proposition9.9 p.136 to remove a proper closed complement. The formulation
does not claim all Frobenius classes occur for every finite-type Z-scheme:
Spec F_p and its connected constant double cover give a counterexample.

For the Frobenius subset S_C, define
θ_C(Q)=Σ_(x∈S_C,q_x≤Q)log q_x. Partial summation gives
θ_C(Q)=δQ^d/d+o(Q^d). The normalized limit is therefore
dQ^(−d)θ_C(Q)→δ, or θ_C(Q)/θ_X(Q)→δ. The inspected AV preprint §2.14 p.25
omits d while giving total density1. Its displayed all-point limit is1/d;
A¹_Z (d=2) already gives1/2. This is a substantive normalization check,
not an inference of natural density from Dirichlet density.

Two source issues were added in the packet: E42 for AV v1 §2.8's missing
dominance restriction, and E43 for §2.14's missing dimension factor. Both
describe the source in our own words. E42 was already noticed in the
red-team review; E43 is newly identified in the inspected preprint. Neither
has been independently reviewed by this worker, and neither asserts that
the unavailable published version contains the same problem.

### Proof and consumer obligations for the new owner

Serre Chapter9 §§9.1–9.4, pp.132–144, including the proof in §9.4, was
read for this fix. Selected supporting Corollaries7.11–7.13, pp.96–97, were
also read. The ownership request preserves the full primary-proof extraction
as a design obligation, rather than declaring the theorem closed after
selecting its owner. In particular the new design must assign suppliers for:

- Dense-open reductions, finite norm fibres and the density-zero boundary.
- The constant-field quotient G/N and geometrically irreducible fibres over
  the number-field base; the geometric fibre dimension is d−1.
- Uniform compact-support Betti bounds and twisted Frobenius fixed-point
  estimates (Theorem9.14, Proposition9.15, Lemmas9.16–9.17, pp.139–144).
- The degree>1 error and summation over the number-field base. Existing
  qualitative number-field Chebotarev supplies base-prime distribution;
  effective bounds are not required by these consumers.

The geometric inputs are not assigned fictitious existing stage endpoints.
They require exact supplier resolution or explicit targets in the new design.
This job supplies the source-qualified maintainer request permitted by §17;
it does not deliver that future roadmap's closed dependency graph.

The required corollaries include class occurrence and Zariski density
(Serre Corollary9.13 p.138), profinite Frobenius density, dominance of Galois
covers detected by inclusion of splitting sets, and triviality of a
Z/2-torsor split on a corrected density-one set. Schmidt–Stix's published
Proposition5.1 proof pp.838–840 and Lemma5.2 proof pp.840–841 were read.
The common Galois compositum identifies splitting-set inclusion with
inclusion of open normal subgroups. A connected double cover has split
density1/2; a disconnected torsor on a connected base is split.

The new design must give its definitions APIs and at least three tests each.
The request names quotient functoriality, dense-open invariance and the
Spec O_K[1/N] comparison with number-field primes and arithmetic Frobenius.
Its discriminating cases include empty/all C, a connected double cover,
A¹_Z's weighted normalization and the excluded Spec F_p claim.

### Maintainer actions and extraction status

1. Adopt or rename `ChebotarevPartIIArithmeticSchemes` and commission its
   design and independent review, using the contract above. No existing
   roadmap is silently widened.
2. Replace AV source route4 for `PAPER-ABDURRAHMAN-VENKATESH-25/20` with the
   Part II route, qualify its hypotheses and weighted normalization, and
   correct the route's unrelated review reason. Its current acceptance
   does not establish a scheme supplier in AN.4.
3. In the Schmidt–Stix extraction revision, replace rejected route4 for
   items38 and84 by the same Part II route. Preserve its regular connected
   flat arithmetic-model hypotheses. G4 and the route rejection remain
   open until independent acceptance of that revision.

Both route corrections are recorded in the packet and reader. Their source
files are outside this issue's deliverables and are not edited. In
particular this fix does not label the Schmidt–Stix extraction accepted.

### Library and source checks

The AN.4 and Chebotarev library audits were read, along with accepted RS-07.
The current upstream Chebotarev README and relevant Suggested.lean
signatures still quantify over number fields and `HeightOneSpectrum`.
ArithmeticDirichletSeries supplies the number-field counting/density
interfaces. The upstream roadmap checkout inspected was
`0d144d044dacebca17b654695b6f1ad58f159b27`.

The current Tau Ceti checkout inspected was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Its
`NumberTheory/Chebotarev/Density/Chebotarev.lean` and
`PrimeCounting/Chebotarev.lean` already prove number-field density/counting;
these are reused, not planned again. The number-field natural-density
carrier was also read at the pinned Tau Ceti `f790474`. No current-library
declaration is newly represented as an export of that older pin.

Primary texts read on 2026-10-17 (locators above; hashes also in the packet):

| Text | Version and acquisition | SHA256 |
|---|---|---|
| Serre, *Lectures on N_X(p)* | [June2011 author text](https://www.college-de-france.fr/media/professeurs-honoraires/UPL47720_cours_Taiwan_avril__10juin_2011_.pdf) | `8a9a308e6b918356c8b73402bb8bb3c4dccd1acdce0e3d30cc0a9bb6f797363d` |
| Abdurrahman–Venkatesh | [arXiv2303.13436v1](https://arxiv.org/pdf/2303.13436v1), selected §§2.8,2.14; normalization also read as a page image | `3e2736beea70ba3467ad30a24b518d82cf589d9ddd4a06f6b0684c7bfd7d6306` |
| Schmidt–Stix | [Annals184(2016),817–868](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf), selected proofs | `6e9083efdb484e6f3dae456bcb55fa8369e2ab35a727da36809f8611eef70759` |

The AV publisher PDF endpoint returned an HTML challenge. The
[IAS author copy](https://www.math.ias.edu/~akshay/research/RT.pdf), SHA256
`4bc8373b4252837b98a3c90a9adf8d75408a7a5ff7b39cd7ef39bdfcc7e0d4c8`,
retains both inspected assertions. The arXiv history listed only v1;
bounded erratum searches found no correction. This is not an exhaustive
novelty claim or a reading of the version of record. No source passage or
section-by-section source summary is included in the deliverables.

## Other findings

RT-AREA-analytic/2 and /3 were rejected by the independent verifier.
No changes are made for them. In particular the accepted source routes for
quadratic-symbol estimates and the existing Smith-method Part II are not
replaced by new competing owners.

## Validation

- `scripts/check_blueprint.py`: zero errors and zero warnings.
- `lean-check`: exit0, 398 warnings, all `declaration uses sorry`;
  2,661 lines, below the 5,000-line limit. The existing declarations are
  unchanged; the edit is a scope comment.
- Submission-path checking and `git diff --check` pass (see handoff).

The packet's historical independent review is preserved. The present fix
and new source issues await `REV-FIX-RT-AREA-analytic~2`.
