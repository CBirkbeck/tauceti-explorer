# Independent review: Stable compactifications and Torelli

**Job:** REV-StableReductionPartII--MC.6, issue #8942.
**Reviewer:** Codex, session codex-LG9xb7, 18 October 2026.
**Verdict:** accepted as a target-level planning pass, with the four recorded
supplier gaps still open. This session did not write the original plan.

## Counts and scope

Reviewed all 12 nodes: 5 theorems, 2 constructions, 4 comparisons and
1 application. Eight nodes are verified and four corrected; none was added,
removed or left unverifiable. Confirmed all seven baseline declarations;
none was removed or replaced. Checked both construction APIs (10 items),
their seven diagnostic tests, all 39 acceptance checks, the reader and
the suggested file. The parent supplies the six planets; this part adds none.

`status: complete` means this planning pass is finished. MC.6 remains
`planned`, with zero closed stages, five supplier requests and four gaps.
Every node retains `implementationStatus: unchecked`. Acceptance does not
certify proofs of the requested supplier results.

## Corrections made in place

1. **stable-input-compactification:** added the exact
   `MC.1/finite-unramified-diagonal` prerequisite for the finite map
   from the stack fibre product to the product retaining both coordinates.
   The normalization still uses the finite-cover field, which can be larger
   than the image field. No smoothness restriction was added to the input.
2. **torelli-family-composition:** corrected the pairing test to use
   a nonidentity unit in Z/NZ. An integer unequal to 1 can still give the
   same root of unity: a=1+N is now an explicit control. The fixed cyclotomic
   component and arbitrary test-scheme Cartesian comparison are unchanged.
3. **minimal-torelli-descent:** added the exact MC.1 smoothness and boundary
   prerequisites. The proof now chooses its smooth atlas over the fixed field
   k, obtains regular scheme overlaps, and uses density of the smooth-curve
   locus on each integral component. It explicitly invokes the requested
   stable-Jacobian polarized-trait identification from R11.3 before applying
   the C5 normal-base extension contract. This identification remains in
   `G-minimal-extension`; it is not proved by fibrewise semiabelianity.
4. **finite-cover-hodge-descent:** replaced the ambiguous Frobenius example
   by relative Frobenius Y→Y^(p) for a smooth geometrically integral
   projective k-curve. The stable family is on its target. This is a finite
   degree-p k-morphism even over an imperfect field; absolute Frobenius need
   not be a k-morphism.

The reader contains the same corrections. Baseline entries now record the
independent pinned-source checks. The source issue received its independent
verdict, and the packet received a review entry for every node. No Lean
signature needed changing.

## Source and version checks

All results below are described in our own words. The two cleared books were
read in place; no book files, extracted passages or source quotations were
added to the repository. The three locally downloaded public PDFs match the
SHA-256 values already recorded in the packet.

| Source and locator independently checked | Consequence for this review |
| --- | --- |
| [Yuan, author manuscript dated 21 August 2024](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), §3.1, pp.41–46; §3.4, pp.54–56; adjoining pp.57–58 | Stable extension and the Hodge comparison have the stated roles. The positivity argument uses compactified Torelli and generic finiteness. The arithmetic and metric arguments are outside this layer. The retained-base correction to p.45 remains necessary. |
| [Dimitrov–Gao–Habegger, arXiv v3](https://arxiv.org/pdf/2001.10276v3), §6.1, pp.23–25, diagram (6.1) | Supports the full-level Cartesian universal Jacobian in its characteristic-zero component and the absence of a chosen curve section. It does not supply the integral representability theorem; that is correctly imported from JC1 and PELModuli. |
| [Milne, revised 12 June 2021](https://www.jmilne.org/math/xnotes/JVs.pdf), Theorem 12.1 and sign proof, pp.38–39; opening §13, pp.40–41 | Supports the sign analysis in geometric Torelli fibres, with no characteristic-zero restriction in the theorem. The remaining existence proof and its prerequisites remain the JC1 strong-Torelli request. No proof closure of §13 is claimed here. |
| [Knudsen III, published scan](https://journals.msp.org/mscand/article/download/1623/1622/1654), §6, pp.209–211, visually read | The section fixes the complex field. Its Satake map from a stable-family cover, boundary abelian-part description and positive Hodge-power comparison support the characteristic-zero instance. They do not prove the requested arbitrary-characteristic descent. |
| Bosch–Lütkebohmert–Raynaud, *Néron Models* (1990), §8.4 Theorem 1(a), Proposition 2, pp.231–232; §9.4 Theorem 1, Proposition 4, pp.259–261 | The Lie/cohomology comparison is natural; semistable Picard identity representation does not require a regular total space. The smooth-curve polarization is canonical. These checks justify the scope of the requests without discharging the R11.4 proof gaps. |
| Faltings–Chai, *Degeneration of Abelian Varieties* (1990), IV Proposition 5.1, Remark 5.3, Theorem 5.7, pp.113–117; IV5.13, p.119; V Theorems 2.3 and 2.5, pp.150–153; V§6, pp.180–185, especially Theorem 6.7 | A toroidal extension on a normal base requires the cone condition. The integral minimal construction and ample Hodge power exist over Z, but the normal-base contraction/Hodge comparison used here remains an explicit C5 request. V6.7 has generic characteristic zero and cannot fill its characteristic-p boundary. |
| Stacks Project, [Lemmas 28.7.5–6](https://stacks.math.columbia.edu/tag/033H) and [Lemma 28.9.4](https://stacks.math.columbia.edu/tag/02IR) | Regularity gives normality; a Noetherian normal scheme is a finite disjoint union of normal integral components. The componentwise JC6 argument therefore does not assume geometric irreducibility. |

### Source issue E15-MC6

**Confirmed, with the existing manuscript-only scope and the proper-finiteness
interpretation.** Yuan's §3.4, p.56 describes smooth Torelli as finite.
Over C, smooth a compact-type stable genus2 curve consisting of two elliptic
curves joined at one node. Its Jacobians specialize inside A₂ to the product
of the two elliptic curves with the product principal polarization. That
product has a reducible theta divisor; the theta divisor of a smooth genus2
Jacobian is its irreducible curve. Thus the smooth Torelli image is not closed
in A₂, excluding a finite morphism to the whole target. Quasi-finiteness is
enough for the generic-finiteness argument actually used. Finite-to-one
terminology would express that valid weaker claim.

Independently checked the [author's publications page](https://faculty.bicmr.pku.edu.cn/~yxy/publications.html),
the [Annals article page](https://annals.math.princeton.edu/2026/203-1/p02),
and a targeted erratum search on 18 October 2026. No correction for this
sentence was located. The erratum linked beside the author's adelic-line-bundle
book is for a different work. The published article text was not collated;
this verdict makes no claim about its wording. Parent issue E4 remains an
imported finding, not a second new finding in this review.

## Baseline and current upstream

Read the actual Lean declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Module and hypothesis fit |
| --- | --- |
| `AlgebraicGeometry.Scheme` | `AlgebraicGeometry/Scheme`: native scheme carrier. |
| `AlgebraicGeometry.IsFinite` | `AlgebraicGeometry/Morphisms/Finite`: finite affine morphisms. |
| `AlgebraicGeometry.IsSeparated` | `AlgebraicGeometry/Morphisms/Separated`: closed diagonal; read its separated pullback instances too. |
| `AlgebraicGeometry.IsFinite.of_comp` | `AlgebraicGeometry/Morphisms/Finite`: finiteness of f followed by separated g implies finiteness of f, in the required direction. |
| `CategoryTheory.Limits.pullback.lift` | `CategoryTheory/Limits/Shapes/Pullback/HasPullback`: compatible maps into the two factors. |
| `CategoryTheory.Limits.pullback.lift_fst` | Same module: recovers the first coordinate. |
| `CategoryTheory.Limits.pullback.lift_snd` | Same module: recovers the second coordinate. |

For the native milestone, the first projection of S×_B V is separated
because V→B is separated. Its composite with the retained-coordinate map
is the given finite q. The hypotheses therefore match `IsFinite.of_comp`.
No TauCeti baseline declaration is asserted by this file.

Read the reviewed library audit for StableReduction and JacobianChallenge,
then checked the newer read-only roadmaps at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current TauCeti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
StableReduction owns curve families, graphs and relative duality;
JacobianChallenge owns the field Picard/Jacobian interface and universal
property, which is not strong Torelli. AlgebraicVectorBundles L0C already
owns finite locally free determinant and coherent pullback. Its README and
suggested declarations were read, and that ownership is preserved through
MC.5. The current library's `FamilyOfCurves` is an existing carrier, not a
new MC.6 target. Searches found no implementation supplying the missing
stable Picard, Torelli or Siegel minimal targets. Nothing in those upstream
trees was modified or built.

## Closure, API and handoff

Read the exact external prerequisite statements in the parent MC.6 and
the MC.1/MC.4/MC.5, JC1/JC6, R11.4, PEL M5/M6, Shimura C4/C5 and
SF.0/SF.1/SF.5 packets. The four remaining groups of obligations are honest:

- JC1 must supply strong Torelli and its prime-to-characteristic level consequence.
- R11.4 must finish the early semiabelian, represented stable Picard and
  normalization-cohomology comparisons. Algebraic-space descent alone does
  not prove scheme representability.
- C5 must supply the fixed-field all-characteristic minimal extension,
  positive Hodge-power comparison, polarized-trait compatibility and
  independence after minimal contraction. Its theta and Stein/base-change
  leaves are not erased by citing FC V2.3.
- SF.5 must supply generic-finite positivity, finite-cover transfer and
  arbitrary-field component/reduction detection, retaining its asymptotic
  RR/Kodaira proof leaf. The cycle formula uses full inseparable degree;
  nonflat finite maps and dimension0 remain included.

These are precise requests to the existing owners rather than duplicate
definitions. The C4 request imports only the early semiabelian interface,
not its later degeneration suffix into stable Picard. The parent targets are
all represented by the part's refinement table. Both constructions have
classifying/uniqueness, pullback and compatibility APIs and at least three
tests detecting wrong definitions. The constant-family, twist-field,
nonreduced-base, sign, loop, compact-type and imperfect-field checks expose
the main plausible failures. No extra planet or auxiliary lemma node is needed.

No orchestrator decision is needed to accept this pass. Route the five
existing supplier requests before any claim of proof closure. At assembly,
use the explicit JC1 strong-Torelli request rather than interpreting the
parent's upstream Jacobian universal-property reference as that theorem.
Published-version collation of E15-MC6 remains future source work.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.6.json`: no errors or warnings.
- The shared `source_issues.check_issues` and `check_errata.versions_checked`
  validators report no errors for the packet's finding and source versions.
  The standalone errata CLI expects an `errata-v1` job file and is not a
  validator for this blueprint packet.
- `lean-check research/blueprint/suggested/StableReductionPartII--MC.6.lean`:
  exit 0 at the pinned Mathlib, with exactly four expected `sorry` warnings.
  One theorem and three examples elaborate; there are no sorry-bodied data definitions.
- The 70-line suggested file lists every unavailable heavy target as reader-only.
  It states the native retained-coordinate milestone and does not purport to
  implement the moduli/Picard/minimal-space theory.
