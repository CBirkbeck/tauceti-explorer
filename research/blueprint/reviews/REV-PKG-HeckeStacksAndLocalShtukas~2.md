# Independent package review: Hecke correspondences and local shtuka cohomology

Job: `REV-PKG-HeckeStacksAndLocalShtukas~2`; issue #7933.
Reviewer: Codex (GPT-6), session `codex-R8Ivkc`; 10 October 2026.
Verdict: **accepted**.

This session authored neither package round. The review covers the complete
package against the accepted `HeckeStacksAndLocalShtukas` plan, the preceding
package review, the revision, Protocol sections 5, 13 and 20, and the upstream
guide. No additional mathematical correction was necessary. The package files
remain unchanged apart from their independent verdict.

## The remaining first-round request is resolved

R1 required actual reuse of the existing reductive group-scheme carrier.
`Suggested.lean` now imports
`TauCeti.AlgebraicGeometry.AffineGroupScheme.Reductive` and defines `RedGrp F`
as a transparent abbreviation for `TauCeti.ReductiveAffineGroupSchemeCat F.E`.
The previous admitted carrier and admitted category instance are gone.
The category and its morphisms come from the native full subcategory.
The imported definition and its smoothness and geometric-connectedness
instances were inspected at the required Tau Ceti commit.

The downstream associator explicitly names `Limits.prod.associator`, avoiding
the new import's reductive-group product namespace. This preserves the
categorical product intended by the framed-modification signature. The README
accurately separates this field-valued native carrier from an integral affine
model with additional smoothness and fibre hypotheses. Comparison with the
revision commit found no other downstream statement change.

The entire suggested file, including uses of the native category, was checked
afresh. `lean-check` returned **exit 0, zero errors, 997 warnings**, all
`declaration uses sorry`. The decrease from the earlier 999 warnings is
consistent with removing the two admitted declarations. No other warning was
present.

The prebuilt checker's Mathlib HEAD is
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti snapshot has no Git
metadata; comparing all 5,477 Lean source files by Git blob hash with
`f790474821cf4256814db967cb154e7af3d0c369` found no missing or differing
files. In particular the imported reductive module agrees exactly. This
establishes source-pin agreement as well as successful native integration.

## Six acceptance checks

| Criterion | Finding |
| --- | --- |
| Upstream form | Introduction, conventions, ownership boundaries and five ordered layers, with exact targets, prerequisites, sources, API outlines and discriminatory tests. The README is 191,267 bytes, below 200 KB. The current ReductiveGroups and RepresentationTheory/InductionRestriction roadmaps were read as upstream examples. |
| Fidelity | All 51 accepted targets, 215 API items and 94 tests are represented. Target prose was read; API and test statements were compared with the plan. Rewritten internal prerequisite identifiers refer to the corresponding readable HS targets. No unsupported new target was found. |
| Own words and sources | The exposition is organized by mathematical targets rather than by source chapters. Each target has source locators. The eight source PDFs match the accepted version hashes. Sensitive sign, scope and coefficient claims were rechecked as described below; a normalized 25-word phrase comparison found no source passage in the README. |
| No programme process | The README contains no job identifiers, packet paths, review history, checkpoint instructions, worker paths or coverage status. Supplier boundaries state mathematics rather than workflow. |
| Suggested file | Fresh full elaboration passes with only 997 sorry warnings. Target, API and test names occur in the file. Missing geometric and enhanced categorical suppliers remain explicit interfaces; existing native carriers are reused. |
| Metadata | Exactly `topic = "math.NT"` followed by a newline; appropriate for the local arithmetic geometry and Hecke-action targets. |

The target accounting is exhaustive: HS0.1–HS0.6 (six), HS1.1–HS1.10
(ten), HS2.1–HS2.18 (eighteen), HS3.1–HS3.10 (ten), and HS4.1–HS4.7
(seven). All 51 internal anchors resolve. API and test row differences from
the accepted statements are readable references to these same targets.
The added descent API spells out an accepted construction, rather than
introducing a further mathematical claim.

## Mathematical and source checks

The earlier Beauville–Laszlo repair is retained: the image statement
`B(G, mu)` applies to a trivial target. For a general target the relative
Kottwitz identity remains the stated conclusion. The local shtuka convention
uses the inverse cocharacter consistently; it is not silently changed to the
convention for a modification of the trivial target.

Sources were read in the versions recorded by the plan. This review reread
the full target exposition and the source passages governing the following
particularly sensitive interfaces; it does not claim a new cover-to-cover
reading of all eight papers.

- Fargues–Scholze, *Geometrization*, Proposition IX.2.1 through Corollary IX.2.4,
  pp. 321–323; Proposition IX.5.1 and proof, pp. 327–328; proofs of Theorem
  IX.6.1 and Propositions IX.6.2–IX.6.3, pp. 331–332; proof of Theorem IX.7.2,
  pp. 335–337: relative homology, dual adjunctions, continuous Weil descent,
  compactness, product and restriction diagrams, and the torsion unstable
  stratum calculation. The README preserves these distinct scopes and leaves
  spectral-centre conclusions with their owner.
- Scholze–Weinstein, *Berkeley Lectures*, Section 23, pp. 216–224: framed
  modifications, integral models, finite and infinite levels, period torsors,
  and multi-leg geometry. Colliding legs retain intermediate modifications;
  classical integral moduli are comparison inputs rather than a second
  construction. Minuscule and general-bound statements stay separate.
- Howe–Klevdal, Section 7.3, Theorems 7.3.3–7.3.4, pp. 43–44, and
  Gleason–Lourenço, Theorem 3.1 and Lemma 3.3 with proofs, pp. 10–12:
  nonemptiness, the inverse-cocharacter convention, and the precise
  connectedness input. Connectedness and density retain separate hypotheses.
- Gleason–Lim–Xu, published version, Sections 3.5–3.7, pp. 828–829, and
  Section 6.2, Proposition 6.6, pp. 849–850: admissible period torsors,
  classical period points and adjoint-isomorphism comparison. Classical-point
  bijectivity is not promoted to a general non-minuscule diamond isomorphism.
  The component argument retains its topology and openness assumptions.
- Hamann–Hansen–Scholze, p. 2, footnote 1, and Section 7.1,
  Theorems 7.1.3–7.1.4, pp. 60–61: torsion scope and compact stalks.
  The general-bound cohomology target retains the required compact-stalk
  hypothesis instead of extending a torsion proof to arbitrary coefficients.
- Dat–Helm–Kurinczuk–Moss, Theorems 1.1–1.2, p. 1, and Corollary 1.3,
  p. 2: finiteness and second adjointness have different coefficient scopes.
  The package does not reconstruct this representation-theoretic supplier.
- Hamann–Imai, Proposition 4.4, p. 25, and Lemma 4.7, p. 26: the unipotent
  contribution carries a character and degree shift. HS4.6 does not identify
  the resulting Levi object with the original representation without these
  corrections or assert a global arbitrary-coefficient constant-term theorem.

The cohomology targets distinguish compactness, perfect derived Hom at
pro-p levels, and admissibility; the level-index invertibility hypotheses are
preserved. The minuscule cohomological and general relative-homology shifts
are different and explicitly recorded. The final continuous export supplies
the tensor-compatible Hecke input; it does not prove uniform finite
ramification or manufacture a tensor generator by unjustified closure
operations.

## Ownership, libraries and validation

The five reviewed library-audit rows, all eight baseline declaration
statements, and the native smooth-discrete representation predicate and full
subcategory were inspected. Existing ordinary representations do not provide
the enhanced derived category used here. The plan's outdated absence wording
does not justify replacing an available carrier, and the revised package
correctly uses the actual library interface.

The current read-only roadmaps and library were checked, including the nine
post-snapshot roadmaps named by WORKERS.md. Their Hecke-related material in
IntegralLattices concerns classical modular forms and does not duplicate
these local Fargues–Fontaine correspondences. Global function-field shtukas,
geometric Satake, six operations, bundle strata, and excursion operators keep
their stated owners. The incident ClassFieldTheory-to-HS1 link is compatible
with the continuous Weil-action interface. No owner move is needed.

Current read-only revisions at the audit were TauCetiRoadmap
`dea8191cc6047d6142a65872ebce6eeeb841a29b` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The former check includes
the actual current roadmap additions rather than relying on the atlas snapshot.

`python3 scripts/check_blueprint.py
research/blueprint/packets/HeckeStacksAndLocalShtukas.json` reports zero
errors and zero warnings. The accepted input and package mathematics were
not edited. Acceptance certifies the roadmap and its elaborating signatures,
not a formalization: the nine gaps and 22 supplier requests remain explicit,
all five stages remain planned, and none is marked closed. There is no
remaining package-review correction or checkpoint work.
