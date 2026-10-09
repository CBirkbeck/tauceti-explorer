# Independent package review: Hecke correspondences and local shtuka cohomology

Reviewer: Codex (GPT-6), session `codex-kwrZvb`. Date: 9 October 2026.
Job: `REV-PKG-HeckeStacksAndLocalShtukas`, issue #7521.

Verdict: **needs_changes**. This is a complete independent review, not a
checkpoint. The mathematical README passes the package checks after the
clarification below. The suggested file elaborates, but its admitted replacement
of an existing pinned Tau Ceti carrier violates Protocol §13 and the upstream
instruction to prototype against existing library interfaces. The package must
resolve that issue before acceptance.

## Checks against the six requirements

| Requirement | Result | Evidence |
| --- | --- | --- |
| Upstream form and size | Pass | Purpose, boundaries, conventions and library interfaces precede five ordered layers. Every target has prerequisites and theorem/section/page citations. Definitions have API and test tables. The README is 190,869 bytes, below even a decimal 200 KB limit. Compared its form with the ClassFieldTheory and AdicSpaces roadmaps. |
| Fidelity to the accepted plan | Pass | All 51 targets are present, together with all 215 API items and 94 test specifications. The target correspondence is listed below. Hypotheses, sign conventions and supplier restrictions survive the change to reader-facing prose. |
| Own words and source locators | Pass | The eight source versions match the accepted SHA-256 records. Target citations retain theorem/section/page locators. The document follows constructions and their uses rather than the sections of a source. Prose inspection and a normalized 25-word contiguous-text comparison found no source passage. |
| No programme process | Pass after correction | No packet paths, job identifiers, checkpoint references or coverage statuses occur in the package. Removed the machine-specific compilation claim from the reductive-group comment and simplified the omissions footer. |
| Suggested Lean file | Needs changes | Final `lean-check` exits 0 with 999 `declaration uses sorry` warnings and no other warnings or errors. Non-comment Lean tokens are identical to the accepted suggested file. Nevertheless, `RedGrp` is still an admitted carrier instead of the existing native carrier; see R1. |
| Metadata | Pass | The file is exactly the single line `topic = "math.NT"`, with a final newline. |

## Clear correction made in place

The Beauville–Laszlo supplier comment previously put the image in `B(G, μ)`
while taking arbitrary `b` as an argument. The README's abbreviated supplier
contract could be read the same way. Both now restrict that image statement
to modifying the trivial target. For a general target the required statement
is the relative Kottwitz identity

\[
\kappa(\mathcal E_x)=\kappa(\mathcal E_b)+\mu^\sharp.
\]

For example, take `G = G_m`, `b = π` and `μ = 0`. The modification retains
`E_b = O(-1)` and Kottwitz invariant 1, so its image cannot lie in
`B(G, 0)`. This example follows from the conventions already specified in
the plan; it adds no theorem or new target. The trivial-target image bound
and its minuscule equality remain, as does the inverse-cocharacter dictionary.
The relevant normalization checks are [Fargues–Scholze], III.2.2, p. 91,
III.3, pp. 97–100, and [Scholze–Weinstein], Proposition 24.1.2, p. 225.

## R1: use the existing reductive-group carrier

In `Suggested.lean`, the imported-interface section declares
`def RedGrp (F : LocalField p) : Type 1 := sorry` and an admitted category
instance. Its own comment identifies the intended existing carrier as
`TauCeti.ReductiveAffineGroupSchemeCat E`. At the required Tau Ceti commit
`f790474821cf4256814db967cb154e7af3d0c369`,
`TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean`, lines 61–90,
defines the reductivity property and the full-subcategory carrier. Its
structural smoothness and geometric connectedness are also exported in
that module. I read those declarations at the exact commit.

Protocol §13 requires imports of individual Tau Ceti modules and prototypes
against existing interfaces rather than restatements. UPSTREAM_GUIDE.md,
“Prototyping”, makes the same requirement. The standard permission to admit
future constructions does not require replacing a carrier already available
at the pin. A successful elaboration of an arbitrary admitted `Type` does
not check compatibility with that carrier or its category of morphisms.

The revision should import
`TauCeti.AlgebraicGeometry.AffineGroupScheme.Reductive`, make `RedGrp` an
abbreviation or transparent adapter to
`TauCeti.ReductiveAffineGroupSchemeCat F.E`, and inherit its native category
instance. Retain admitted supplier interfaces for genuinely missing geometry
and operations. Adjust universe levels and signatures where the native
carrier requires it, then run `lean-check` at both required pins. Do not solve
this by copying the native definitions into the suggested file.

The provided shared build has the required Mathlib pin but a different Tau
Ceti checkout, and lacks the compiled native module. The run prohibits
rebuilding Tau Ceti or making another checkout. I therefore did not insert an
unvalidated import or change the shared build. This is an environment limit
on correcting R1 here, not evidence that the carrier is missing at the pin.

An isolated import probe containing that import and
`#check TauCeti.ReductiveAffineGroupSchemeCat`, run through `lean-check`,
exits 1 because the module's `Reductive.olean` does not exist. The unchanged
mathematical declarations in the package still elaborate successfully.

The ordinary smooth discrete representation carriers also exist at the pin:
`IsSmoothDiscrete` and `SmoothDiscreteTopRep` in
`RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`.
The README correctly identifies them. I do **not** equate them with the
admitted enhanced derived `DSmooth` supplier, which requires additional theory.

## Target correspondence and mathematical audit

The following table identifies every accepted target in the README. Target
names in the second column are the accepted node suffixes, not new work.

| README sections | Accepted targets, in that order |
| --- | --- |
| HS0.1–HS0.6 | `global-hecke-correspondence`; `bounded-hecke-substacks`; `descent-and-bounded-fibres`; `chains-and-composition`; `twisted-period-grassmannian`; `structure-group-and-inner-form` |
| HS1.1–HS1.10 | `satake-kernel-and-solid-monoidal-functor`; `hecke-operator-via-relative-homology`; `monoidality-of-hecke-operators`; `demazure-generators-of-ULA-kernels`; `properties-and-weil-equivariance`; `ula-preservation`; `duality-exchange`; `condensed-enrichment`; `continuous-weil-descent`; `coefficient-base-change` |
| HS2.1–HS2.9 | `local-shtuka-moduli`; `framed-bundle-fibres`; `lattice-extension-functor`; `hecke-fibre-description`; `one-leg-period-map`; `levels-and-tower-limit`; `multi-leg-period-and-representability`; `no-legs-and-basic-duality`; `general-local-field` |
| HS2.10–HS2.18 | `minuscule-rigidification`; `admissible-period-torsor`; `classical-period-points`; `adjoint-period-and-tower-comparison`; `torus-products-and-determinant`; `nonemptiness-and-period-connectedness`; `component-transitivity-source-gate`; `structure-map-compactifiable`; `weil-descent-datum` |
| HS3.1–HS3.10 | `satake-coefficients-and-partial-frobenius`; `compact-support-at-levels`; `huber-cohomology-comparison`; `hecke-cohomology-comparison`; `compactness-of-shtuka-cohomology`; `general-bound-compactness`; `level-trace-and-pullback`; `admissibility-duality-and-adjunction`; `classical-comparison`; `hecke-operators-between-strata` |
| HS4.1–HS4.7 | `monoidal-and-finite-set-functoriality`; `creation-annihilation-and-triangles`; `isogeny-product-and-weil-restriction-diagrams`; `product-hecke-diagram`; `weil-restriction-hecke-diagram`; `levi-compatibility`; `continuous-tensor-generator-export` |

All API and test names occur in the README. Unescaping Markdown table pipes,
their statements agree with the accepted input except for 18 substitutions
of readable section references for internal node identifiers. The six
additional descent API rows spell out the already accepted Weil-descent
construction. Every external prerequisite's owner and layer is retained;
individual node prerequisites are grouped under those layers and the
explicit supplier contracts. All internal anchor links resolve.

The general-field and `Q_p` scopes are kept separate. Integral-model torsors
use smooth affine models with connected special fibre, without assuming
parahoric or reductive models. The bundle slope is the negative isocrystal
slope; the first lattice is measured relative to the second. Thus the
one-leg nonemptiness condition is `B(G, μ⁻¹)`. The full nonbasic automorphism
v-group is distinguished from the constant centralizer. Frobenius-collision
charts retain intermediate lattices; arbitrary `b` is not suppressed from
their transitions.

The solid kernel uses relative Verdier duality followed by solid duality,
and relative homology is the left adjoint of pullback. The README retains
the geometric and torsion hypotheses for exceptional-direct-image
comparisons. Tower colimits use pullback, trace goes in the opposite
direction, and division by an index requires it to be a unit. Compactness
and perfect invariant complexes have the pro-`p` hypotheses. Characteristic
zero finite length is not extended to arbitrary integral coefficients.

The period-point comparison retains the Kottwitz condition and finite
extensions of the completed reflex field. The source's unqualified
component-transitivity argument is not substituted for the accepted
topological target: non-minuscule transitivity still requires openness of
finite-level components. Nonbasic framed cohomology still requires the chart
and positive-unipotent comparison. The Levi comparison remains a torsion,
single-stratum theorem with the inverse shift and twist in this orientation.
The tensor export does not assert the excursion finite-ramification theorem.

The accepted plan's nine open inputs are expressed as mathematical supplier
contracts, not as completed constructions. They include general integral RZ
spaces, the classical-support/dualizing comparison, connectedness and density
inputs, stacky dimensions, non-minuscule component openness and nonemptiness,
arbitrary-coefficient compact stalks, and nonbasic chart comparisons.
All-prime highest-weight generation is assigned to the integral
representation continuation; the original ReductiveGroups layer alone is
not claimed to supply it. General integral spaces and global function-field
shtukas remain with their own roadmaps. Link `CFT-L96` supplies the
topological Weil group from ClassFieldTheory layer 9 to HS1, as the README
requires. No supplier ownership was changed by this review.

## Source and library verification

I checked the eight public versions in the README's source list against their
accepted hashes. No restricted book was needed. Primary-source checks of the
sensitive claims included:

- [Fargues–Scholze](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
  author-hosted v4, 356 pages: VII.3.1, p. 257; VII.5.2, p. 265;
  VII.7.2–VII.7.4, pp. 272–273; IX.2.1–IX.2.4, pp. 322–323;
  IX.3.1–IX.3.2, pp. 324–327; IX.5.1, p. 328; IX.6.1–IX.6.3,
  pp. 331–332; IX.7.2, pp. 335–337. Also confirmed Remark VI.8.4 is
  on p. 226 in this version.
- [Scholze–Weinstein](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf),
  print-ready 27 March 2020, printed pages: §§23.3–23.5, pp. 218–224,
  and §24.1, p. 225, for periods, Frobenius charts and the inverse bound.
- [Howe–Klevdal v2](https://arxiv.org/pdf/2308.11064v2),
  Propositions 7.3.3–7.3.4, pp. 43–44, for nonemptiness and connectedness.
- [Gleason–Lourenço v2](https://arxiv.org/pdf/2210.08625v2),
  Theorem 3.1 and the proof of Theorem 3.2, p. 10; corrected Lemma 3.3,
  p. 12, for the geometric input and unipotent-fibre dimension.
- [Gleason–Lim–Xu, published version](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf),
  Lemma 3.2, p. 820; Proposition 3.12, p. 828; §3.6, p. 829;
  Proposition 6.6, pp. 849–850, for components, classical periods and
  adjoint-group comparison, with the stated convention translation.
- [Dat–Helm–Kurinczuk–Moss v2](https://arxiv.org/pdf/2203.04929v2),
  Theorems 1.1–1.2, p. 1, and Corollary 1.4, p. 2, for integral finiteness.
- [Hamann–Hansen–Scholze v1](https://arxiv.org/pdf/2409.07363v1),
  §1, p. 2, footnote 1, for the torsion restriction on the compact-stalk input.
- [Hamann–Imai v4](https://arxiv.org/pdf/2401.06342v4),
  Proposition 4.1, p. 24; Proposition 4.4, p. 25; Lemma 4.7, p. 26,
  for stratum dualizing degrees and the modulus normalization.

Read all eight baseline declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474`:
`Adjunction`, `ExactPairing`, `Functor.Monoidal`, `MonoidalCategory`,
`Condensed`, `CondensedMod`, `WittVector.Isocrystal` and
`AffineGroupSchemeCat`. Their stated limits are accurate: ordinary
categorical coherences do not supply enhanced coherences, condensed
carriers do not supply solid derived categories, and the isocrystal class
does not include finite dimension. The additional native carrier check is
the reason for R1 rather than an acceptance based solely on compilation.

## Validation and disposition

`python3 scripts/check_blueprint.py research/blueprint/packets/HeckeStacksAndLocalShtukas.json`
reports zero errors and zero warnings. The accepted input itself was not
edited. Final Lean elaboration succeeded with only `sorry` warnings, using
the required Mathlib revision. There was more than 20 GB available memory,
and checks ran one at a time. JSON, metadata, allowed paths, internal anchors,
process/private-path scans and `git diff --check` were also checked.

The next revision should resolve R1 and repeat the independent package
checks. The native import needs a prebuilt environment at the Tau Ceti pin;
the passing stand-in elaboration is not a substitute for that validation.
