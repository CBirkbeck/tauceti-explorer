# PKG-AutomorphicSpectralTheory — blocked checkpoint

Issue #7893. Codex, session `codex-DPcpfv`, 10 October 2026.
Branch: `codex-DPcpfv-pkg-automorphic-spectral-theory`.
Starting explorer commit: `0e41d7964`.
The bot confirmed [claim 6096800227](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6096800227)
in [6096801427](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6096801427).
None of the manager-priority issues was available; this focus package was
selected under WORKERS' fallback order. Only this issue was claimed.

**Incomplete package; blocked by the authorized edit scope.** This submission
consolidates the continuation note and independently rechecks the repair gate.
The package README and Suggested.lean are unchanged; metadata remains absent.
The obstacle is a specification/ownership revision, not the time limit or a
requirement to prove the roadmap's future theorems.

## Exact repair gate

The issue says: **“Change no packet; if the plan has a mistake, describe it in
the handoff note.”** Its only deliverables are the three package files and
this note. It also makes the accepted plan authoritative. WORKERS' Upstream
tiers rule requires notions used from a higher roadmap to move down, with
consumers redirected to their new owner. A change confined to package prose
cannot reconcile the authoritative supplier and consumer contracts.

Fresh inspection of the AS packet's actual prerequisite lists, its requests,
the ET.0–1 owner document and `upstream/CaraianiNewton.md` confirms:

| AS target | Current upward input | Necessary specification repair |
| --- | --- | --- |
| `AS.2/generic-normalized-intertwiner` | `EndoscopicTransferAndUnitaryTraceComparison:ET.0` | Give relevant classical parameter/packet data, unitary generic members and pure-inner-form conventions an exact target at a permitted owner. |
| `AS.6/weighted-orbital-integral` | `EndoscopicTransferAndUnitaryTraceComparison:ET.1` | Move ordinary centralizer-quotient integration, convergence and singular extension to a permitted lower owner; preserve connected/full centralizers and discriminant/measure conventions. ET imports these for transfer. |
| `AS.6/general-euler-poincare` | `EndoscopicTransferAndUnitaryTraceComparison:ET.1` | Separate ordinary discrete-series/pseudo-coefficient inputs from real endoscopic transfer, with the actual real representation and Paley–Wiener interfaces. |

AS is tier 13 and ET tier 14, with no shared bundle. ET.0 constructs stable
conjugacy/endoscopic data; the AS request explicitly says it supplies none of
the required packet carriers. ET.1 expressly constructs ordinary quotient
measures, orbital integrals and real unitary pseudo-coefficient formulas.

Also repair the ET.0 request's `neededBy`: it lists
`shahidi-normalization`, `generic-standard-module` and `jiang-zhang-holomorphy`,
but omits its direct `generic-normalized-intertwiner` consumer. Redirect all
four uses, not just the three recorded request consumers.

The retained Lean file does not resolve these inputs:
`generic_normalized_intertwiner` is a commented signature omission;
`weighted_orbital_integral` integrates arbitrary functions over a supplied
measured type and constructs no centralizer quotient; `general_euler_poincare`
inverts one supplied scalar trace equivalence and does not realize one Hecke
function simultaneously on every finite-length representation. Successful
elaboration cannot supply those omitted contracts.

**Resume with a coordinated plan/supplier revision** permitting edits to the
AS packet, reader and suggested inputs, ET or replacement lower owners, and
all affected requests. After those contracts are reconciled, complete the
retained 44 target and 16 API signature-omission worklist and the AF/ALS
integration obligations below. Preserve the source-qualified hypotheses,
proved conditional adapters and finite fixtures. A further package-only run
on these unchanged inputs has the same scope blocker. No owner move or
supplier correction was installed in this session.

## Current checks

- Read all seven AS entries of the reviewed `data/library-coverage.json`.
  Read the current CompactGroups and OperatorIdeals READMEs in full, and
  inspected current compact integrated-operator declarations.
- Read-only TauCetiRoadmap revision:
  `48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688`; current Tau Ceti:
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
  Neither tree was edited or built.
- Current `TauCeti.ContRepresentation.integratedOperatorₗ` and
  `trace_integratedOperator` use compact groups and, for the trace,
  finite-dimensional representations. Their statements do not provide the
  general real finite-length simultaneous Paley–Wiener realization. A scoped
  current-tree search for orbital integrals, pseudo-coefficients, generic
  packets, pure inner forms and Paley–Wiener found no replacement supplier;
  this is not a comprehensive absence audit.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  exit 0, zero errors/warnings; 190 nodes (36 definitions, 37 constructions,
  117 theorems), 223 API items, 219 tests, 38 planets, 32 baseline declarations,
  52 gaps and 22 requests. All seven stages are planned, none closed. The
  accepted review expressly accepts a target-level inventory with those gaps.
- `lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean`:
  exit 0; zero errors, 741 warnings, all declaration-uses-sorry warnings.
  The helper used the existing shared atlas-pin build, Mathlib `082e2d37e8`
  and Tau Ceti `f790474`. Available memory before compilation: 104 GB.
  No Lean process remains.
- README remains 199,944 UTF-8 bytes; Suggested.lean remains 340,760 bytes.
  Neither mathematical package file nor any authoritative input changed.
  Intake file validation and `git diff --check` passed for this handoff.
- No new primary-source reading is claimed. The cleared-library index was
  read; no restricted book or source passage was copied. Historical primary
  receipts and substantive continuation requirements are retained below;
  repeated claim histories and superseded validation logs were removed.

Current package SHA-256 receipts:

```text
packages/AutomorphicSpectralTheory/README.md
f45d806b569859382544ca77dd97a352784ba29278cbad1e43c3f38729ecf289
packages/AutomorphicSpectralTheory/Suggested.lean
2666e346af5ed6a564f4e815cc39f5994e4b9da00f5416cc3c06931500260edd
packets/AutomorphicFormsOnReductiveGroups.json
e53bde2f09f2a00a0f39cc49cc0e6bc303bac666df24c48a95d4220960d890b4
suggested/AutomorphicFormsOnReductiveGroups.lean
2055cb54dafe5156d30e5c82ac6636e122bb9f64a132b638c9ae70aaa3423fb4
packets/ArithmeticLocallySymmetricSpaces.json
07a7fa47da244817c3ada946da98676606379f31851363121ca87c9c113b9293
```

## Retained continuation evidence

Everything below is inherited evidence from the named preceding sessions.
“Fresh” and “this session” inside those historical records refer to their
original authors, not `codex-DPcpfv`. Earlier AF receipts are superseded by
the current receipts above. The unchanged authoritative AS receipts remain
at the end. Scratch files are disposable; this note contains the resume
requirements and source receipts needed by the next authorized worker.

---

## Changed AF input: use the current receipt

The AF packet has changed since the preceding checkpoint. Its current SHA-256
is `e53bde2f09f2a00a0f39cc49cc0e6bc303bac666df24c48a95d4220960d890b4`;
the older AF packet receipt later in this note is historical. Its review is
`needs_changes`, dated 10 October 2026, by
`independent-review-REV-AutomorphicFormsOnReductiveGroups~3`; that is distinct
from AS's accepted target-level review.

Fresh reading of `AF.1/normalized-real-parabolic-induction` confirms the
previous scope correction remains valid: general real parabolics and supplied
smooth moderate-growth Fréchet Levi realizations, compact picture, covariance
`a^(rho_P+lambda) sigma(m)`, right translation, functoriality, induction in
stages, and the good-module globalization comparison are present. Its native
suggested interfaces include `normalizedInduction.ofLevi`, `ofLeviCarrier`,
`ofLevi_action`, `restrictK` and `transitivity`. Do not restore the obsolete
claim that AF only supplies minimal finite-dimensional principal series.

The AS request for a *holomorphic parameter family on one compact-picture
carrier*, finite-K-type coefficient spaces and parameter-compatible
operator/differentiated relations is still stronger than that node's stated
API. Its fixed-parameter construction does not supply those family theorems.
The two direct affected nodes are `AS.6/real-invariant-paley-wiener` and
`AS.6/real-operator-paley-wiener`. Resolve this as a precise additional supplier
contract, preserving the current normalized-induction design. No new source
reading of Bernstein–Krötz was done in this session; the source receipt below
is inherited.

The tier-11 AF/ALS bundle also retains imports from AS.4–5. Fresh node inspection
finds AF `AF.4/coherent-relative-cohomology` and `AF.4/clozel-rationality`, and
ALS `ALS.5/automorphic-comparison` and `ALS.5/cuspidal-cohomology`, with AS
prerequisites. AS's `AS.5/gl-sl-cuspidal-diagram` imports the last ALS node.
These are additional owner-routing obligations for the tier repair; this
observation is not a claim of a cycle in the exact-node graph. Preserve ALS's
independent `ALS.5/de-rham-comparison`, which supplies AS's Franke construction;
do not move the whole ALS.5 bundle as one object.


---

## Inherited orbital-integral source receipt — codex-85iqLO

Read Arthur, *An Introduction to the Trace Formula* (2005), §18,
(18.1)–(18.3), printed pp.102–104; the singular-element discussion on
pp.106–107; and Theorem 18.2 with its explanation on pp.108–109.
The [Clay PDF](https://www.claymath.org/library/cw/arthur/pdf/62.pdf) was accessed
2026-10-10; SHA-256:
`2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510`.

For the repaired supplier, retain the connected centralizer and the finite
fibres arising from the full centralizer. The quotient measure and its
pushforward to the conjugacy class require unimodularity and local
integrability, cited there to Deligne–Rao; they are not properties of an
arbitrary measured type. The weighted quotient integral requires equality
of the connected G- and M-centralizers, so the weight descends. When that
condition fails, replacing the quotient by the M-centralizer does not justify
convergence. The singular distribution instead uses central shifts and the
finite Levi correction sum of (18.12), supported on the induced class.

The source's full proof inputs remain to be read at their owners: Rao,
*Orbital integrals on reductive groups*, Ann. of Math. 96 (1972), 505–510,
and Arthur's reference [A12], Theorem 5.2, §4 and Lemma 6.1. This session did
not read those auxiliary proofs. This receipt clarifies the repair contract;
it neither establishes their proof closure nor alleges an error in Arthur.
No source passage was copied. Earlier primary-source receipts below belong
to their named sessions.


---

## Inherited simultaneous-trace checks — codex-Dpe6kr

Read Clozel–Delorme, *Le théorème de Paley-Wiener invariant pour les groupes de
Lie réductifs II* (1990), §0 Theorem 1, printed pp.194–195; §5.2 Lemma 6 and
Proposition 4, p.212; Theorem 3, p.213, and its proof, p.214.
The [Numdam primary PDF](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf)
was accessed 2026-10-10; SHA-256:
`dd70f4069fdeec6fc31e44557f239080f5c169743dc8aa2de5b69659da594432`.

Theorem 1 realizes an entire compatible family of traces by a common smooth
bi-K-finite function with prescribed positive support radius. Its image
conditions include the Fourier–Paley–Wiener bound, finite discrete support,
conjugacy invariance and induction relations. For compact center,
Proposition 4 realizes a discrete admissible functional on the Grothendieck
group of finite-length representations. Theorem 3 applies this to the Euler
functional for finite-dimensional coefficients, with vanishing when discrete
series is absent. The proof uses additivity, vanishing on proper induction
and admissibility through Wigner's lemma. This receipt identifies the required
contract; it does not close the auxiliary Borel–Wallach or other proof inputs.
No source passage or section-by-section summary was added to the repository.

Added `general_euler_poincare.SimultaneousTraceChecks` in Suggested.lean:

- `traceAt` gives the two individually invertible scalar maps z ↦ z and z ↦ −z
  on the common space ℂ; `traces` is their joint linear map.
- `image_iff` proves that the joint values satisfy b = −a.
- `incompatible_values` excludes (1,1), `compatible_values` realizes (1,−1),
  and `separate_inverses` shows that coordinate inversion selects different
  test elements. Three examples exercise those results.

These proofs contain no `sorry`. They demonstrate the simultaneity requirement
on a finite scalar fixture, not actual representation characters or the
source theorem. The package reader states that distinction and gives the
correct source locators. Every accepted target/API/test label is retained.


---

## Inherited intertwiner repairs — codex-DqHM0E

The block-permutation operator now uses Mathlib's
`ContinuousLinearEquiv.piCongrLeft`, rather than an admitted construction.
Its coordinate formula is proved with `Equiv.piCongrLeft_apply_eq_cast`.
Both the inducing labels and parameter still move by the inverse permutation.
The point-quotient identity and block-permutation integral tests now compute
actual Dirac integrals; their named theorems and examples have no admitted proofs.

The conditional `local_intertwiner.intertwines` adapter is proved using
`ContinuousLinearMap.integral_apply`, `integral_comp_comm` and evaluation's
`integrable_comp`. It requires an integrable operator field and pointwise
compatibility. Its source space does not need completeness, so that inherited
section instance is explicitly omitted. The local point-quotient identity,
its vector test and example are proved. The continued spherical scalar example
at q=2, z=−1 is also proved: it sends one to 3/4 and does not preserve norm.
Altogether this replaces twelve admitted constructions/proofs/examples.

These are restricted integration and reindexing checks. They do not supply
normalized induction, genuine unipotent quotients, positive chambers, global
Bruhat transport, meromorphic continuation or the spherical shell-identification
proof. The local adapter comment now expressly distinguishes its assumed
pointwise compatibility from deriving the source's equivariance by inducing
covariance and quotient change of variables. No omitted full signature was
reintroduced, and no gap or stage is declared closed.

## Fresh source and library checks

Read Arthur, *An Introduction to the Trace Formula*, §7, pp.33–35
(equation (7.2), Lemma 7.1 and Theorem 7.2), and §21, pp.134–135
(the local integral preceding Theorem 21.4 and equation (21.11)), in the
[public Clay PDF](https://www.claymath.org/library/cw/arthur/pdf/62.pdf).
The source's operators use induced compact pictures and actual unipotent
quotients; its local normalization results concern representation-qualified
families. This confirms why the concrete tests cannot replace those carriers.
The existing recorded outer-rho source issue E37 is not changed by these repairs.
PDF SHA-256: `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510`.
No source passage is reproduced. No restricted book was used or copied.

Read all seven AS entries in the reviewed library audit. Read the current
CompactGroups and OperatorIdeals upstream READMEs in full, and checked their
suggested interfaces before using native operations. Their generic compact-group
and operator-ideal plans remain their own. The actual Mathlib declarations used
above were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`; their source files
have no working-tree modifications. Current read-only HEADs remain
TauCetiRoadmap `201bcaee1f4014c91897d50cdb7631fc6d6a6d71` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A case-insensitive search of their
Lean files and READMEs for orbital integration, pseudo-coefficients, Paley–Wiener,
pure inner forms and classical packets found only a bibliographic reference in
AdelicAlgebraicGroups, not a supplying target. Neither tree was edited or built.


---

## Inherited sigma-finiteness repair — codex-0OeJbF

`decomposable_operator.norm_eq_essSup` now requires `[SigmaFinite μ]`,
matching the accepted `AS.0/decomposable-operator` hypotheses and README
AS.0.3. The inherited signature quantified over every measure, although the
reverse norm inequality requires enough finite-measure test sections.

Three new admission-free checks in `signatureChecks` use native Mathlib scalar
L², independently of the admitted field/direct-integral constructions. For
μ = ∞·δ₀ on ℝ, every finite-L² class is zero; the essential supremum of the
constant-one field is one; μ is not σ-finite; and the identity operator on that
zero L² space has norm zero. The helper `infiniteAtom_lp_zero` proves the first
claim, and the three examples prove the remaining statements. The isolated
helper's axiom receipt contains only `propext`, `Classical.choice` and
`Quot.sound`, with no `sorryAx`. This witnesses the failure of the unrestricted
norm formula; it does not prove the general decomposable-operator theorem.

Fresh primary reading: David N. Yetter, *Measurable Categories*,
[arXiv v2](https://arxiv.org/pdf/math/0309185v2), Introduction p.2;
§2 Definition 1 pp.2–3, Definition 2 p.3 and Example 4 p.4;
§4 Definition 26 p.13 and Theorem 27 pp.13–14. The introduction assumes
σ-finiteness for the measure-theoretic results. Definition 26 constructs the
quotient; Theorem 27 gives the induced functor and its norm bound. The reverse
norm inequality in AS.0.3 is a planned fundamental-sequence argument, rather
than a verbatim assertion of Theorem 27. Corrected the three README locators,
including the erroneous extra p.3 on the §4 citations. Accessed 10 October
2026; PDF SHA-256
`a3b59a3b059e2d10c55abdd688415c1e20d23e0a536cf9afd09950a5fbae6bf3`.
All repository mathematics is in our own words; no source passages were copied.


---

## Inherited Jiang–Zhang signature omissions

The preceding checkpoint read Jiang–Zhang, arXiv:1508.03205v4, Appendix B, pp.84–87.
Removed five active target signatures asserting conclusions for arbitrary
exponent sets or independently supplied operator/scalar families. Each name
now has an explicit omission comment giving the actual required carriers and
source locator. The mathematical targets remain unchanged in the README;
four locators now include the exact printed pages. No theorem's conclusion
was installed as its own hypothesis, and no proposition-valued placeholder
was introduced.

| Omitted signature | Required interface |
| --- | --- |
| `generic_standard_module` | Relevant generic parameter and pure-inner-form packet; actual standard-module realization and unitary tempered coefficients. Proposition B.1, p.85 supplies irreducibility; (B.5)–(B.6), p.86 supplies the strict ordered exponent bounds in the theorem's unitary setting. |
| `tempered_gl_intertwiner` | Actual rank-one GL intertwiner with unitary tempered data and the indicated Mœglin–Waldspurger normalization; (B.7)–(B.9), pp.86–87. |
| `tempered_standard_intertwiner` | Actual standard integral for unitary tempered GL and classical packet data, with the generic-member factor comparison; proof of Theorem B.2, p.87. |
| `generic_normalized_intertwiner` | Actual Shahidi-normalized operator for the relevant generic unitary coefficients; proof of Theorem B.2, p.86, citing [11, Theorem 11.1]. That cited primary proof was not independently read here. |
| `jiang_zhang_holomorphy` | Local component of an H_m-relevant generic global Arthur parameter, pure-inner-form packet, irreducible admissible unitary generic self-dual GL coefficients, standard integral and matching (5.4) factors; Theorem B.2, p.85 and proof pp.86–87. |

Five inherited admission-free examples reject the removed unrestricted assertions:
`{0}` fails the strict positive exponent bound; the zero operator family
fails nonvanishing in each of the three half-planes; and the actual scalar
normalization formula with all factors one and zero raw operator remains zero.
These are signature checks, not implementations of the five source theorems.
The other active inherited signatures still require the audit below.

Inherited source receipt: [Jiang–Zhang v4](https://arxiv.org/pdf/1508.03205v4),
read 10 October 2026, SHA-256
`d97bf3048aa10de52f07ae5bbbc3970c974996ae4193d9cd7f12b17890df7bb4`,
matching the packet. This reading is of the specified preprint, not a
collation of the journal version. The earlier Bernstein–Krötz reading used
[arXiv v3](https://arxiv.org/pdf/0812.1684v3), §9.3, Proposition 9.6,
pp.39–40; the prior Arthur reading used the
[Clay introduction](https://www.claymath.org/library/cw/arthur/pdf/62.pdf),
§18 (18.3), pp.102–104. All repository statements are in our own words.

## Inherited Arthur signature repairs

| Omitted signature | Required interface and verified source |
| --- | --- |
| `eisenstein_continuation` | Actual global Eisenstein series and intertwining integrals from discrete inducing data, coherent Weyl transports, finite K-type blocks and local common denominators; arbitrary E/J are insufficient. Arthur 2005, §7 Theorem 7.2(a), (7.3)–(7.4), p.35. |
| `truncation_cones.alternating_sum` | Compatible root datum, parabolic incidence interval, quotient heights and rank-zero exception; arbitrary singleton weights do not cancel. Arthur 2005, §6 Identity 6.2, (6.3), p.31. |
| `truncation_projection` | Genuine rational constant terms, compatible cones and coset incidence, sufficiently regular T; finite arbitrary data is insufficient. Arthur 2005, §13 Proposition 13.1(a)–(c), pp.68–69. |
| `truncation_rapid_decay` | Smooth uniform-moderate-growth carrier, coherent reduction height and Siegel sets, regular T and finite derivative seminorm bounds. Arthur 2005, §13 Proposition 13.2(a)–(b), (13.5)–(13.6), p.71. |
| `cuspidal_maass_selberg` | Gram vectors and the full Weyl sum built from the same cuspidal Eisenstein/intertwining datum, regular T and generic parameters before continuation. Arthur 1982, Introduction (1), pp.35–36; §9, pp.68–69. |
| `discrete_maass_selberg_asymptotic` | Actual Gram/omega families from fixed cuspidal support and finite K-types, imaginary parameters and a deep regular cone. Arthur 1982, §9 Theorem 9.1, p.69. |
| `singular_parameter_limits` | The complete Maass–Selberg identity with compatible common denominators and derivative/residue majorants; an arbitrary finite sum can retain a pole. Arthur 1982, §§3–6; §9 regularity discussion, pp.68–69. |

Six inherited proved examples in `TauCeti.AutomorphicSpectral.signatureChecks` reject
these unrestricted templates without invoking any admitted declaration:

1. One proper parabolic/coset, rank one, constant term twice identity and cutoff
   one give Λf=−f. Coset support is finite, but Λ²1=1 differs from Λ1=−1.
2. The same datum on ℝ and height x on [1,∞) has no exponent-one decay bound
   for f=1; at x=max(C,1)+1 every proposed bound C fails.
3. A rank-one singleton with both cone indicators one has alternating sum −1.
4. The Gram pairing of two scalar ones is one, while an empty Weyl sum is zero.
5. Constant Gram error one and zero inducing vectors violate every purported
   exponential-error estimate, even arbitrarily deep in the one-dimensional cone.
6. A singleton sum 1/s cannot have an analytic extension at zero: multiplying
   by s forces both limit zero and limit one.

The README records these acceptance constraints and more precise Arthur page
locators. Existing ownership and parameter/measure conventions are retained.
The continuation signature remains omitted rather than receiving a theorem
hypothesis that merely assumes continuation. Reaudit other active inherited
signatures: the prior pass did not certify all then-active targets.

## Inherited repairs through #8266

Twenty target and three API prototypes asserted identities for unrelated data.
For example, arbitrary modules were declared isomorphic, arbitrary kernels
integrable, and arbitrary scalar functions removable at 1. Removed those 23
active signatures and replaced them with explicit source-qualified omission
comments. Every mathematical target/API/test name stays in its README block;
this is a reduction of unsafe prototype assertions, not closure of the missing
mathematics.

| Omitted signature | Required source-qualified interface |
| --- | --- |
| `weighted_regularization` | Supply the weighted smooth and graph de Rham complexes built from the same arithmetic quotient, admissible weight and coefficient system, with convolution and Sobolev homotopies. Independent complexes need not have isomorphic cohomology. Source: Franke §2.2 theorem, p.190; §2.3 Theorem 3, p.193; §3 Theorem 4, p.198. |
| `derived_finite_character` | Supply the actual derived J-power torsion functor and the filtered Ext system in the (g,K)-module category. Independent cochain complexes cannot express this comparison. Source: Franke §4, Theorem 7(1)–(3), equations (3)–(4), pp.208–209. |
| `eisenstein_principal_value.graded_independent` | Supply two transverse restrictions of the same meromorphic Eisenstein jet and the corresponding next Franke filtration step. Arbitrary germs and a submodule do not make their principal values equal modulo that submodule. Source: Franke §6, equation (13), Theorem 14 and proof Step 3, pp.235–237. |
| `franke_graded_isomorphism` | Supply the weighted finite-J graded quotient, the indexed induced discrete modules, finite-order holomorphic functionals, Weyl colimit and principal-value map. The source proves that map is an equivariant isomorphism, not that arbitrary modules are linearly isomorphic. Source: Franke §6, Theorem 14, equation (14), p.236. |
| `weighted_finite_character_acyclic` | Supply R^i Fin_J of the actual weighted smooth automorphic module with r in the closed positive chamber (and the extra root-cone interior for the minus-log space). This is acyclicity for central torsion; an arbitrary positive-degree cochain cohomology group need not vanish. Source: Franke §7, Theorem 16, p.246. |
| `constant_term_resolution` | Supply the deep-cusp constant-term quotient and the inverse system over proper standard parabolics, with the actual constant-term transition maps and admissible weights. The source identifies its inverse limit and proves its higher derived limits vanish; independent cochain complexes are not this resolution. Source: Franke §7.1, Theorem 17, equations (2)–(3), p.247. |
| `franke_comparison` | Supply inclusions of finite-J automorphic, uniform-moderate and smooth functions on one arithmetic quotient, relative cochains with balanced E and J=Ann(E dual), full disconnected K invariants and the ALS de Rham map. This is ordinary cohomology and compatibility of those inclusion maps. Source: Franke §7.4, Theorem 18, pp.255–256. |
| `gl_sl_cuspidal_diagram` | Supply the level-one trivial-coefficient GL_n and SL_n cuspidal cohomology groups, the O(n)/SO(n) action and the archimedean cohomological representations. Their dimension relation cannot be asserted for unrelated natural numbers. Source: Boxer–Calegari–Gee, Remark 1.2, pp.511–512. |
| `franke_schwermer_support` | Supply the finite-J automorphic module and the Weyl-associate cuspidal-support summands generated by Eisenstein Laurent coefficients. An arbitrary subset of a module does not span it. The primary FS98 theorem remains a recorded source gap. Source: Calegari–Gee–Harris, §3, proof of Lemma 3.1, citing FS98 Theorem 2.3. |
| `isobaric_realization` | Supply an ordinary-cohomology Hecke eigenclass and its cuspidal-support summand, with the GL_n/PGL_n central convention and unramified Hecke-to-Satake comparison. The source selects an isobaric representation; arbitrary prescribed Satake data and independently chosen cuspidal data need not agree. Source: Calegari–Gee–Harris, §3, proof of Lemma 3.1. |
| `l2_lefschetz` | Supply the finite-dimensional L2 relative cohomology, actual Hecke operator, discrete automorphic multiplicities, Euler–Poincare traces and common invariant Hecke test, with compact-Cartan, coefficient, level and split-center hypotheses. Independent numerical traces need not satisfy either equality. Source: Arthur 1989, §2 Proposition 2.1, p.264; §3 Proposition 3.2; §6 Theorem 6.1. |
| `yu_025` | Supply the everywhere-unramified function-field GL_n arithmetic quotient, degree fibres, coherent quotient Haar and the actual truncated kernel and degree lattice. An arbitrary kernel can be nonintegrable; its integral need not be quasipolynomial. Source: Yu v5, §3.2.1, equations (3.2.1)–(3.2.2), pp.15–16; Theorem 3.3.1, p.18. |
| `yu_038.continueInT` | Supply the characteristic-polynomial-refined group/Lie kernel on the common function-field bundle quotient, its deep-chamber integrability, and the root degree lattice and quasipolynomial determination theorem. An arbitrary deep function need not agree eventually with any quasipolynomial. Source: Yu v5, Appendix B, pp.78–79; Theorem 3.3.1, p.18. |
| `yu_050` | Supply the holomorphic multiplicative (G,M)-family on its complex-torus domain, actual coroot denominators, adjacency, partial Levi restriction and regularized sum. An arbitrary scalar function need not have a removable singularity. Source: Yu v5, §4.2.1–4.2.2, Theorem 4.2.2, equations (4.2.2)–(4.2.5), p.23. |
| `yu_051` | Supply two compatible families, the product regularized value and partial Levi values, with c_M^Q independent of Q for each L. An independent productValue is not a regularized value of these families. Source: Yu v5, Proposition 4.2.3 and proof, pp.23–24. |
| `yu_052` | Supply the relative root set, its genuine basis subsets, the normalized root functions and the constructed family value. Root regularity and value one do not relate an arbitrary scalar to an arbitrary list of subsets. Source: Yu v5, Theorem 4.2.4 and proof, pp.24–26. |
| `yu_054` | Supply meromorphic root functions on a neighbourhood of the closed disk with no contour zeros or poles, their zero/pole multiplicities, the ratio family and its probability-Haar integral, with the actual root-basis subsets. Source: Yu v5, Corollary 4.2.6, p.27, with the packet disk-extension correction. |
| `yu_055` | Supply the root-product family, actual central torus, translated domain, partial-value independence and translation invariance. Noncentral vanishing and central homogeneity cannot relate arbitrary scalars and a boolean. Source: Yu v5, Lemmas 4.2.7–4.2.8 and proofs, pp.27–29. |
| `yu_151.regularizedFamily` | Supply the torus family, adjacent-wall holomorphy, stabilizer and Weyl transports for which the full parabolic trace sum has a regular extension. Arbitrary scalar weights and matrix functions can have a pole; a totalized limit does not remove it. Source: Yu v5, §5.2.1–5.2.3, pp.32–36. |
| `yu_063` | Supply the everywhere-unramified spectral class, fixed central quotient, normalized induced families, actual finite covers and stabilizers, coherent probability Haar and convergence. An independent Jeta cannot equal an unrelated zero spectral sum. Source: Yu v5, Theorem 4.3.1, pp.30–31; §5.2.1–5.2.3, pp.32–36. |
| `yu_165` | Supply the twisted kernel integral and the actual Lafforgue spectral families and ordered Weyl/twist transports, compatible characters, Haar and absolute convergence. Independent numerical Jeta is not the trace of these operators. Source: Yu v5, §5.1–5.2, pp.31–36. |
| `yu_169` | Supply the actual type-A relative-root denominator, parabolic chamber selector, regular direction and dimension equality. Arbitrary selected sets and unrelated denominators do not give the root-basis indicator identity. Source: Yu v5, §4.2.3, proof of Theorem 4.2.4, pp.24–26. |
| `yu_039` | Actual group/Lie characteristic-polynomial traces, nilpotent contribution and semistable Higgs groupoid mass, with finite field, coprime degree and normalized measures. Independent trace/mass scalars do not satisfy the identities. Source: Yu Appendix B, p.79, citing Ch15 Theorem 6.2.1 and Corollaries 5.2.2–5.2.3. |

## Proved conditional adapters and native checks

`franke_filtration` now proves its submodule closure fields. Its
`levi_compatible` adapter assumes equality of the coefficient maps for every
exponent below the cutoff, after using a common index transport. The proof
identifies the actual vanishing conditions. This assumption must be supplied
by the genuine root/Levi constant-term theorem; it is not a proof of that theorem.
A counterexample distinguishes identity and zero coefficient maps at cutoff 1.

`gm_family.rank_one_limit` proves the punctured limit of
c₊(z)/z+c₋(z)/(−z) is c₊′(0)−c₋′(0). The actual adjacent-wall equality gives
c₊(0)=c₋(0); native `HasDerivAt.tendsto_slope_zero` supplies the derivative limit.
It consumes the libraries' analytic/derivative API and introduces no second
owner. `rank_one` now uses this proof for its limit component; its principal-value
component remains admitted. The inherited `eisenstein_principal_value` is a
provisional Laurent-coefficient construction, so `rank_one_product` and
`affineFamily_zeroValue` still depend on `sorryAx` even though their proof bodies
have no admissions. Preserve the distinction between a native punctured-limit
proof and an admitted principal-value theorem.

`affineFamily_limit` and three positive checks use the native limit directly:
slopes (3,1) with wall value 2 give limit 2; equal slopes give 0; multiplying
families with wall values 2,5 and slopes (3,1),(7,4) gives limit 16, rather than
multiplying the two regularized values to get 6. The standalone `#print axioms`
receipt for `rank_one_limit`, `affineFamily_limit` and `levi_compatible` lists
only `propext`, `Classical.choice` and `Quot.sound`, with no `sorryAx`.

Six inherited proved negative checks reject unrestricted templates:

1. `(Fin 0 → ℂ)` is not linearly isomorphic to ℂ.
2. The span of the empty subset of ℂ is not the whole module.
3. Independent natural-number dimensions need not be equal, already defeating
   the odd-rank BCG dimension template.
4. Identity and zero coefficient maps need not induce equal Franke steps.
5. Constant one on ℕ with counting measure is nonintegrable. Constant degree
   zero makes the degree restriction the whole space, so it does not fix this.
6. `(z−1)⁻¹` has no analytic extension at 1. Multiplying a hypothetical extension
   by z−1 gives limit zero, while its punctured values are constantly one.

The README records the coefficient condition and representative negative checks,
and supplies the verified Franke/Yu locators. Its introductory prose was shortened
without dropping ownership, measure, parameter or target conventions.

## Complete signature omission inventory

Names are relative to `TauCeti.AutomorphicSpectral`. Target statements remain
in the README. These omissions require the carriers described above or in the
ownership worklist; do not replace them with opaque `Prop` fields or hypotheses
that merely restate the intended conclusion.

44 target signatures (including the five Jiang–Zhang omissions above):

```text
eisenstein_convergence
cuspidal_constant_term
pseudo_eisenstein_l2
pseudo_eisenstein_inner_product
local_normalization
eisenstein_continuation
truncation_projection
truncation_rapid_decay
cuspidal_maass_selberg
discrete_maass_selberg_asymptotic
singular_parameter_limits
weighted_regularization
derived_finite_character
franke_graded_isomorphism
weighted_finite_character_acyclic
constant_term_resolution
franke_comparison
gl_sl_cuspidal_diagram
franke_schwermer_support
isobaric_realization
real_invariant_paley_wiener
real_operator_paley_wiener
coarse_trace_identity
gm_splitting
fine_geometric_expansion
fine_spectral_expansion
invariant_trace_formula
compact_trace_specialization
l2_lefschetz
yu_025
yu_039
yu_050
yu_051
yu_052
yu_054
yu_055
yu_063
yu_165
yu_169
generic_standard_module
tempered_gl_intertwiner
tempered_standard_intertwiner
generic_normalized_intertwiner
jiang_zhang_holomorphy
```

16 API signatures:

```text
convergent_intertwiner.intertwines
convergent_intertwiner.identity
convergent_intertwiner.holomorphic_chamber
local_intertwiner.meromorphic_coefficients
truncation_cones.alternating_sum
arthur_truncation.local_finite
eisenstein_principal_value.graded_independent
spectral_multiplier.support
automorphic_kernel.operator
coarse_truncated_kernel.decomposition
coarse_truncated_kernel.levi_translation
gm_family.regularized_sum
weighted_orbital_integral.splitting
yu_038.continueInT
yu_151.regularizedFamily
dit_91.kernelSymmetry
```

`identity_quotient` remains a point-quotient model. Local integral, locally
finite truncation, finite-radius inverse transform, two-place quotient/Levi and
spatial modular-kernel interfaces remain necessary. An active name or a
`sorry`-only elaboration is not a source-fidelity certificate.

## Preserve the Eisenstein adapters from #8238

The inherited `eisenstein_series` is a numerical weighted `tsum` over any
`r : J → G` and `InductionData`. Its three API signatures previously asserted
linearity, automorphy and right equivariance without the necessary hypotheses.
A comment about the intended chamber did not restrict those signatures.

Earlier checkpoints proved three conditional numerical adapters:

- `eisenstein_series.linear` requires summability of the two vector summands.
  It uses native `Summable.mul_left`, `Summable.tsum_add` and `tsum_mul_left`.
  The totalized `tsum` cannot justify unrestricted linearity for divergent sums.
- `eisenstein_series.automorphic` requires an equivalence `e : J ≃ J` and the
  translated height/evaluation equalities for the reindexed representatives.
  The proof uses `Equiv.tsum_eq`. The genuine rational-coset interface must
  supply these equalities for rational translations.
- `eisenstein_series.right_equivariant` requires the pointwise weighted
  translation identity for the normalized inducing action. The proof uses
  `tsum_congr` and associativity. This proves the adapter; `induced_family`
  itself remains a provisional construction.

No opaque proposition or new generic owner is introduced. The standalone
`#print axioms` checks for `linear` and `automorphic` list only `propext`,
`Classical.choice` and `Quot.sound`, with no `sorryAx`. All three adapter
proof bodies and all three added examples contain no admissions; this does not
certify the admitted induction construction or the full automorphic theorem.

The proved examples distinguish the complete-coset use from an arbitrary list:

1. On the multiplicative presentation of ℤ, use height/rho zero, scalar vector
   1 and evaluation φ(n)=n. A representative list consisting only of the identity
   has value 0 at the identity and 1 after translation by the additive integer 1.
   This is a concrete counterexample to the former universal automorphy API.
2. On the multiplicative presentation of ℤ/2ℤ, use the scalar vector v and
   evaluation v at the identity, zero elsewhere. Summing both representatives
   gives v before and after the nonidentity translation.
3. The same full two-element orbit satisfies the new automorphy API using the
   swap equivalence, with both covariance hypotheses proved.

README AS.1.2 retains the full source theorem and the original three named
specification tests, explains the adapter hypotheses and adds the three checks.
Its locator now identifies Arthur §7 equation (7.1), printed p.33, and
Lemma 7.1, printed p.34. Introductory prose was shortened to stay within the
200,000-byte ceiling without dropping targets, APIs or test names.

**Still needed:** the actual rational coset carrier, representative covariance,
normalized inducing action and chamber theorem supplying these hypotheses.
The numerical adapters do not construct those suppliers.

## Ownership and supplier worklist retained from preceding checkpoints

AS is tier 13; AF/ALS tier 11, AL tier 12, ET tier 14. QM/ER are outside the
ordered family. The preceding handoff's substantive continuation requirements
are retained here without its duplicated chronological records:

1. Move the ordinary orbital integral and pseudo-coefficient inputs used by
   AS.6 down from ET.1, with exact source-qualified targets, APIs and tests;
   keep stabilization in ET. Separate the early real Paley–Wiener/multiplier
   prefix from the weighted trace suffix. The proposed AS.1a prefix is not
   integrated.
2. ET.0 conjugacy data do not supply general/tempered classical packets,
   relevance or pure inner forms. The requested Part II has no supplying node.
3. Replace QM I/J-Bessel, Kloosterman and Laplacian and ER congruence Eisenstein
   continuation dependencies with rank-one AS targets or lower-tier suppliers.
   **K already belongs to `AL.0/bessel-k`; preserve that owner.**
4. Extend AF's now-general real compact-picture induction with one fixed
   carrier and holomorphic finite-K-type families over the complex dual, and
   the differentiated relations needed by operator Paley–Wiener. Preserve
   its existing K∩M covariance, half-modulus and induction-in-stages interfaces.
   The current AF evidence and Proposition 9.6's hypotheses are recorded above.
5. SR excludes Plancherel and supplies no BDK regular trace-image theorem.
   SmoothRepresentationsCharactersPartII remains an undesigned supplier for
   AS.6's finite-component trace-image input.
6. AL.3 GL×GL factors do not supply GL×classical, exterior/symmetric-square or
   Asai factors with packet compatibility. AA reduction theory and SR's local
   geometric lemma do not supply global rational Bruhat/adelic-measure comparison.
7. GN/Fuchsian Part II's quadratic-core/oriented-cycle/genus-sign input lacks
   an exact supplier node; cusp/polygon geometry does not supply it. Retain
   conditional finite-cusp geometry in the DIT application.
8. AS.1.10 needs the actual rational Weyl-associate cuspidal carrier, its
   pseudo-Eisenstein generators and common measures, and the source proofs of
   orthogonality and density. Equality of closed generated spans is not itself
   Weyl association of representations.
9. Reconcile the spatial modular resolvent and continued Whittaker carriers
   with the full source targets, retaining valid initial-integral hypotheses
   and the complement spectral-gap restriction.

These are specification/ownership revisions, not requests to prove future
roadmap theorems. A package-only continuation cannot edit their authoritative
contracts. Route this work to a job authorized to edit the affected plan and
supplier contracts before rescheduling completion of this package.

## Preserve the preceding native repairs

- `cuspidal_data_orthosum` consumes an `OrthogonalFamily` of closed generated
  subspaces and density of the span of their union. The proved adapter uses
  native `IsHilbertSum.mkInternal`; `toHilbertSumEquiv`, `inverse_single` and
  `inverse_hasSum` expose the native unitary `lp` identification and summation.
  Its three proved tests reject repeated nonzero blocks and zero total
  generators and assemble the single full block in ℂ. This conditional
  Hilbert-sum construction is not the full automorphic decomposition theorem.
- `SelfAdjointGraph` uses native `IsSelfAdjoint` of `LinearPMap`. The spectral
  (A−zI)⁻¹ convention is proved to be minus native (zI−A)⁻¹ using both inverse
  equations and the native witness. `dit_91` has proved inverse, local analytic
  and `operatorAdjoint` adapters. Keep the spectral gap on the complete
  complement; an eigenvalue embedded in continuous spectrum requires the
  separate spatial weighted/test-space kernel continuation and symmetry.
- The current-library scalar Nevanlinna existence theorem is consumed, not
  planned again. The finite-ρ kernel/`withDensity` convention adapter still
  needs uniqueness/application integration; its density tests remain.
- Polynomial-growth multiplier transport does not supply all differentiated
  coefficient relations or the finite-radius inverse Hecke transform.
- `gz_192.guardedPairSeries` uses native `IsFundamentalDiscriminant`, retaining
  the 12/16 check; primitive quadratic characters remain to be constructed.
- `SpecialFunctions` constrains I/J by principal-power regularized
  hypergeometric formulas, K by AL.0's Mellin integral and Λ by native completed
  zeta. Keep its convention checks and proved `completedZeta_not_zero`.
  `dit_113` retains y>0 and Re(ν+1/2)>0 for the initial Whittaker integral,
  DIT11 Appendix A (A.2), printed p.977. The unrestricted continuation target
  needs a genuinely continued carrier and exceptional-parameter treatment.
- Generic PVM/Borel/unbounded self-adjoint theory belongs to
  SelfAdjointSpectralTheory SA-B01–SA-B36 and SA-E01–SA-E47; generic
  Schatten/Hilbert–Schmidt theory belongs to OperatorIdeals, including
  OI-B29–OI-B52, OI-B83/OI-B90 and OI-C01–OI-C14. Joined compatibility sketches
  ultimately consume those structures. AS owns measurable multiplicities,
  direct-integral and L²-kernel/complex-trace applications.

## Sources and library provenance

Inherited primary readings from earlier checkpoints:

- Arthur, *An Introduction to the Trace Formula*,
  [Clay PDF](https://www.claymath.org/library/cw/arthur/pdf/62.pdf): §6 Identity 6.2
  and (6.3), p.31; §7 Theorem 7.2(a), (7.3)–(7.4), p.35; §13 Proposition
  13.1 and its proof, pp.68–69, and Proposition 13.2, (13.5)–(13.6), p.71.
  Identity 6.2 itself is subset cancellation, not a cone theorem for arbitrary
  indicators; the cone application uses root/parabolic compatibility in §13. The projection
  proof uses coherent rational constant terms and Bruhat/reduction arguments.
  SHA-256 `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510`.
- Arthur, *On the Inner Product of Truncated Eisenstein Series*,
  [Clay PDF](https://www.claymath.org/library/cw/arthur/pdf/12.pdf): Introduction
  (1), pp.35–36; §9 formulas and regularity discussion, pp.68–69, and
  Theorem 9.1, p.69. Exactness for cuspidal data and the controlled error for
  general discrete data refer to the actual truncated Eisenstein pairing.
  SHA-256 `f0693c409f3cbae9e8cedbc1c2eceec4657f79fdc361fcb0ffc89f40b044547c`.

Inherited primary-source receipts from #8266:

- Franke, *Harmonic Analysis in Weighted L²-Spaces*, Ann. ENS 31 (1998),
  [public PDF](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf):
  §2.2 cohomology theorem p.190; §2.3 regularization/Theorem 3 pp.191–194;
  §3 (16)–(17)/Theorem 4 pp.197–198; §4 Theorem 7(1)–(6), (3)–(6)
  pp.208–209; §6 (13)–(14)/Theorem 14 and transverse-direction proof
  pp.235–237; §7 Theorem 16 p.246; §7.1 Theorem 17 (2)–(3) p.247;
  §7.4 Theorem 18 pp.255–256. Derived Fin_J acyclicity is not arbitrary
  cochain acyclicity; principal values become independent only in the specified
  graded quotient; the comparison is ordinary cohomology of the actual inclusions.
  SHA-256 `3c0465f6413bf156d8574f4bc94f1768cb7ff650deec645e46171b24f269c58b`.
- Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*,
  [arXiv v5](https://arxiv.org/pdf/1807.04659v5), 18 July 2022:
  §3.2.1 (3.2.1)–(3.2.2) pp.15–16; Theorem 3.3.1 p.18;
  §4.1.5–4.1.6 p.22; Definition 4.2.1, (4.2.1) and Theorem 4.2.2
  p.23; Proposition 4.2.3 pp.23–24; Theorem 4.2.4 pp.24–26;
  Corollary 4.2.6 p.27; Lemmas 4.2.7–4.2.8 pp.27–29;
  §5.2.2–5.2.3 (5.2.9)–(5.2.10), Theorem 5.2.2 pp.32–34,
  and the surrounding Fourier comparison; Appendix B pp.78–79.
  Retain the packet's disk-extension correction to Corollary 4.2.6;
  an annulus alone does not supply the argument-principle input.
  SHA-256 `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`.
- Boxer–Calegari–Gee, *Cuspidal cohomology classes for GL_n(Z)*,
  [author offprint](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf),
  Remark 1.2 pp.511–512: level one, trivial coefficients, the O(n)/SO(n)
  action and actual cohomological constituents are essential.
  SHA-256 `4d27afabbef371babf3a73dad19bc8ccee180636be27bd6ebee17f58f7150290`.

The public PDFs' hashes match the packet. All repository mathematics is stated
in our own words. The maintainer's library index was read; no restricted book
was needed, copied or excerpted. FS98 remains a primary-source gap; CGH's
citation of its Theorem 2.3 is not a fresh primary-source verification.

Inherited source receipts from earlier checkpoints: Arthur's Clay introduction
§7 (7.1) p.33/Lemma 7.1 p.34; §12 Lemma 12.4/(12.4) pp.64–66;
§17 Lemma 17.1 p.94, Lemmas 17.4–17.6 pp.97–101; §14 Theorem 14.1
pp.74–77; §16 (16.1) pp.88–89; §19 Corollary 19.3/(19.10) p.115;
§21 Theorem 21.6/Corollary 21.7 pp.137–138; §23 Theorem 23.4 and
(23.11)–(23.13) pp.151–153. PDF SHA-256
`2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510`.
Keep the packet's a_M^L determinant correction and separate spectral convergence
conditions. DIT §8 (8.2)–(8.4) pp.973–974 and Appendix A (A.2) p.977
support the inherited modular-resolvent/Whittaker repairs. These readings are inherited; this session did not recheck Arthur,
DIT, Fay or Hejhal.

## Resume after supplier revisions

First integrate authorized plan/supplier revisions for the ownership moves,
real inducing families, omitted AF/ALS cochain and arithmetic/root-family
interfaces, AS.1.10's associate-class carrier and `dit_113`'s continued carrier.
Then encode genuine maps and hypotheses in every omitted signature, retaining
the full source theorem. Audit the remaining active compatibility sketches;
they were not all certified by this pass. Preserve the proved native adapters,
negative checks, measure conventions and conditional Hilbert-sum assumptions.
Finish remaining page locators and the full package checklist, rerun Lean and
inventory checks, and add metadata only when the package is complete.

Immutable authoritative-input SHA-256 receipts:

```text
packets/AutomorphicSpectralTheory.json
c3b928e23edff50069469d0e6d6afa7dd095015d4b1d539ee044a66b24fe5e2d
readmes/AutomorphicSpectralTheory.md
7a64bbcd6818769c8b9a5922133c9839f7bda0539aa20a7541c9cd69fd768479
suggested/AutomorphicSpectralTheory.lean
4403c00620e192a1121e3891b5262c60da56511010e948ac8c36cec07e53055f
```

Disposable scratch scripts/logs are not continuation inputs. The persistent
worklist, exact omissions and source receipts above contain everything needed
to resume.
