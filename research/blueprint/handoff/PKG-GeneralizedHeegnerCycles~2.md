# PKG-GeneralizedHeegnerCycles~2 — blocked checkpoint

Worker: Codex, session `codex-VUxRbY`, 21 October 2026. Refs #9171.
Claim confirmed by the bot in issue comment 6305607757.

**Status: partial; blocked on coordinated owner-plan changes.** This is a draft
checkpoint, not a claim that the three findings of
`research/blueprint/reviews/REV-PKG-GeneralizedHeegnerCycles.md` are discharged.
The issue authorizes only the package's three files and this handoff, explicitly
forbidding packet changes. The existing `review.json` remains unchanged for the
next independent reviewer. Draft status prevents this package being treated as
a completed revision merely because all its output files exist.

## Changes made

The README now follows the current assembly, rather than the older 82-target
package alone. Expanded both imported parts, applied the assembly's statement,
prerequisite replacement and prerequisite addition dictionaries, and retained
the twelve new comparison/application targets. The resulting 94 targets have
the following distribution:

| Layer | Targets |
| --- | ---: |
| GH.0 | 9 |
| GH.1 | 18 |
| GH.2 | 6 |
| GH.3 | 7 |
| GH.4 | 7 |
| GH.5 | 7 |
| GH.6 | 9 |
| GH.7 | 14 |
| GH.8 | 17 |

All 66 named API items and 58 named checks survive. Each of the eighteen
definition/construction interfaces has at least three discriminating named
checks. Statements, hypotheses, proof steps, acceptance checks, locators and
prerequisites were compared against the expanded assembly. This checks
preservation; it is not a proof of prerequisite closure or of the mathematics.

The twelve additions, with their exact node suffixes, are:

- GH.1: `degree-one-picard-kummer-comparison`,
  `uniform-integral-factor-transport`, `degree-one-local-realisation`.
- GH.2: `auxiliary-form-local-range`.
- GH.3: `finite-character-moment-descent`.
- GH.4: `source-period-and-twist-transport`.
- GH.5: `auxiliary-form-leading-class-unit`.
- GH.6: `nonvanishing-hypothesis-transport`, `auxiliary-form-nontorsion`.
- GH.7: `ordinary-regulator-quotient-application`,
  `weight-two-p-old-localization`.
- GH.8: `bsd-auxiliary-range-adapter`.

Removed the old field-by-field catalogue scaffolding, added Summary, scope,
conventions, supplier contracts, construction order and layer-end Examples and
Dependencies. Retained the BDP index m versus CH half-weight r distinction and
the three existing anchor renamings that remove “checkpoint” from mathematical
titles. The README contains no job, packet, review or checkpoint narrative.

Corrected retained proof routes that still assigned the modular Hodge/newform
projector and integral Hecke lattice to R14.3: the classical realization and
newform factor belong to AGR R19.1. Kept the geometric R14.3 requirements
separate. Added the actual Scholl resolution/boundary locators, specifying the
full-level versus Γ₁ descent distinction. The three geometric names below
remain required contracts, not registered targets in their owner.

Specified six local Part II supplier contracts, PHR2.0–PHR2.5, and made their
GH consumers cite those contracts separately from the existing cyclotomic L3
input. These package-level labels do not create that roadmap. The package does
not claim that a change of bibliography or a generic quotient lemma constructs
these regulators.

Preserved the earlier review's seven erratum/CH22 page corrections, its explicit
degree-zero Sym/Ind rank obstruction, and its expanded KO Condition 2.3.
In particular, KO Lemma 4.10 is on pp. 44–45, not pp. 54–56 as in one assembly
supplier proposal. Its Condition 2.3 is in §2.4, p. 13. No packet was edited to
hide either discrepancy.

Replaced the previous 2,138-line Lean development, admitted data and admitted
examples with a 204-line representative file in the current required form.
It has two real-bodied linear definitions, `etaOfOmega` and the
positive-conductor `stabilizedClass`, and four proved discriminating examples.
The seven admitted theorem targets are normalization, initial trace, positive
tail trace, uniform kernel bound, uniform coherent lift, primitive-character
cancellation and the domain of a localized specialization. These are the
explicit linear components/comparisons in the README. Their arithmetic
instantiations are not assumed to have been constructed. Missing geometric
carriers, the other definition APIs, local conditions, reciprocity and Selmer
milestones remain README targets, named in the closing comment.

Metadata remains exactly `topic = "math.NT"` followed by a newline.

## Blockers and concrete resumption points

### 1. Geometry must be registered below the classical projector

Current `ModularCurvesPartII--R14.3.json` has relative symmetric-power
coefficient and parabolic material: the older review's description of it as
only weight two is now stale. Nevertheless it has no targets named
`ks-canonical-resolution`, `ks-boundary-realisation` or
`ks-fine-level-descent`, and no complete integral auxiliary-level descent
contract for this consumer.

AGR's `R19.1/scholl-projector` owns the signed classical projector,
concentration/parabolic comparison and Hecke compatibility. It still imports
`GeneralizedHeegnerCycles:GH.0`; its request for canonical fiber-power geometry
and boundary cohomology also still names GH.0. GH.0 in turn needs its classical
projector. Repointing every GH geometric input to AGR would leave the cycle.

Resume with an owner-authorized plan change that registers the three geometric
targets in the foundational geometric owner, then repoints AGR's geometry
request and prerequisites there. Keep the classical projector, coefficient
descent and `integral-structure-of-the-newform-premotive` in AGR. Distinguish
smooth full-level resolution from Γ₁ descent; record degree, stabilizer,
torsion, projector and congruence denominators separately, including m=0.
The required order is foundational geometry → AGR classical realization → GH
CM-product projector. Scholl §§1–3 gives a concrete source for the first two
geometric calculations, but does not automatically prove the integral
fine-level/newform descent. Do not duplicate the classical Scholl projector.

### 2. The local Part II has no actual owner packet

`PadicHodgeRegulators--L3.json` remains cyclotomic, with no relative
Lubin–Tate, Ochiai ideal, Yager trace-module or two-variable quotient targets.
There is no `PadicHodgeRegulatorsPartII` packet providing the six required
interfaces. The current assembly proposes that owner; a package cannot make
it exist by asserting the identifiers.

Create/route that Part II under PROTOCOL §15, with L1/L3 as inputs, then make
the GH imports point to its registered targets:

- PHR2.0: integral Ω, crystalline lattices, bounded twist denominators and
  period/local-pairing compatibility (KO Lemmas 4.7 and 4.10, pp. 42, 44–45).
- PHR2.1: the relative Lubin–Tate map, both interpolation ranges and the actual
  tower/weight/invariant hypotheses (CH22 Theorem 5.1, pp. 21–22).
- PHR2.2: the ideal-restricted injective exponential and pseudo-null error,
  with J=(Ψ(Fr_p)−1,γ₀−1) (Castella Theorem 3.4, pp. 14–15).
- PHR2.3: the trace module, rank-one freeness and y^u=[u]y covariance
  (Castella Proposition 3.5, p. 15; LZ14 §3.2, pp. 11–13).
- PHR2.4: the localized two-variable regulator, retaining λ⁻¹J and the p-old
  dual-exponential domain (Castella Theorem 3.7/Corollary 3.9, pp. 16–17).
- PHR2.5: actual quotient/cohomological specialization, H² error, preimage of
  the quotient kernel and nonzero rank-one period pairing (Castella Lemma 5.1
  and Proposition 5.2, pp. 21–22). LZ14 Proposition 4.11, p. 18 applies before
  quotienting and needs the infinite unramified direction.

GH.7's ordinary-line application verifies these on its specific critically
twisted representation. A specialization with ν(λ)=0 requires an actual
regular model or denominator-cleared identity with a proved moment. The
injective-map counterexample on Q[X]/(X) and the nonzero functional on a
rank-one line remain separate checks. No abstract injectivity theorem proves
the arithmetic preimage equality.

### 3. The BSD auxiliary range is still an extension obligation

The assembly now supplies explicit GH.2/GH.5/GH.6/GH.8 targets for the local
condition, integral leading unit, non-torsion and export. Their existence as
targets is useful progress beyond the reviewed 82-node package, but their
routes still ask for the nonsplit local and unbounded-weight integral
verifications, analytic nonvanishing/reciprocity extension and LV19 collation.
They do not already discharge those verifications.

CH22 (H), pp. 1–2, and LV16 admissibility have all-split tame level and
weight-dependent factorial exclusions. Castella's BSD erratum Theorem 2.3,
pp. 3–4, needs a nonsplit q exactly dividing the tame level, specific special
local types, a condition at 2, and a sequence of higher weights. The ideal
Heegner condition means the nonsplit primes here are ramified; inert primes
cannot satisfy O_K/𝔐≅Z/MZ. For fixed p, unbounded weights cannot satisfy
p∤(2r−1)!.

Resume at `auxiliary-form-local-range`: give the actual integral coefficient
construction and local proof in this range, without applying the all-split
theorem unchanged. Then compute the GH.5 leading scalar and its integral
inverse on the same lattice/tower; a nonzero denominator is insufficient.
For `auxiliary-form-nontorsion`, verify Hsieh's local signs/test vectors and
the source-qualified reciprocity law at ramified tame primes. Hsieh Hypothesis
A is no longer vacuous, and CH3.9's coprime discriminant-level hypothesis
fails at these primes. Compare analytic moments in a regular coefficient
model before reduction modulo p^m. BSD.6a keeps congruence/control,
divisibilities and the limit argument.

The primary Padua record for LV19 is
<https://www.research.unipd.it/handle/11577/3310286>; its linked accepted
manuscript is
<https://www.research.unipd.it/retrieve/handle/11577/3310286/305219/KJM-19-026_delta.pdf>.
Both returned HTTP 403 in this run. The DOI is
<https://doi.org/10.1215/21562261-2019-0005>. LV19 was not collated; do not
replace that obligation with a claim that LV16 is the same edition.

Retain Castella Remark 6.6, p. 29's p-old restriction. The p-new
multiplicative weight-two curve is reached by BSD.6a's transfer, not by
discarding this restriction. Retain the distinct full-unit and half-unit
normalizations and identify the actual first conductor degree/unit index.

## Library and source verification

Read the full current AlgebraicVectorBundles and JacobianChallenge roadmaps
as form models. Screened the nine post-snapshot roadmaps named in WORKERS,
including OperatorTheory's nested files, and the four named Completed
roadmaps, together with the current Tau Ceti library. The read-only roadmap
commit was `0d144d044dacebca17b654695b6f1ad58f159b27`; the library commit was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No matching GH, Kuga–Sato,
Scholl, Yager or Perrin–Riou construction was found in this screen. Existing
divisor-class Abel–Jacobi algebra is distinct from continuous Tate-module
Kummer/Gysin comparison; generic ring syntomic material is distinct from the
geometric cohomological regulator. No existing roadmap target was removed as
a duplicate. No upstream files were changed or built.

Read the GH.0–GH.8 reviewed library audit and all nineteen distinct baseline
declaration statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular, checked the native
abelian variety/End/mulBy/finite-surjective IsIsogeny, linear maps, dual maps,
quotient kernels, character sums and finite reindexing. The three directly
referenced native Tau Ceti source files were byte-compared with the shared
compiler build at the pin; this is not a fresh claim about an eight-file
import closure. `Equiv.sum_comp` is the additive declaration generated from
`Equiv.prod_comp`; scalar character orthogonality needs the integral-domain
coefficient ring, not a torsion-free cohomology module.

Reacquired eleven public PDFs; all hashes matched their accepted source
records. Also read Scholl's author preprint for the geometric contracts.
Fresh reading was bounded to the changed interfaces and critical hypotheses:
CH22 (H), Theorem 5.1 and stabilization/reciprocity; the CH erratum; KO
Condition 2.3 and Lemma 4.10 with its trace/Ω/pairing argument; Castella
Theorems 3.4/3.7, Proposition 3.5, Lemma 5.1, Proposition 5.2 and the
specialization restrictions; LZ14 Proposition 4.11; BDP17 §4.1; Hsieh14
Hypothesis A, Theorem C and its proof range; the BSD erratum Theorem 2.3 and
proof; and Scholl §§1–3. The other target material was checked against the
accepted parts and locators. This is not a claim to have independently reread
all source papers in full. No source passages, source PDFs or book copies are
committed. No restricted book was needed.

## Validation and adversarial checks

- `python3 scripts/check_blueprint.py` on each of the assembly, GH.0 part and
  GH.8 part: exit 0, zero errors and zero warnings. They were not edited.
  The assembly still reports 26 gaps, 24 requests and zero closed stages;
  schema validation is not closure.
- `lean-check research/blueprint/packages/GeneralizedHeegnerCycles/Suggested.lean`:
  exit 0, seven warnings, all `declaration uses sorry`; no errors or other
  warnings. Four examples are proved. No Lean edit followed that check.
  Available memory exceeded 20 GB; one compilation ran at a time.
- Preservation inventory: 94 targets, 66 API items, 58 named checks,
  eighteen interfaces with at least three named checks; 109 unique explicit
  anchors and 363 internal links, all resolving. README is 250,080 bytes;
  Lean is 204 lines. Metadata is unchanged and exact.
- The expanded local target graph is acyclic. GH.6's auxiliary non-torsion
  application uses GH.7's ordinary-line quotient comparison; the latter can
  be constructed first without that application. This does not remove the
  external geometry/AGR cycle described above.

| Boundary checked | Witness and retained requirement |
| --- | --- |
| CM normalization | Scaling ω by a scales η by a⁻¹; zero pairing fails normalization. Both light-definition tests are proved. |
| Stabilization | p=5, α=2, z=5, lower=4 gives 3 at r=1 and −45 at r=2. The inverse root and p-power are retained in the proved examples. |
| Initial trace | p=5, α=2, a=9/2, u=1, d=4 gives bottom 1/4; changing only u to the full-unit count predicts 1/8. The fixture is algebraic, not asserted modular-form coefficients. |
| Uniform integral comparison | Constant Z towers with f=2 and g=id lift twice each target, while 1 need not lift. Levelwise rationalization with transitions 2 and maps 2^n fails to commute with the integral limit. |
| Character cancellation | A C4 character inflated from C4/H need not cancel an H-invariant lower class; exact conductor requires nontriviality on H. Cancellation occurs in the scalar ring before acting on torsion modules. |
| Quotient and localization | Multiplication by X loses injectivity on Q[X]/(X); ν(λ)=0 cannot evaluate λ⁻¹. A nonzero rank-one pairing is required separately. |
| Coefficient rank | At r=1 the literal Sym⁰ carrier has rank 1, while the induced Sym⁰ carrier has rank [H_K:K]. No false Sym/Ind identity is restored. |
| BSD range | All-split versus nonsplit, inert versus ramified, factorial exclusion at unbounded weights, nonzero scalar versus unit, and p-old versus p-new are separate negative controls. |

`python3 research/blueprint/intake.py check-files` on all four authorized
deliverable paths reported four files and zero problems. `git diff --check`
passed after removing an extra terminal blank line from README.
All retrieval and mechanical checks were performed by Codex; the issue's
specified Haiku/Sonnet subagent forms were unavailable. No instruction from
an untrusted source was followed. No other job was claimed. Scratch files are
disposable; everything needed to resume is above and in the package/source
links.

## Source receipts (acquired 21 October 2026)

| Source | Exact acquired SHA-256 |
| --- | --- |
| [bertolini-darmon-prasanna-generalized-heegner](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |
| [castella-hsieh](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf) | `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba` |
| [castella-hsieh-erratum](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf) | `2a8b615daf100b0f2e8ee5890462a91dde9c860492ec920d2a1a7d5827028678` |
| [longo-vigni](https://arxiv.org/pdf/1605.03168v1) | `afc1a2146cae0397c5aabb337f5955d182a0dab3dd50949ec2e274426a9a5c75` |
| [castella-variation](https://web.math.ucsb.edu/~castella/Heegner.pdf) | `6ebd71311d6841d15d653183e9ca3adaabbe9720416e86f6731e7c1ecbb1156d` |
| [kobayashi-ota](https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf) | `377cf3e5c53b00bed813a06e18ad8dac9315997497f2dabe57a435664b9764b4` |
| [castella-hsieh-published](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf) | `be67ffe80a7fa346e8cb0733f38c776268174eebc6277a85bfa9b91c49073ade` |
| [lz14-v3-gh8](https://arxiv.org/pdf/1108.5954v3) | `0da539348716fa2293377bba81b07de3d851f3e98bbc9b244b19e639a5ae5341` |
| [bsd-multiplicative-erratum-gh8](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf` |
| [bdp-coniveau-published](https://www.math.mcgill.ca/darmon/pub/Articles/Research/57.BDP5-coniveau/crelle.pdf) | `c6346dc8eff7ad1e01f3146e971bc7efd4dd73c6b149a51fba0a1a32aa63383c` |
| [hsieh-2014](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/24.pdf) | `a662df673725f6abbdb5b3ee272e78973c125cbc5d6fd0ba9307c790e8070718` |
| [scholl-full-level-geometry](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) | `b3a28690b3ba4aff316ac52ea7003cca8da757bfa309b75a9aba9557a134def6` |
