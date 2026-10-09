# Independent package review: Isocrystals, vector bundles and Banach–Colmez spaces

**Verdict: accepted.** Codex, session `codex-DvVDth`, 2026-10-09.
This reviewer did none of either package-writing job. The claim on
[issue #7942](https://github.com/CBirkbeck/tauceti-explorer/issues/7942)
was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/7942#issuecomment-6091176611)
before work began. This is a completed independent review.

The revision repairs the previous review's executable-type failures. Its
remaining signatures describe constrained algebraic, categorical or numerical
components, and its omission indexes retain the full geometric contracts.
The README remains the specification. Acceptance concerns the package's form,
faithful transfer and suggested signatures; admitted proofs and explicitly
omitted geometric interfaces are work for implementors.

## The six checks

| Check | Result and evidence |
| --- | --- |
| Upstream form and size | Pass. Purpose, boundaries, conventions, construction order, library starting points, ordered layers, APIs, discriminating examples, sources and prerequisites follow UPSTREAM_GUIDE. AlgebraicVectorBundles and AdicSpaces were read as current upstream examples. Final README: **196,551 bytes**, below 200,000. |
| Fidelity to the accepted plan | Pass after the supplier clarifications below. Both accepted parts contribute **127 distinct targets, 168 API entries and 124 tests/examples**. All target statements, **121 hypothesis entries** and **549 original prerequisite entries** transfer, with the scoped conventions retained. |
| Own words and locators | Pass. Every target has theorem/section and page locators, with distinct CN editions identified. The document organizes mathematical targets rather than summarizing successive source sections. Selected source passages were independently read; no passage was copied. |
| No process in the README | Pass. No packet paths, job IDs, reviews, checkpoints or coverage statuses. Chart coverage means mathematical coverage. All **387 local target links** and **157 source-reference uses** resolve. |
| Suggested Lean | Pass. All executable types were inspected independently against the mathematical contracts. Whole-file `lean-check`: **exit 0, no errors, 156 warnings, all `declaration uses sorry`**. No new executable declaration was needed for the supplier corrections. |
| Metadata | Pass unchanged. Exactly `topic = "math.NT"` and a newline. |

The transfer audit compared every node with its target anchor and contract
index. Of 127 statements, 115 also match after whitespace normalization; the
12 remaining prose changes preserve the mathematics while removing process
references, spelling out a proof obligation, or importing the current generic
bundle supplier. The three API/example wording differences likewise preserve
the contracts. Hypotheses grouped at subsection level were checked explicitly:
the KL analytic-base assumptions cover the pure-model and Robba targets, the
ampleness subsection adds Hypothesis 8.7.1, and the classical BC targets retain
the fixed-C countability and separability conventions. SW's abstract category
keeps its separately stated broader scope.

| Accepted owning stage | Targets |
| --- | ---: |
| VB0 | 9 |
| VB1 | 19 |
| VB2:ampleness | 14 |
| VB2:classification | 9 |
| VB3:positive-basic-examples | 3 |
| VB3:projectivized-properness | 3 |
| VB3:general-BC | 36 |
| VB4 | 34 |

## Previous review's signature failures

The [previous review](REV-PKG-VectorBundlesAndIsocrystals.md) distinguished
false universal signatures from legitimate partial prototypes. The revision
follows that distinction; removing a signature does not remove its target.

| Previous failure | Independent check of the revision |
| --- | --- |
| Arbitrary cover comparisons, short-complex exactness and category equivalences | The cover, untilt sequence, family geometry, local-system comparisons and Le Bras equivalences have explicit omissions with actual carrier and hypothesis requirements. `BC.exactSequence` instead takes a genuinely short exact sequence of complexes and uses the native homology exact-sequence API. |
| Zero-preserving functors treated as exact faithful evaluation | `ExactBanachPoints` and unrestricted base change are omitted. Derived cohomology is genuine homology; linearity requires additive and linear functor instances. |
| Arbitrary dimensions, heights and presentation independence | Unsupported invariant theorems are omitted. `BCPresentation.stabilize` requires an additive constant-space functor, retains both short exact sequences and adds the same finite summand to both ranks. The remaining height and slope conversions are explicitly numerical. |
| Missing assumptions on tilted-heart constructors | Positive/negative constructors use the actual single-degree derived embeddings and require zero-object and isomorphism compatibility of profiles. The four fixtures carry those hypotheses. Curve-specific splitting is omitted. The triangular Hom component uses the standard vanishing of negative Ext. |
| Pure lattices and incompatible base change | Boundedness is p-power commensurability with a finite submodule, without making the lattice finite. Nonzero uniformizer, fixedness and semilinearity are explicit. Base change is omitted. B-span and setwise normalized Frobenius are expressly distinguished from the missing tensor identification and integral linearization. |
| Arbitrary ranks, annular bases, gauge matrices and restrictions | The unsupported basis, trivialization, vertex, gauge and negative-cohomology signatures are omitted. Their full rank, matrix-bound, strict-gap, coefficient and canonical-map requirements remain in the contracts. |
| Arbitrary Hom vanishing, curvature identities and period invariants | Unsupported comparisons are omitted. Retained predicates use actual Hom spaces, monos/epis, short exact extensions and kernels of natural maps. No arbitrary period object or supplied height function is asserted to have the source's properties. |
| Arbitrary profiles claimed open or semicontinuous | Openness and semicontinuity signatures are omitted. Finite-list positivity, pullback, surjective descent and slope-sum components remain ordinary numerical statements. |
| Arbitrary spaces claimed to have BC geometry | Spatiality, properness and the negative quotient examples are omitted. Scalar-orbit quotients are explicitly objectwise. The surviving contracting-action lemma retains every genuine topological assumption and the pinned specialization orientation. |

The revision's 66 VB3 omissions and removed generic schematic `CurveBundle`
prototypes were checked against their retained names and full contracts.
Neither arbitrary proposition fields nor assumed geometric conclusions have
been introduced. The earlier corrected Artin/Lubin–Tate ownership, GLX
edition/consumer locator and finite-submodule boundedness remain intact.

## Corrections made in this review

Current upstream was inspected read-only at TauCetiRoadmap
`618e0b30d21791d6a492ce88ba8602745697b21a`, with current Tau Ceti library
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

1. The coefficient-field prerequisite now imports the completed maximal
   unramified extension, extended arithmetic Frobenius and fixed field from
   **ReductiveGroupsPartII RG2.0.4**. LocalFieldsRamification Layer 2 remains
   the unramified-extension supplier; RF0 remains the ramified Witt-comparison
   supplier. The suggested contract index makes the same distinction.
2. The integral torsor scope attributed the stronger integral tensor dictionary
   to ReductiveGroupsPartII, whose current targets do not contain it. The
   package now makes reconstruction an explicit ingredient of the existing
   integral-group-torsor target, citing **SW Theorems 19.5.1–19.5.2,
   pp.178–180**, alongside **Proposition 22.6.1, p.213**. It imports the already
   planned smooth affine models from **RG2.3.1** and Lang's theorem from
   **RG2.3.7**. The README and omission contract agree. No parallel integral
   model or Lang development is planned here.

These corrections supply precise ownership and proof ingredients for existing
targets without weakening their conclusions. All original prerequisites
remain; the current upstream suppliers are additional explicit citations.
The accepted inputs and link maps were not modified. A later authorized
integration should reconcile their older generic bundle/completion references
and integral-dictionary request with these current suppliers and the local
reconstruction contract. The ClassFieldTheory, LocalFieldsRamification,
SemisimpleAlgebras and AdicSpaces link-map boundaries were checked: arithmetic
Brauer normalization is distinct from its curve-specific sign comparison, and
Lubin–Tate geometry is not attributed to ClassFieldTheory.

The revision correctly imports AlgebraicVectorBundles L0A–L0C. Current native
`FiniteLocallyFreeSheaf`, its finite free sheaves and pullbacks,
`pullbackId`, `pullbackComp`, and the equivalence with one finite local-basis
witness were read. Their generic schematic infrastructure is not rebuilt in
the suggested file; analytic FF bundles and the analytic/schematic comparison
remain targets here.

## Sources and validation

Five public editions were independently authenticated. Source rereading is a
selected hypothesis check, not a claim to have reproved every accepted target.

| Public edition | SHA-256 | Passages read |
| --- | --- | --- |
| [FS, Geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` | II.2.2–II.2.4, pp.60–61; II.2.17, pp.72–74; II.3.3–II.3.5, pp.78–80; II.3.8 and II.3.10, p.83. |
| [KL, 1301.0792v5](https://arxiv.org/pdf/1301.0792v5) | `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942` | Definition 7.3.1, Remark 7.3.2 and Lemma 7.3.3, pp.147–148; Theorem 8.7.13, p.179; Corollary 8.8.7, p.182; Corollary 8.8.14, Theorem 8.8.15 and Remark 8.8.16, pp.184–185. |
| [CN, author copy](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf) | `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a` | §3.1.1 with footnote 6, p.12; Remark 3.1 and Proposition 3.2, p.13; Theorem 3.12 and §3.2.5, pp.15–16; Proposition 3.17 through Lemma 3.24, pp.18–19. |
| [SW, Berkeley Lectures](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) | `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` | Theorems 19.5.1–19.5.2, pp.178–180; Proposition 22.6.1 and proof, p.213. |
| [Lurie, Lecture 26](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf) | `73fcb0f228e194ba1e4db21957702d861d6abaeae4c11bc3a66511a0b91251ea` | Definition 1, p.1; Example 5 and Theorem 6, p.2; bundle convention and Warning 17, pp.2–3. |

No restricted book was required. A 16-word source/reader match screen against
these editions found no matches; mathematical fidelity was assessed separately.
The audit of all accepted citations preserved their exact locators and edition
labels, including those outside this selected rereading.

All **29 baseline declaration statements** were read at the exact Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` pins. In particular, native Witt
isocrystals need not be finite, their classification theorem is rank one,
finite/free local-generator conditions share a witness, pinned line classes
are a commutative monoid, and Brauer constructors assume central simplicity
and finite dimension. Native sheaf, derived-category, short-exact, homology,
spectral and specialization interfaces supply the retained components.
The reviewed library audit has no dedicated row for this roadmap; the nearby
Bun_G and p-adic Hodge entries do not supply the missing FF or BC geometry.

Reproducible checks:

- Both accepted packets passed `python3 scripts/check_blueprint.py`:
  **0 errors, 0 warnings** each (51 VB0 nodes and 76 VB3 nodes).
- Independent whole-file `lean-check research/blueprint/packages/VectorBundlesAndIsocrystals/Suggested.lean`:
  **exit 0, 156 sorry warnings only**. Memory available before the final run:
  **102 GB**. Runs were serial; no language server or build/update/cache command
  was used. The review changes only comments in the suggested file.
- The shared Mathlib checkout has the exact pin. All **seven transitive
  Tau Ceti imports** were compared byte-for-byte against their pinned sources:
  `AdicSpace.Spa.Basic`, `AdicSpace.Cont.Basic`, `AdicSpace.ValuationSpectrum`,
  `Valuation.Continuous.Basic`, `Valuation.Trivial`,
  `Valuation.ValuativeRel.Basic`, and `Valuation.ValuativeRel.Comap`.
- JSON/TOML parsing, target/source/link checks, submission-path checks and
  `git diff --check` pass. Only authorized package files, this report and the
  required handoff are changed.

No package-review blocker remains. The full source-level geometry, local
comparisons and omitted signatures remain explicit implementation obligations;
the successful Lean run does not establish their proofs.
