# PKG-ClassicalAdicEtaleCohomology

Completed by Codex, session `codex-XoDduC`, on 2026-10-13; issue #9159.
This is a complete package submission, not a checkpoint. Only the three package
files and this handoff are changed. The accepted packets, assembly reader and
earlier suggested file are unchanged.

## Deliverables and coverage

The README gives eleven layers, their exact supplier contracts, all theorem
hypotheses and source locators, definition APIs, discriminating Checks, worked
examples and dependencies. It retains 382 of the 390 input targets as mathematical
assertions. The eight consolidations or supplier deferrals are explained below.
The retained input definitions and constructions comprise 78 objects, all with
at least three Checks; their input-derived API has 674 entries and the retained
targets have 376 input-derived Checks. Additional definitions, APIs, Checks and
proof inputs close omissions in the assembly rather than remove obligations.

The Lean file uses actual Mathlib and Tau Ceti carriers: nine lightweight
definitions, three milestone theorems and eighteen examples. Heavy analytic
objects remain fully specified in the README and named in the closing comment.
There are no sorry-bodied data definitions, substitute cohomology carriers or
auxiliary lemma developments. Metadata is `topic = "math.AG"`.

The source of truth for this package is the accepted H0, H1-valuation-exports,
H1-valuation-nearby-cycles, H3 and H4 packets, reconciled with primary sources.
The topical ordering respects internal prerequisites. The following map lets a
reviewer locate the old mathematical interfaces without retaining packet IDs in
the reader document:

| Input area | Package owner |
| --- | --- |
| H0 sheaves, supports, descent and limits | Layers 1 and 3 |
| H1 henselian comparison and perfectoid noetherian models | Layer 2 |
| H1 formal specialization and semistable symbols | Layer 4 |
| H1 arbitrary valuation nearby cycles and trait comparison | Layer 5 |
| H1 valuation invariance, finiteness and supported exports | Layer 6 |
| H2 geometric field extension interfaces in H0/H3 | Layer 7 |
| H3 compactification and all-torsion lower shriek | Layer 8 |
| H3 Berkovich comparison, traces, effacement and duality | Layers 3 and 9 |
| H4 radial cohomology and smooth families | Layer 10 |
| H4/H5 algebraic comparison, exhaustion and frontier | Layers 8 and 11 |

## Consolidations, removals and upstream boundaries

The generic analytic colimit-spectrum theorem and generic rational-density
restriction theorem of H0 are supplied by `PerfectoidSpaces`, P7. They are
deferrals in Scope and ownership, rather than duplicate targets. Section 1.5
keeps the different Huber pseudo-adic *support* limit, its locally noetherian
cohomology theorem and the strongly sheafy strict-local continuity required
later. H3's pseudo-adic support-space target, API and Checks are incorporated
into the single carrier in Section 1.2. The four H1 substage export aliases
(henselian, formal, valuation nearby-cycle and valuation export) are consolidated
into their mathematical assertions in Layers 2, 4, 5 and 6. An alias does not
create another construction. Finally H3's relative pure dimension interface is
deferred to `AdicEtaleGeometry`, A2, in the supplier contracts. These account
for all eight non-retained input target blocks.

Current TauCetiRoadmap and the current Tau Ceti library were read in addition
to the pinned baseline. The duplication audit covered the nine newer roadmaps
and Completed roadmaps named in WORKERS, using both README and declaration
searches. The current library was at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Its Huber rings, valuation spectrum,
actual Spa predicate, Huber-pair maps, roots of unity and profinite cohomological
dimension interfaces are supplier contracts, not re-planned carriers. Its
real-valued power-series Gauss valuation is narrower than the arbitrary-value-
group polynomial/fraction-field Gauss extension required here. Likewise
discrete local-field ramification is not substituted for arbitrary-rank
valuation-ring results.

The obsolete upward citations to `TropicalAndBerkovichArithmetic` are removed.
Their classical foundations now belong here: strict analytic gluing and the
taut adic comparison in Section 3.1, overconvergent sheaves in Section 3.2,
proper-support comparison in Section 9.1, and the analytic Tate quotient in
Section 3.7. The affinoid Berkovich spectrum itself remains the existing R3
supplier. Higher tropical plans should import these sections instead of owning
them. No higher DiamondSixOperations theorem is used to prove its classical
inputs here; the smooth-curve frontier theorem is proved in Section 8.2 and
used by Section 11.3.

## Mathematical corrections to the inputs

The following corrections are in the package only. A future packet refresh
should preserve them rather than restore the assembly wording.

- Huber's non-analytic standing class includes arbitrary discrete rings.
  It is not equivalent to locally noetherian analytic geometry. Section 1.2
  states the supported-site extension needed for discrete scheme pairs.
- The Huber tilde-limit of Section 1.5 carries a specified pseudo-adic support.
  Cohomology continuity, descent of finite étale objects and maps, and the
  strongly sheafy strict-local formula retain their distinct hypotheses.
- Trait variation is the map from vanishing to nearby cycles with variation
  operator `rho(sigma) - 1`; SGA 7 XIII 1.4.3 and 2.1.2.5 is the locator, not
  Exposé XV. The LPV trait comparison is used in its prime-to-residue scope;
  Huber's separate formal comparison has an all-torsion scope.
- Semistable Kummer symbols descend through reduction modulo p squared,
  not uniformizer squared. The ramification index remains in the threshold
  `pe/(p-1)`. Degree zero, zero-level logarithmic symbols and positive-level
  differential symbols are specified separately. The endpoint and the
  characteristic-two case are included.
- General-base nearby-cycle construction requires the oriented étale-product
  topos, finite-presentation descent, plurinodal presentations and alteration
  arguments. Section 5.4 makes these inputs explicit. Stable proper curve
  moduli and finite Isom extension come from SF.4; stable reduction alone is
  not a moduli-stack construction.
- Compactifiability requires quasi-compactness after every base change.
  The lower-shriek bound is a separate all-torsion theorem; ordinary
  cohomological dimension is supplied independently in Section 11.2.
- The smooth duality Fundamental Lemma is Huber 7.4.2, not the relative-ball
  purity calculation. Its valuation-rank scope and the D-minus/D-plus
  restrictions on internal Hom are retained. Global Hom and internal Hom
  assertions have separate signatures.
- Analytic lci cycle classes have type `i_* Lambda_Z -> Lambda_X(c)[2c]`
  for n invertible in the analytic structure sheaf. Their construction does
  not assert absolute purity for all such n. The blowup relation uses the
  negative exceptional-divisor class.
- Boundary fields are henselian fields and the secondary degree is minus the
  second coordinate. The disc coordinate has degree minus one; its inverse
  represents the positive point class. Section 9.3 includes Kummer exactness,
  norm compatibility, congruent-unit root lifting, residue representatives,
  line-bundle extension and the pointed semistable trace comparison. Only
  the generic finite normalization map is claimed finite flat; a finite
  formal map is not silently made flat.
- Proper semistable models over O_C allow nondiscrete valuation rings and
  node charts `ST = alpha`. They differ from the discrete models used for
  the semistable symbol calculation. Sections 8.2 and 9.3 include compatible
  model, prescribed finite normalization and boundary inputs. The finite
  rank-two frontier result is stated for smooth curves, the scope its proof
  supplies and its consumers need.
- Smooth-family finiteness retains its field-base hypothesis and gives
  finite generation over a noetherian coefficient ring, not finite
  cardinality. The perfectoid-base application is obtained by finite-stage
  descent, supported proper base change and all-rank stalk conservativity;
  no unbounded six-operation theorem on nonnoetherian bases is assumed.
- Integral smooth proper traces are compatible inverse-limit morphisms.
  Relative top-degree surjectivity comes from compatible local classes, not
  unrelated finite-level epimorphisms. An absolute top-cohomology/limit
  isomorphism uses finite Mittag–Leffler groups. Internal duality for finite
  locally free coefficients is not promoted to all constructible sheaves.
- Nonproper algebraic comparison uses coefficient order prime to the field
  characteristic, which in characteristic zero allows p-torsion. Its proof
  includes relative purity and normal-crossing complement cohomology.
- Fractional ball radii use chosen compatible p-power roots. The closure
  formula uses every exponent above one in Z[1/p], not only integers.
  Stabilization uses actual restriction maps and continuity, not equality
  of dimensions. An increasing open exhaustion uses derived inverse limits;
  shrinking supported neighborhoods use filtered colimits.
- The final compactification duality is a statement about global sections.
  It is not a stalkwise sheaf-duality isomorphism.

Additional proof inputs include the finite-transcendence-degree field
cohomological-dimension bound, ACVF finite-existential transfer, flat finite-
generation section lifting over an AIC valuation ring, the singular-tube
degree-one bound and finite-family descent. Their supplier contracts and
proof sketches appear where used. These additions close proof inputs that
the assembled prose had only named indirectly.

## Source work and locator repairs

Read the cleared Huber (1996) volume directly, including the used portions of
Sections 1.7, 2.3–2.5, 2.8, 3.1–3.9, 4.1–4.4, 5.1, 5.3–5.7, 6.1–6.3,
7.2–7.5 and 8.2–8.3. No copy, extracted book text, quotation or passage is
included in the submission. Public source passages used for the analytic,
semistable, covering, finiteness and trace interfaces were checked directly;
the bibliography gives the versions where pagination depends on them.

Particularly relevant source checks were Li–Reinecke–Zavyalov v1, Sections
3.2–3.3, 4.1–4.5, 5.1–5.6 and 6; de Jong's 1995 covering paper and his 1997
Theorem 5.9/Corollary 5.10; Bosch–Lütkebohmert–Raynaud's reduced-fibre
theorems; Lütkebohmert's relative compactification theorem; van der Put's
1980 Theorem 1.1; Temkin's stable modification theorem; Gabber–Ramero v3,
Sections 5.1, 6.1 and 6.2; Kedlaya–Liu's local-system sections; and the
quoted Scholze finite-stage/finite-ball arguments. Lower supplier statements
are not replaced by unsourced assertions at a broader scope.

Locator repairs include Huber's gamma construction (3.2.12–3.2.13,
pp. 181–183), sheaf comparisons (8.2.1–8.2.4, pp. 407–408, and 8.3.5,
pp. 427–428), ordinary cohomological dimension (2.8.1–2.8.4,
pp. 156–159), compactification (5.1.1–5.1.4, pp. 272–273), and
smooth-family finiteness (6.2.2, p. 329). Other repaired locators are
Berkovich Corollary 5.4, p. 555; Colmez–Dospinescu–Niziol Theorem 2.1.1,
internal pp. 22–23; Guo–Reinecke Remark 7.17, p. 114; Huber's henselian
field comparison 2.3.10, pp. 122–124; and ECD Proposition 27.2, p. 164.
Gabber–Ramero's work is correctly titled *Almost ring theory*. An unused
misidentified van der Put bibliography entry was removed.

## Adversarial mathematics pass

Each retained target and definition was checked against its hypotheses and
the consumer's required scope. The following records the principal families
of degenerations and the corrections they exposed. The README contains their
explicit mathematical witnesses; the lightweight ones also occur in Lean.

| Statements or conventions checked | Instances tried | Result or repair |
| --- | --- | --- |
| Sheaves, supports and stalk conservativity | Empty space, disconnected constant sheaf, closed point in a rank-two field pair | Sheafification and all-rank geometric points retained; a closed support is not replaced by an open tube |
| Non-analytic henselian comparison | A field, a discrete nonnoetherian ring, a nonhenselian local ring | Standing ring class broadened only in its discrete branch; the henselian predicate remains substantive |
| Valuation invariance | Identity map, field as rank zero, DVR to its fraction field, rank-two plus ring, eta equal to s | Spectrum surjectivity remains a hypothesis; locality/injectivity characterization and failure after lost closed primes are explicit |
| Coefficient scopes | n equal to one, n divisible by the residue characteristic, characteristic zero versus characteristic p | Unit in O and unit in O-plus separated; all-torsion statements not restricted to tame coefficients |
| Semistable filtration | q equal to zero and one, p equal to two, e equal to three, nonintegral cutoff | Separate zero-level formulas and ceiling cutoff; modulus p squared and actual ramification index retained |
| Variation and shifts | Identity/zero monodromy, scalar actions two and three, a complex in degree zero | Variation is rho minus one with the stated multiplication order; H-i of K[r] is H-(i+r) of K |
| Trace normalization | Rational point, P-one hyperplane, disc boundary coordinate and its inverse | Degree plus one for the point, secondary coordinate degree minus one, inverse coordinate realizes the point class |
| Boundary and compactification | One-branch disc, two-branch annulus, a semistable node, nondiscrete O-C | Number of branches and henselian fields retained; only the generic normalization map is finite flat |
| Radial regions | Zero/unit coordinates, zero bounds, equal inner/outer bounds, constant exhaustions | Puncture and strict inequalities remain genuine; equal weak radii can be nonempty and constant exhaustion does not produce a strict locus |
| Limits and coefficient duality | Identity versus zero transition maps, finite free coefficients versus Z/ell over Z/ell-squared | Derived inverse limit and actual transition maps used; finite locally free/internal-Hom scope retained |
| Ordinary cohomological dimension | Algebraically closed rank-one point, finite ball, point over a field of positive cohomological dimension | Residue-field term and field-extension bound retained; lower-shriek amplitude is not used as an ordinary-cohomology proof |
| Final duality | Proper smooth curve with a qc open, nonzero frontier contribution | Global pairing stated separately from local or sheaf-level assertions |

## Validation and next step

All five input packets pass `scripts/check_blueprint.py` with zero errors and
zero warnings. Their older coverage-gap records are input records, not defects
silently erased from those files. The package resolves the named proof inputs
and records the corrections above without editing them.

`lean-check research/blueprint/packages/ClassicalAdicEtaleCohomology/Suggested.lean`
exited 0 against the shared pinned Mathlib `082e2d37e8` and Tau Ceti environment:
21 warnings, all exactly declarations using `sorry`; no errors or other
warnings. Memory was checked before compilation and no Lean process remains.
This is elaboration of target signatures, not a claim that the mathematics
has been formalized.

`intake.py check-files` reports four files and zero problems;
`check_sorry_data.py` passes. The inventory audit confirms eleven layer,
example and dependency sections, at least three Checks for all 78 retained
input definitions/constructions, and no private paths or old planning IDs in
the README. Internal target prerequisites were reordered before their uses.
`git diff --check` passes.

The package is ready for the independent package review and the maintainer's
upstream decision. No second job was claimed. This note is self-contained;
no subsequent worker needs the deleted scratch directory.
