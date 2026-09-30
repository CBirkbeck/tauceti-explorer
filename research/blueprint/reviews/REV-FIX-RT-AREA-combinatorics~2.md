# Review of the combinatorics follow-up fixes

**Accepted, with one normalization correction in an explanatory record.**
Job `REV-FIX-RT-AREA-combinatorics~2`, issue #5165. Codex — `codex-J6LwjP`,
30 September 2026; reviewed base `d0016c7`, integrated through `dbc75e4`.

The follow-up fixer was Codex `codex-rtOQ9t` (PR #5210, commit `e306457`),
not this session. The earlier fix was by Claude Code `cc-39fac3`; the
independent finding verification was by `codex-7e92bd`. I read the claims and
qualified decisions for all 44 findings, the complete follow-up report and
the earlier report's directly relevant /3, /14 and /16 sections. This is a
review of their disposition and the assigned corrections, not a fresh red
team of the entire area or of Tau Ceti's roadmaps.

The fix issue explicitly hands unfinished blueprints to their blueprint jobs.
Current WORKERS/PROTOCOL rules place upstream-only observations in maintainer
notes. The review therefore does not require unauthorized changes to those
roadmaps or generated atlas files. In particular, this session previously
worked on the AlgebraicCodingTheory link fix; none of that work is being
reviewed again here.

## Applied findings

### /3 — accepted: imported Roth, Behrend and van der Waerden

RS-03's AC.2 narrowing consumes the pinned `roth_3ap_theorem`,
`roth_3ap_theorem_nat`, `rothNumberNat_isLittleO_id`,
`Behrend.roth_lower_bound` and `Combinatorics.exists_mono_homothetic_copy`.
I read their statements. They provide respectively the finite-abelian-group,
integer-interval and asymptotic Roth results, Behrend's lower bound and the
finite-coloring homothetic-copy theorem. They do not provide all retained
k≥4 density results, stronger quantitative bounds or the correspondence and
removal obligations.

The narrowing retains Mathlib's actual `ThreeAPFree` convention. In exponent
two, a+a=b+b, so the
triple (a,b,a), with a≠b, witnesses failure of that predicate. No odd-order
restriction was silently imposed on the existing finite-group theorem.
AUDIT-16 already has Roth evidence and a correct partly-built verdict; the
fix does not misdescribe it as an absence audit. No further RS-03 correction
was needed.

### /14 — accepted: one generic interface, two correct specializations

RS-03 assigns the missing finite-abelian coefficient/comparison interface to
AC.0. Its ER.4 consumer link and the packet request agree on

`A(f)(chi) = |G|^(-1) * sum_x f(x)*conj(chi(x))`.

The request fixes normalized convolution, inversion, Parseval and the
counting/unitary scale comparisons. It imports the existing character basis
and orthogonality rather than proposing a second character theory. The
Haar/Peter–Weyl results remain ingredients; identifying their coefficients
with character-indexed finite coefficients is still an explicit obligation.
Compatibility with upstream coding and modular-forms specializations is
requested without imposing either entire stage as a prerequisite.

The two EllipticRegulators nodes specialize that contract:

- Lecture 10 uses `C^(-2)` on `(Z/C)^2`, with character
  `chi_(k,l)(a,b)=exp(2*pi*i*(a*k-b*l)/C)` and its conjugate in the transform.
  Its coefficient is exactly the coordinate in `AddChar.complexBasis`.
  Two counting-normalized `ZMod.dft` calls use indices `(k,-l)`, since the
  library's DFT has a negative kernel.
- Lecture 11 uses `C^(-1)`, the unitary scale on C² points. The corrected
  transform has the dual argument first in the alternating pairing. For
  `f(m,n)=F(n+m*tau)`, the comparison is
  `finiteFourier10 f (k,l) = C^(-1)*fourierO F (k,l)`.
  Only input coordinates swap. Swapping the output too is false.

I checked the displayed definitions and pairing on Bloch's page images.
Lecture 10's formula is on printed p.76; Lecture 11's differently normalized
printed formula is on p.87. The pairing on p.89 and the proof on p.91
confirm the distinction between the printed and corrected kernel already
recorded by the historical review as E7. The follow-up correctly supersedes
the first fix's suggested wording, which had not read Lecture 10 and would
have lost its normalization.

The new specialized API entries, tests and Lean signatures agree. In
particular, C=3 and F=delta_(1,0) give
`fourierO F (0,1)=exp(2*pi*i/3)/3` but `fourierO F (1,0)=1/3`.
The Lecture-10 transform of delta_(0,0) has squared counting norm 1/9,
whereas the unitary transform has squared norm 1. These discriminate the
two possible regressions. The C=1 identity and character-to-point-mass tests
also have the right hypotheses.

**Correction made during review:** E7's explanatory `reason` still wrote
`fhat_10 = C^(-1)*sum_y F(y)<x,y>`. Its raw sum needs `C^(-2)`; the factor
`C^(-1)` is correct only before the already normalized `Fhat(x)`. I changed
that sentence to show both equalities. The two node statements and the
follow-up's Lean comparison already had the correct factors. E7's printed
source text, correction, historical verdict and other mathematical claims
are retained. This fixes the packet's explanation; it is not a new claim of
an additional mistake in Bloch.

No new node, generic Fourier owner or whole-stage upstream dependency was
added. The 75-node internal dependency graph remains acyclic. The assembled
atlas has no path from ER.4 back to AC.0, so the supplier link creates no cycle.

### /16 — accepted: canonical audit provenance

The two canonical RS-03 supplier strings name AUDIT-16, which is the job
recorded for AC.0 and AC.2 in `data/library-coverage.json`; no AUDIT-06 string
remains in this proposal. The partial Fourier verdict and imported energy
theorems remain unchanged. Generated mirrors and the old prose report are
orchestrator/maintainer follow-ups, not additional authorized review edits.

## Disposition of the other findings

These decisions accept the follow-up's assignment of remaining work. They
do **not** certify that an unwritten blueprint has closed its proof. The ABS
extraction was inspected read-only for its current handoff and distinction
between the application-level Kai alternative and Kai's internal Mitsui
input; this review does not replace its paper review or re-read the entire
analytic source chain.

| Finding | Review decision and remaining boundary |
| --- | --- |
| /1 | Rejection retained. A route-dependent AC.3 input does not force every permitted AC.2 route into a cycle. |
| /2 | Blueprint handoff accepted. AC.2 must select the exact equation/system and directed or colored removal input; triangle removal alone is insufficient. |
| /4 | Blueprint handoff accepted. Retain corrected GTZ/errata provenance and supply the quantitative box interfaces needed by the Kai branch; qualitative ownership alone does not close it. |
| /5 | Follow-up disposition accepted. ABS route 3 now directs its number-field Kai branch and exact supplier requests to BP-AdditiveCombinatorics. Other branches may still use AC.4. |
| /6 | Retained correction is consistent. Item /33 distinguishes its unresolved schematic G1 from Kai's stronger Siegel-corrected internal theorem and states the modulus range/version distinction. No new acceptance of G1. |
| /7 | Blueprint handoff accepted. AC.5 needs source-specific SV.2 Type I/II and AN.3 progression inputs, with constants and ineffectivity; distinguish Möbius from the separate Lambda application. |
| /8 | Blueprint handoff accepted. Select or separate the GT2008 and lighter transference branches and close their actual targets before removing inputs. |
| /9 | Blueprint/RS-07 follow-up retained. The unsupported SV.3-to-AC.4 edge must be removed in its authorized owner; this review cannot certify that deletion merely from a handoff. |
| /10, /11 | Rejections retained. Newer optional bounds and external formalizations do not invalidate the existing source-scoped targets or change the binding library pins. |
| /12 | Blueprint handoff accepted. The selected cyclic Bohr/progression route needs GN.1 Minkowski II, with `(rho/d)^d*N` under the stated phase-distance convention; general groups need the distinct coset-progression contract. |
| /13 | Blueprint handoff accepted. Share the unfiltered quotient/lattice carrier, preserve the LieGroups Part II allocation, and leave rational Mal'cev/filter/complexity data in AC.3. ALS.2 need not import the whole inverse theorem. |
| /15 | Blueprint handoff retained. Remove unsupported CA.2 and retired LI.2 inputs, name real suppliers and update the summary; do not substitute a blanket compact-group prerequisite. |
| /17 | Blueprint handoff retained. The exported progression statement must bind prime N sufficiently large, N≥k and nonzero difference, or distinct terms in an interval. |
| /18 | Blueprint handoff retained. Use one complex conjugated-cube definition with interval/box comparisons; U¹ is only a seminorm. |
| /19, /20 | Rejections retained. A thematic conjecture overlap is not a duplicate theorem, and the already rejected norm-form route is not an accepted missing supplier. |
| /21, /22 | Upstream notes retained, not newly reviewed: even-modulus Type II scope and finite-family lattice/discriminant interfaces. |
| /23 | Rejection retained. Post-pin progress does not alter the binding audit. |
| /24, /25 | Upstream notes retained, not newly reviewed: coding dependency/forward-reference placement. No upstream graph edit is authorized here. |
| /26, /27 | Upstream notes retained, not newly reviewed: actual gluing API names and existing coding declarations. |
| /28 | Rejection retained. ACT-O02 already records the comparison boundary; no unconditional coding prerequisite follows. |
| /29 | Conditional GN.4/maintainer handoff accepted. Resolve the meaning of lattice codes before adding Construction A; preserve dimension and nonzero-code conventions. |
| /30 | Upstream note retained, not newly reviewed: integral versus square-root-normalized coefficient rings. |
| /31 | Rejection retained. The alternative BCL uniqueness route prevents the claimed unavoidable sampling cycle. |
| /32 | Upstream note retained: sampled-cut and equipartition inputs. |
| /33, /34, /35 | Upstream notes retained: separate atomless transport, compactness assembly and the conditional-expectation bridge. |
| /36 | Upstream note retained: reflection positivity with the required graphon range and merged-edge convention. |
| /37, /39 | Upstream notes retained: coupling and finite/analytic regularity ownership. No upstream consolidation is performed or approved here. |
| /38 | Upstream note retained: an arity-three proposal does not supply arbitrary-arity removal to future AC.2 work. |
| /40 | Upstream note retained: dependency/status provenance must respect the selected separation proof and coverage schema. |
| /41, /42, /43, /44 | Upstream notes retained: projective-limit adapter, locators, existing measure-preserving API and acyclic triangle/quotient ordering. |

## Provenance, preservation and validation

The source is Bloch, *Higher Regulators, Algebraic K-Theory, and Zeta Functions
of Elliptic Curves*, CRM Monograph Series 11, AMS, 2000
([publisher record](https://bookstore.ams.org/crmm-11)). I read the programme's
supplied 110-page scan, SHA-256
`9715a312ec4ebb9535daa24f3308bb5b97152211d747d55bf9f6c06bb221bd60`, at printed
pp.76,87,89,91 (PDF pp.88,99,101,103). The publisher endpoint returned 403
when checked; the actual reading was from the supplied scan, not a claimed
fresh download or full-book reread. I appended that selective reading record
without changing the historical `sourceVersions` entries.

Read actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

- `AddChar.complexBasis`, `AddChar.sum_apply_eq_ite` and
  `AddChar.wInner_cWeight_eq_boole` in the finite-abelian Fourier files;
  `ZMod.dft`, its counting-measure formula and `ZMod.dft_dft`;
  `ZMod.stdAddChar` and its exponential formula. The negative DFT kernel is
  also visible in the [pinned source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/ZMod.lean).
- `CommGroup.sum_monoidHom_apply_eq_ite`, with finite commutative G and a
  domain with enough roots of unity; `TauCeti.hasSum_norm_sq_peterWeylCoeff`,
  with its irreducible skeleton and L² carrier; and
  `TauCeti.haarProb_eq_smul_count`, for a finite discrete Borel group.
- The five progression declarations named under /3 and the `ThreeAPFree`
  definition. These were statement readings, not just index matches.

The former top-level reviews `independent-review-REV-RS-03` and
`independent-review-REV-EllipticRegulators` are preserved verbatim under
`reviewHistory`, including their correction/node records. RS-03 also retains
the newly merged round-1 review `independent-review-REV-FIX-RT-AREA-combinatorics`
verbatim in that history; it changed only review metadata and agrees with the
retained /3, /14 and /16 decisions. New top-level
objects name this review and delimit its scope. The separate later
K-theory supplier fix `0ba7ef0` (PR #5265) is retained without certification
by this job. Consequently the current EllipticRegulators packet has **14
gaps and 40 requests**, not the earlier fix report's 12 and 37. All 75 nodes
and all eight stages remain partial/unchecked as before; no stage closes.
The suggested-file header records this scoped mathematical review while
continuing to say that the changed file has not compiled.

Validation:

- Stock `check_blueprint.py`, with the pinned declaration index: 75 nodes,
  123 API items, 88 tests, 39 baseline declarations; zero errors/warnings.
- Stock `check_restructure.py`: valid. Intake validation of the four review
  deliverables and `git diff --check`: zero problems.
- Independent numerical diagnostics: **14,769 equalities**, C=1,…,6,
  maximum absolute discrepancy below `2.3e-13` against a `2e-10` tolerance.
  Inputs were every point mass, every character, a deterministic nonreal
  function and its odd part. Checks covered inversion, both Parseval scales,
  the input-only swap, the two-DFT comparison, opposite kernels on odd
  inputs, normalized convolution-to-product, and the C=3 discriminators.
  These are regression diagnostics, not Lean proofs. They are reproducible
  by enumerating `(a,b)` modulo C and evaluating the displayed finite sums.
- The packet has 154 internal edges and is acyclic. A read-only
  `build.assemble(require_distances=False)` produced 2,907 stages and 8,322
  edges, with no ER.4-to-AC.0 path. No site or atlas output was written.

No existing build at the required pins was found, including the Fourier
module artifacts, so **Lean was not compiled**. No build, cache download,
Lake project or language server was started. The remaining general AC.0
interface, other unfinished blueprints and upstream notes remain at their
recorded owners. No further correction is required for the assigned
combinatorics follow-up to be accepted in these files.
