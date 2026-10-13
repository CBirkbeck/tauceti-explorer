# PKG-MordellLawrenceVenkatesh~2 — blocked checkpoint

Issue [#7911](https://github.com/CBirkbeck/tauceti-explorer/issues/7911).
Codex, session `codex-8JAai6`, 11 October 2026.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7911#issuecomment-6106180898).
Branch `codex-8JAai6-7911-mordell-package`. No second job was claimed.
The manager's priority issues had no eligible available job when inspected;
this was the eligible focus package under WORKERS' ordering.

**Partial, blocked on supplier interfaces; not a completed revision.** The
accepted README, metadata and independent `needs_changes` review are unchanged.
No accepted input, supplier file or review record is edited. This checkpoint
carries forward the executable repairs from the still-unmerged draft
[#8150](https://github.com/CBirkbeck/tauceti-explorer/pull/8150), and adds the
native arithmetic and algebra statements below. That other worker's branch
and PR were not modified. All bodies remain prototypes with admitted proofs.

The PR is a draft to retain the partial status. `issues.py`'s
`deliverables_complete` has no package-specific coverage test: when every
output exists it returns true. Meanwhile the submission workflow prohibits
removing an existing deliverable. Thus a non-draft submission containing the
required handoff would be classified as complete despite the documented
omissions. The maintainer needs to arrange checkpoint intake and continuation;
this note does not waive the independent review's requirements.

## Fresh executable statements

In [Suggested.lean](../packages/MordellLawrenceVenkatesh/Suggested.lean):

- `semilinearCentralizer_finrank` states Lemma 2.1's dimension equality and
  square bound for a bijective semilinear map, a positive finite automorphism
  order, and the entire fixed coefficient field. Its E-linear power is
  identified by evaluation with the actual iterated semilinear map.
- Affine cycle statements give the unique fixed point, the nonfixed-point
  period, translation and identity periods, and the information preserved
  under permutation conjugacy. The ambient permutation centralizer is
  trivial and the normalizer is the affine subgroup for primes at least
  three. Native center and surjection-conjugacy/stabilizer consequences are
  stated separately.
- `affineGroup.commutatorProduct` uses an ordered list of actual group
  commutators. Its translation formula, nonzero-product generation criterion,
  multiplier image and exact restricted-fibre cardinality state all parts
  of Lemma 2.11, with the bounds on q and s. Examples distinguish the empty
  product, a single commutator and tuples of translations.
- `generatingTuples_card` and `generatingTuples_card_lower` state the Jordan
  totient count and the half-density bound for generating additive tuples,
  including modulus one.
- `twoFactorLieGoursat`, `idealsOfSimpleProducts` and `lieAlgebraGoursat` use
  native Lie subalgebras, ideals and nonabelian simplicity. Finite products
  are expressed with Mathlib's finite direct sum and component evaluation.
  A diagonal-subalgebra example distinguishes pairwise surjectivity from
  surjectivity to individual factors.
- `isotropicSubgroup_card` uses a genuine biadditive pairing into native
  `AddCircle (1 : ℚ)` and bijectivity of the induced character map; no symmetry
  of the pairing is required. `minimalSubrepresentation_half` uses native
  subrepresentations, a nondegenerate symmetric or alternating form, and a
  similitude character, with reducibility and dimension minimality stated.
- `sUnitTheorem` and `sUnitTheorem_field` state finiteness of the equation
  t and 1−t both S-units on Mathlib's existing `Set.integer` and `Set.unit`.
  The finite set lists nonarchimedean primes; archimedean places impose no
  extra integrality restrictions. Examples give no solutions over Z and
  exactly −1, 1/2 and 2 over Z[1/2]. These signatures do not construct the
  Legendre family or the period-map proof of this theorem.

The omission catalogue now removes these newly active targets and explicitly
separates executable algebra from the unresolved geometric consumer interfaces.

The carried-forward repairs cover the affine translation subgroup/stabilizer
and derived group; centralizer units, subspace/filtration actions and tensor
fixed-field descent; transvections in native `TauCeti.BilinForm.isometryGroup`
and arbitrary-field SL2 comparison with the correct lower-matrix sign; CM
intermediate-field and cyclotomic comparisons; continuous singly ramified
surjections and quotient descent; and primitive-kernel scalar extension.
The dimension-six linear example remains `primitiveHomology.rankSixAdapter`,
not the required geometric cover test. See #8150's handoff for its original
reading receipt; this run elaborated the combined file afresh.

## Blocker, checked against the actual suppliers

The blocker is missing definition/comparison interfaces, not merely unfinished
proofs. It must be resolved by the existing owners without duplicating their
hierarchies in this consumer package.

| Consumers | Owner and concrete boundary |
| --- | --- |
| Polarized `AbelianByFiniteFamily`, Legendre variant and reduced Prym | AlgebraicModuliForArithmeticGeometry R09.4 already has an executable *suggested* `TauCeti.ArithmeticModuli.AbelianScheme` and arbitrary scheme base change. This is useful and must be reused, not replanned. Its relative dual and `Polarization` APIs remain explicitly omitted. AbelianSchemesAndArithmeticModuli A0 imports those interfaces; A1–A2's relative consumers are consequently omitted there. Native Tau Ceti still supplies `AbelianVariety K` over a field, not this relative polarized interface. |
| `deRhamBundle`, Hodge subbundle, pairing, Gauss–Manin, transport and period maps | AbelianSchemesAndArithmeticModuli A4's relative de Rham hypercohomology and structured fibre comparisons remain omitted. ComplexComparisonPartII C5 does sketch `relativeDeRhamBundle : S.Modules` and a bundle comparison; its own comment explicitly leaves the singular direct-image identification and relative flat connection out. Its executable Gauss–Manin example treats a constant family on the affine line. Neither supplies the general arithmetic-family interface required here. |
| Crystalline Frobenius and transported filtered cohomology | CrystallineCohomology CR.1–CR.3, CR.7 and PadicHodgeTheory R06.5 must supply the geometric crystalline/de Rham family comparison. A semilinear vector-space map cannot substitute for that cohomology construction. The preceding relative de Rham boundary already blocks these consumers. |
| Primitive surface homology and the actual genus-two affine-cover test | Current AlgebraicTopology Stage 5 sketches transfer for unbranched `FiniteCover` using singular chains. The accepted LV contract additionally requires filling punctures, branched transfer and its intersection comparison. The abstract kernel and its scalar extension do not construct that surface cover or its homology. |

The reviewed library audit agrees with these boundaries (A1, A4, C5 and
R09.4). A search of the entire current native Tau Ceti Lean tree for
`AbelianScheme`, `GaussManin`, `deRham` and `DeRham` finds no relative interfaces.
The current DifferentialGeometry roadmap already owns smooth real-manifold
de Rham cohomology; its native-form complex and quotient APIs must be reused
for that setting, but do not provide relative scheme hypercohomology over a
number field. Current upstream roadmaps and library sources were read only.

This corrects an overbroad aspect of the previous checkpoint: an unpolarized
relative abelian-scheme prototype and a relative complex module prototype
*do* exist in the supplier suggested files. Their availability does not
supply the missing polarization, family Hodge/flat-connection and arithmetic
fibre comparisons. The next worker should start with those real prototypes,
not reconstruct them from the field-only native object.

These supplier paths are outside this issue's four allowed deliverables.
Bare propositions, arbitrary vector spaces or structure fields assuming the
consumer's desired theorem would not repair the missing geometric contracts.
PROTOCOL §13 requires such unstated conditions to remain omitted; the package
review additionally requires complete signature coverage before acceptance.
No rule has been relaxed here.

Other omissions remain substantial: friendly places and Frobenius adapters,
Grassmannian/period schemes, mapping classes and curve topology, Hurwitz and
Kodaira–Parshin families, lifted monodromy, period-image density and the
flagship rational-point finiteness signature and its prerequisites.
The full package semantic/source audit is unfinished.

## Coverage and validation

An independent lexical inventory removes nested block comments and line
comments, tracks namespaces and records actual named constants and active
examples. The combined file has **214 named declarations** (including named
instances) and **46 examples**. **70 of 261 required API names** occur as
active declarations, and **26 of 100 required test labels** accompany active
examples. Names and labels measure presence only: the Legendre split-algebra
check and abstract primitive-homology adapters still have the review's narrower
scope. There remain 191 absent API names and 74 absent test labels. Four of
the 30 theorem targets have full executable statement forms: the centralizer
dimension theorem, commutator-product theorem, trace-determination theorem
and S-unit theorem. The crystalline comparison remains omitted.

- `lean-check research/blueprint/packages/MordellLawrenceVenkatesh/Suggested.lean`:
  exit 0, **239 warnings**, all `declaration uses sorry`, zero errors and
  zero other warnings. The only subsequent edits to the Lean file are
  omission-catalogue comments. Available memory was 101 GB before this check;
  one compilation ran at a time, and none remains running. No build, cache
  update or language server was started.
- Shared Mathlib HEAD is exactly
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The imported Tau Ceti isometry
  module and both direct Tau Ceti dependencies independently match source
  blobs at `f790474821cf4256814db967cb154e7af3d0c369` byte-for-byte.
- `python3 scripts/check_blueprint.py research/blueprint/packets/MordellLawrenceVenkatesh.json`:
  0 errors, 0 warnings; 146 targets, 100 tests, 39 milestones, 76 requests
  and 79 recorded gaps. Its API statistic is 256 definition/construction
  items; the all-target inventory includes the five surface-homology APIs
  and gives the review's denominator 261. Structural validity is not closure.
- Exhaustive small finite computations for q=3,5,7 confirm the affine
  commutator formula, restricted multiplier fibres, generation equivalence
  and every point period. Counts for modulus 1–15 and tuple lengths two and
  three agree with the half-density bound. These are statement sanity checks,
  not general proofs or substitutes for the required geometric examples.
- README is unchanged at **197,848 bytes**, below 200,000. The fitting
  metadata remains `topic = "math.NT"`. Submission file/private-path checks
  and `git diff --check` pass.

Read WORKERS, both protocols, UPSTREAM_GUIDE, the issue and independent review;
read current Completed/HodgeStructures and Completed/UniversalCovers in full.
Current upstream roadmap main was observed at
`070dc2becd74419e76303ede84b465ed4a69461f`, current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The new statements use the accepted plan and direct reading of
[Lawrence–Venkatesh v3](https://arxiv.org/pdf/1807.02721v3): Lemma 2.1 and proof,
§2.1 p.9; Lemma 2.11 and proof, §2.6 p.14; §2.7 pp.14–15; Theorem 4.1,
§4 p.20 and the reductions pp.20–21; Theorem 5.4's proof pp.27–28;
§6 (6.8) p.32; §8.2 pp.39–40 and §8.3 p.42. PDF SHA-256:
`e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b`.
The general Lie kernel/ideal arguments and minimal-subrepresentation argument
are the accepted plan's explicit proof expansions, not assertions that the
paper writes those proofs. No restricted book was needed and no source
passage was added to a deliverable.

## Resume

Arrange honest checkpoint intake first. Obtain the owners' missing relative
polarization and family Hodge/cohomology/connection/fibre interfaces, reusing
R09.4's actual unpolarized prototype and C5's partial module prototypes.
Then type the consumers against those exact geometric objects and complete
all absent APIs, named statements and examples. Retain the full accepted
README and all native algebra repairs; an abstract kernel, module or
continuous group homomorphism is not the missing geometric comparison.
Rerun the complete elaboration and semantic/source audit before claiming
completion. No scratch artifact is needed to resume; the source is public
and this note contains the useful validation receipts.
