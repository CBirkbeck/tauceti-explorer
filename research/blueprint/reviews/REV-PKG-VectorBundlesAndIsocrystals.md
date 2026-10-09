# Independent package review: Isocrystals, vector bundles and Banach–Colmez spaces

**Verdict: needs_changes.** Codex, session `codex-invgaU`, 2026-10-09.
This reviewer did none of `PKG-VectorBundlesAndIsocrystals`. The bot confirmed
the claim on [issue #7542](https://github.com/CBirkbeck/tauceti-explorer/issues/7542#issuecomment-6073809269)
before work began. This is a completed independent review, not a checkpoint.

The [README](../packages/VectorBundlesAndIsocrystals/README.md) transfers the
accepted mathematical plan, and the whole suggested file elaborates. However,
several executable signatures assert results for arbitrary algebraic inputs
that the source theorems do not support. Concrete counterexamples below show
why the signature check fails even with a successful Lean run. The two clear
corrections made during this review do not resolve that broader problem.

## The six package checks

| Check | Result and evidence |
| --- | --- |
| 1. Upstream form and size | Pass. Compared with Tau Ceti's HodgeStructures and ReductiveGroups roadmaps and the relevant ClassFieldTheory ownership notes, using UPSTREAM_GUIDE. Purpose, boundaries, notation, construction order, native starting points, layers, definitions/APIs, examples, sources and prerequisites are present. The corrected README is 193,499 bytes, below the stricter decimal 200,000-byte limit. |
| 2. Fidelity of the README | Pass after the ownership correction below. All 127 distinct accepted targets, 168 API entries and 124 tests/examples transfer from the two accepted revision-two parts. Statements, hypotheses, source locators and prerequisite identities were compared, including hypotheses collected at subsection level. Existing link maps do not add another owner. |
| 3. Own words and source locators | Pass after the GLX correction below. Each target has a source block with section/theorem/page locators. The prose states mathematical targets and arguments in its own words rather than reproducing source passages or giving a section-by-section account of a paper. Source editions and selected hypothesis-sensitive passages were checked independently; see the source record below. |
| 4. No process in the README | Pass. No packet paths, job identifiers, reviews, checkpoints or library-coverage statuses occur in the reader. The uses of chart coverage describe mathematical coverage. |
| 5. Suggested Lean | **Fail on mathematical signatures; pass on elaboration.** Independent final `lean-check` returned exit 0, no errors, 231 warnings, all `declaration uses sorry`. Some types are false universal statements instead of faithful supported components of the README targets. |
| 6. Metadata | Pass unchanged. The file is exactly the single line `topic = "math.NT"`, fitting this arithmetic-geometric roadmap. |

## Corrections made in place

1. The scope paragraph attributed arithmetic Lubin–Tate reciprocity to Tau
   Ceti's ClassFieldTheory. That roadmap expressly leaves Lubin–Tate theory
   outside its scope. The package now imports its arithmetic Artin map for
   local reciprocity and places Lubin–Tate theory with the already named
   R07.1–R07.2 prerequisites. The geometric universal-cover construction stays
   here.
2. GLX was listed as a 57-page source without a passage explaining its use.
   The specified arXiv v3 has 56 pages. The boundary paragraph now identifies
   its tensor-isocrystal consumer at §5.1, pp.31–32, and its reference link is
   defined. Filtered G-isocrystals remain with the neighbouring owners.
3. `PureModel.bounded` used an arbitrary `Bornology.IsBounded` instance on the
   ambient module. That does not express the accepted KL boundedness
   condition. It now requires a finite R-submodule N and an exponent n such
   that p^n times the lattice lies in N and p^n times N lies in the lattice.
   The unit-model example uses the same condition. This follows [KL,
   Definition 7.3.1, p.147 and Remark 7.3.2, p.148](https://arxiv.org/pdf/1301.0792v5).
   It does not impose finite generation on the lattice itself. The change
   corrects this algebraic component; it does not claim to construct the
   period rings, their scalar-extension identification or localization theory.

No accepted packet, original component suggested file, atlas file, link map or
upstream roadmap was changed. Remaining corrections need a deliberate choice
of faithful component signatures or omission, rather than a guessed geometric
carrier or a field containing an assumed theorem.

## Required signature revision

Protocol §13 permits explicit omission of unavailable conditions and says that
the README is definitive and the suggested file is nonexhaustive. The existing
contract indexes are useful for that purpose. A missing signature alone is not
the reason for this verdict. Nor does a numerical specialization need to be a
formalization of the full geometric theorem.

The problem is that the file also quantifies over arbitrary available inputs
while comments describe those inputs as a particular owner's category, module,
functor or slope function. Those comments do not constrain the Lean type.
Several signatures lose even the ordinary algebraic assumptions that can be
expressed at the pinned baseline. Calling a false type a supported component
does not establish the required agreement between declarations and targets.

The following are blocking examples in
[Suggested.lean](../packages/VectorBundlesAndIsocrystals/Suggested.lean).
Names are sufficient to locate them without depending on changing line numbers.

| Declaration or family | Counterexample to the executable type | Required repair |
| --- | --- | --- |
| `LubinTateUniversalCover` | Set K=ℚ, U=0, V=ℚ, T=0 and both displayed maps to zero. The asserted linear equivalence U≃V cannot exist. | Restrict to the actual cover and eigensection modules with their comparison data, or leave the signature omitted. This is the comparison of [FS, Proposition II.2.2, p.60](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), not a construction for arbitrary linear maps. |
| `FundamentalExactSequence`; `FamiliesOfBanachColmezSpaces` | In ModuleCat ℚ, take every object to be ℚ and both arrows zero. Their composition is zero, but the first arrow is not mono. Thus an arbitrary short complex is not short exact. | Keep the actual untilt sequence and its E∞ hypothesis; for the family sequence keep the derived boundary construction and slope/locality assumptions. See [FS, Propositions II.2.3–II.2.4, pp.60–61 and Proposition II.3.5, pp.79–81](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). |
| `SlopeZeroLocalSystems`; all seven definitions in `PureComparisons` | Choose C=ModuleCat ℚ and D=Discrete PEmpty. C has an object, D has none, so C≌D is impossible. The signatures currently allow this choice. | Specify the actual local-system/bundle, ring/sheaf, integral-boundary or finite-length categories when their types are available. Otherwise keep the named full contract in the omission index. For slope zero the source is [FS, Corollary II.2.20, p.75](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), with every geometric slope zero. |
| `ExactBanachPoints` | A zero functor between nonzero module categories preserves zero morphisms but is not faithful. A merely zero-preserving functor need not preserve a short exact sequence either. | Use sympathetic-algebra evaluation on the realized BC category, or give a separately named generic lemma with the necessary functor assumptions. The source is [CN author copy, Remark 3.1, p.13](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf). |
| `AnnularBasisApproximation`; `PureModelTrivialization`; `ConstantVertexSubmodule` | The first asserts `(Fin n → R) ≃ₗ[R] M` for arbitrary M,n. Set R=M=ℚ and n=0. For the last, take M=0 and m=1: no submodule has finrank 1. | Preserve a basis/rank input and the actual Frobenius and annular hypotheses. The KL approximation theorem extends a given annular basis under matrix bounds; it does not produce every rank for every module. See [KL, Lemmas 7.1.1–7.1.2, pp.145–146](https://arxiv.org/pdf/1301.0792v5). |
| `TorsionVsHomVanishing` | Set W=BdRplus=BdR=ℚ in ModuleCat ℚ. The identity is a nonzero map in each displayed Hom set. | Preserve the finite BC object, the period-module realization and the condition t^rW=0. These are essential to [CN author copy, Corollary 3.18, p.18](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf); arbitrary VS morphisms remain the intended maps. |
| `TorsionSubobjectsHeight`; `EulerPoincareHeight`; `BCHNInvariants.additive` | The first permits the constant height −1 and an identity mono. The second permits height constantly zero and rank constantly one. Arbitrary supplied invariants also need not be additive. | Use the actual Dimension/HN invariants and their compatibility, rather than arbitrary functions. Preserve the torsion target and realization in the subobject result; see [CN author copy, Remark 3.22, p.19; Remark 3.11, p.15; §3.2.5, p.16](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf). |
| `PointwiseAmple.isOpen`; `PurityOpenness`; `AdicPurityLoci`; the polygon semicontinuity signatures | On ℝ, assign slope list [1] at 0 and [0] elsewhere. The positive-slope locus is {0}, which is not open. Using [0] at 0 and [0,1] elsewhere similarly refutes the arbitrary-profile pure-locus statement. Arbitrary polygon functions need not be semicontinuous. | Retain the profile definition as a numerical component, but omit or correctly restrict the geometric openness theorem. See [KL, Theorem 7.3.7 and Corollaries 7.3.8–7.3.10, pp.150–151; Theorem 7.4.5, p.153](https://arxiv.org/pdf/1301.0792v5). |
| `NegativeFrobeniusCohomologyDetection` | Let M=ℚ and F be the identity. The signature forces the fixed vector 1 to be zero. It also asserts injectivity of an arbitrary supplied restriction map. | Keep negative slopes and the actual fibre restriction maps in [KL, Corollary 7.4.11 and Remark 7.4.12, pp.155–156](https://arxiv.org/pdf/1301.0792v5), or omit this signature. |
| `AbsoluteBcSpatiality`; `PuncturedAbsoluteQuotients`; `BcMorphismCalculus` | The first makes every topological space spectral, including noncompact ℝ. The second can be instantiated with an empty space, whose quotient is quasiseparated. The last permits D=PEmpty although End(W) contains an identity. | Fix the actual absolute BC space, scalar action and endomorphism algebra. If these carriers cannot yet be stated, retain only their full named contracts. See [FS, §II.3, pp.77–85](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) and [CN author copy, §3.2.4 and §3.2.6, pp.15–17](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf). |

The revision should also inspect the same issue in `BC.baseChange`,
`BCPresentation.dimension`, `BCPresentation.stabilize`, `PureModel.baseChange`,
`BCTiltedHeart.positive`, `BCTiltedHeart.negative`, their profile examples,
`BCTiltedHeart.split`, `AbstractBC.leBras`, `LeBrasEquivalence`, `ArtinianBc`,
`CurvatureHeightSigns`, `GeneratingImageCokernel`,
`NonpositiveCurvatureExtensions`, `BoundedPolygonsDenseLocus`,
`PropernessOfProjectivizedBc`, `DivisorSectionComparison`, the two negative
quotient examples, `PositiveSlopeResolution`, `RelativeCohomologyVanishing`,
`GeometricPositiveGeneration`, `DiagonalGaugeNormalForm` and
`CurvatureHnCharacterisation`. For example, an arbitrary Frobenius F′ and map f
do not give a compatible base change of a pure model; a generic abelian
category need not have the curve's Ext² vanishing; and a diagonal gauge equation
with A=0 and D=1 is impossible even with φ the identity.

There are also honest but much weaker numerical components, such as
`UntiltPositiveLine`, `SemistablePeriodExample`, `AmpleIffPointwise` and
`AllRingsPointwisePurity`. Their comments say what is omitted. These should
remain explicitly distinguished from the geometric targets; this review does
not classify them as false merely because they are partial.

A safe revision can remove a mathematically unsupported prototype and keep its
name and complete contract in the existing omission index. Where a useful
ordinary signature can be stated faithfully, retain its expressible rank,
compatibility, exactness or continuity assumptions. Do not replace missing
geometry with an arbitrary Prop field, assume the desired theorem as data, or
change the accepted README to fit the false universal type. Re-run the whole
file after revising the signatures and their examples.

## Independent counterexample checks

The following file was checked separately, without importing Suggested.lean or
its admitted declarations. It elaborated with exit 0, no errors, no warnings
and no `sorry`. It records four of the ordinary obstructions used above.
The fourth check refutes the mono clause required for the zero-map sequence to
be short exact.

```lean
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.CategoryTheory.Discrete.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.Tactic.NormNum

open CategoryTheory

example : ¬ Nonempty (ModuleCat.{0} ℚ ≌ Discrete PEmpty) := by
  rintro ⟨e⟩
  exact PEmpty.elim (e.functor.obj (ModuleCat.of ℚ ℚ)).as

example : ¬ Nonempty ((Fin 0 → ℚ) ≃ₗ[ℚ] ℚ) := by
  rintro ⟨e⟩
  obtain ⟨x, hx⟩ := e.surjective 1
  have hx0 : x = 0 := Subsingleton.elim _ _
  rw [hx0, e.map_zero] at hx
  norm_num at hx

example : ¬ (∀ f : ModuleCat.of ℚ ℚ ⟶ ModuleCat.of ℚ ℚ, f = 0) := by
  intro h
  have h1 := congrArg (fun f : ModuleCat.of ℚ ℚ ⟶ ModuleCat.of ℚ ℚ => f.hom 1)
    (h (𝟙 (ModuleCat.of ℚ ℚ)))
  norm_num at h1

example : ¬ Mono (0 : ModuleCat.of ℚ ℚ ⟶ ModuleCat.of ℚ ℚ) := by
  intro h
  have := h
  have hId : (𝟙 (ModuleCat.of ℚ ℚ)) = (0 : ModuleCat.of ℚ ℚ ⟶ ModuleCat.of ℚ ℚ) :=
    (cancel_mono (0 : ModuleCat.of ℚ ℚ ⟶ ModuleCat.of ℚ ℚ)).mp (by simp)
  have h1 := congrArg (fun f : ModuleCat.of ℚ ℚ ⟶ ModuleCat.of ℚ ℚ => f.hom 1) hId
  norm_num at h1
```

## Plan, boundaries and baseline audit

Both inputs were accepted on 2026-10-08 by independent revision-two reviews:
[VB0 part](../packets/VectorBundlesAndIsocrystals--VB0.json) and
[VB3 part](../packets/VectorBundlesAndIsocrystals--VB3.json). The owning stages
in those inputs, rather than the part filenames, determine this transfer count.

| Accepted owning stage | Targets in the README |
| --- | ---: |
| VB0 | 9 |
| VB1 | 19 |
| VB2:ampleness | 14 |
| VB2:classification | 9 |
| VB3:positive-basic-examples | 3 |
| VB3:projectivized-properness | 3 |
| VB3:general-BC | 36 |
| VB4 | 34 |
| Total | 127 |

All target anchors are unique, every local prerequisite link resolves, and the
API/test names and mathematical statements agree with the accepted parts.
Changes from the component readers remove process identifiers or collect
repeated assumptions into conventions and group introductions. In particular:

- KL Hypotheses 5.0.1 and 6.0.1 remain at the pure-model group introduction;
  the separate Hypothesis 8.7.1 scopes remain with the relevant targets.
- The classical CN countability/separability conditions, the chosen completed
  algebraically closed field and its distinguished untilt point are retained,
  without imposing them on general-coefficient diamond statements.
- The isocrystal/bundle sign reversal, reduced-denominator multiplicities,
  every-slope-zero condition, m=d in positive resolutions, negative BC
  presentation signs, upper geometric versus lower Robba semicontinuity and
  nonzero restrictions in reciprocal slope formulas remain explicit.
- The early fundamental sequence and degree-one divisor geometry are
  separated in the construction order from the later VS1 divisor-to-Weil
  comparison. This does not assert that the accepted supplier/proof gaps have
  been closed.

The two relevant incoming link maps use local-field/Frobenius infrastructure
from LocalFieldsRamification Layer 2 and Brauer invariants from ClassFieldTheory
Layer 5. The latter does not supply Lubin–Tate theory. RF0–RF3 supply the
coefficient rings, annuli, quotient curve, divisors and rank-one twists;
general bundle construction, global chart coverage, GAGA and classification
remain here. G-isocrystals, Bun_G, enhanced sheaf categories and the later
period-valued h(W) theorem retain their stated neighbouring owners.

The reviewed library audit has no dedicated row for this roadmap. The nearby
BunGAndNewtonStrata and p-adic Hodge entries do not supply higher-rank
classification, FF bundle HN theory or BC geometry. All 29 recorded baseline
declaration statements were inspected at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The distinctions relevant to this
review include the non-finite native Witt isocrystal carrier and its rank-one
classification, a shared finite/free local-generator witness, line-bundle
classes versus the Picard group, the central-simple hypotheses of Brauer
classes, native derived categories and short-exact complexes, and the genuine
T0/compact/spectral requirements of `SpectralSpace`.

The VB0 contract index itself distinguishes executable content from omissions:
36 of its 98 API entries are typed specializations and 62 have omitted
signatures; 30 of 72 tests have example specializations and 42 have omitted
examples; 3 of 33 named-theorem entries are typed Q_p specializations and 30
have omitted signatures. These counts concern that index only. They are not a
formalization count or an independent reason to reject the package.

## Sources and reproducible validation

Twelve public PDFs were fetched independently on 2026-10-09. The table records
their editions without storing their files or passages in the repository.
CN's author and arXiv copies have different pagination; the README identifies
which copy each locator uses. No restricted book was used.

| Source edition | SHA-256 |
| --- | --- |
| [FS, author-hosted Geometrization, 356 pages](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` |
| [FF, author-hosted Courbe_fichier_principal.pdf](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf) | `8c020573d3dce341088ea7e83fe1063b410686c08e3a144fa3c0de634667cc79` |
| [KL, arXiv:1301.0792v5](https://arxiv.org/pdf/1301.0792v5) | `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942` |
| [CS, Annals 186(3) publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| [CN, author copy CN5.pdf](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf) | `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a` |
| [CN, arXiv:2108.12785v4](https://arxiv.org/pdf/2108.12785v4) | `83c6afdc8a377e38dced9dd8b400cb3461a2d47de2664a094e81a04332051361` |
| [SW, author-hosted Berkeley Lectures](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) | `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` |
| [Ked, Slope filtrations revisited, Documenta Mathematica 10](https://ems.press/content/serial-article-files/25974) | `9a9e305e74a57c459311bb5d90ec0d38bd7b6551da6152f2f94e586d6ce4bd68` |
| [Lurie, Lecture 26](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf) | `73fcb0f228e194ba1e4db21957702d861d6abaeae4c11bc3a66511a0b91251ea` |
| [GLX, arXiv:2208.07195v3, 56 pages](https://arxiv.org/pdf/2208.07195v3) | `d2249ddbe1ae2f4728000d27846d396adffc97b2f8b7b1c82c5d2701153fcb12` |
| [CDN, author copy GPW5.pdf](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) | `2cdb1de25b5201ed46f8af6c06c19b72fdc5cbe1dd2037b4e1d24dee30155776` |
| [SW13, arXiv:1211.6357v2](https://arxiv.org/pdf/1211.6357v2) | `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d` |

Direct source checks focused on the fragile scopes: FS II.2.2–II.2.4,
pp.60–61 (Lubin–Tate normalization and E∞ untilt); II.2.17, pp.72–74
(contracting-action hypotheses); II.2.19–II.2.20, pp.74–75 and II.3.3–II.3.4,
pp.77–79 (HN splitting, resolutions and locality of cohomology); KL §7.1,
pp.145–146 and §7.3, pp.147–151 (basis extension, boundedness and pure loci);
CN author copy §3.1.1, p.12 (countability), §3.2.4–§3.2.8, pp.15–20
(curvature, height, period realization and unrestricted Hom); CN arXiv copy
§3.2.1, p.14 (the completed local DVR at the chosen point); and GLX §5.1,
pp.31–32 (the filtered G-isocrystal consumer). The all-target transfer check
compared the accepted citations; the source rereading is a selected independent
check, not a claim to have reproved all 127 results or closed the plan's gaps.

Validation results:

- `python3 scripts/check_blueprint.py research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json`:
  exit 0, no errors or warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/VectorBundlesAndIsocrystals--VB3.json`:
  exit 0, no errors or warnings.
- `lean-check research/blueprint/packages/VectorBundlesAndIsocrystals/Suggested.lean`:
  final exit 0, 231 `sorry` warnings, no other warnings or errors, after the
  boundedness correction.
- Isolated counterexample file above: `lean-check`, exit 0, no errors or
  warnings, no `sorry`.
- JSON/TOML parsing, reader size/anchor/link checks, submission-path validation
  and whitespace validation passed.

Before each Lean run, available memory exceeded 20 GB; runs were sequential.
The shared environment has exactly the pinned Mathlib. Its Tau Ceti checkout
is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the specified Tau
Ceti pin. The file's sole direct Tau Ceti import is
`TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic`; all seven Tau Ceti files in
its transitive import closure were compared byte-for-byte with the specified
pin and are identical. Thus the run checks this file's actual Tau Ceti imports
at pin-equivalent source content; it is not represented as a build of the
entire Tau Ceti repository at the specified Git revision. Baseline declaration
reading was separately performed at the exact pins.

The independent review is complete. A package revision should address the
executable-type blockers above and request a fresh signature check. Existing
proof and supplier gaps remain with their accepted owners.
