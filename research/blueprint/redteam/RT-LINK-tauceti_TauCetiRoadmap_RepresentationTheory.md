# Red team: representation-theory index link map

**Complete: no new findings against the accepted map.** The result is scoped
to the exact family-index owner. It does not certify the twelve child
roadmaps, their link maps, mathematical proofs or library implementations.

Codex, session `codex-rtOQ9t`, 2026-09-30; issue #4368. Claim comment
5911930629 was confirmed by bot comment 5911933337. Base:
`1823c502a4d131083effaca47c7c9cb04915a8ad`. The author was ChatGPT Pro
cgp-212bf5d92a8b and the reviewer Codex codex-c83e7a; neither is this worker.

## Empty ownership is still the correct boundary

I read the entire index README, accepted packet, producer handoff and
independent review. The README describes a family and explicitly identifies
itself as an index. The accepted packet emits no links or overlaps, rather
than attributing child stages to their parent.

The current checks use the whole data sets, not a sample:

| View | Roadmaps | Stages | Stages owned by the exact index |
| --- | --- | --- | --- |
| Raw atlas | 212 | 1,968 | 0 |
| Link-validator world, including nine research definitions | 221 | 2,028 | 0 |
| Production assembly | 211 | 2,840 | 0 |

The differing totals reflect assembly and research inclusion, not a change
in the root's ownership. The subject extract also has empty `stages` and
`stageEdges`. The twelve distinct children still own 105 stages:

| Child | Stages | Child | Stages |
| --- | --- | --- | --- |
| SemisimpleAlgebras | 8 | CharacterTheory | 10 |
| InductionRestriction | 10 | RootSystems | 6 |
| AdoIwasawa | 10 | LieHighestWeight | 10 |
| ClassicalGroups | 7 | SchurWeyl | 10 |
| CompactGroups | 7 | LieGroups | 10 |
| SpinRepresentations | 10 | QuiverRepresentations | 7 |

I checked exact owner equality and exact root stage prefixes; a child ID
sharing the root's path prefix is not counted as root-owned. All nine
supplemental definition IDs differ from the root. The three added since
the original review are RiemannianGeometry,
SeveralComplexVariablesKahlerGeometry and SymplecticContactGeometry.
Research blueprint packets, integrated decompositions, reserved IDs and
the reviewed coverage file introduce no root stage. The 36 research link
packets and 25 promoted link packets contain no exact-root stage endpoint.

Under §10, a link for this owner requires an owned endpoint. That set is
empty for every current partner, so no missing admissible stage link can
be supplied by choosing another catalogue entry. The existing rescope
recommendation correctly keeps the index as a collection and the children
as mathematical owners. Its nine `examined` entries remain a reading
ledger, not a representation-theory-wide proof audit.

## Existing aliases do not supply a mathematical root stage

I explicitly checked a possible loophole in the ownership argument.
`UPSTREAM:RepresentationTheory` is an external alias with four current
graph edges, to AF.1, AF.1a, AS.0 and QM.6. Thus zero owned stages must not
be paraphrased as absence of all representation-related dependencies.
The alias record itself says that exact theorem availability and signature
matching remain unverified. The external placeholder is not a stage owned
by the index.

The packet already requests replacing coarse references with exact
child/baseline contracts. It does not certify the four placeholder edges,
introduce a parent theorem, or assert that consumer constructions are
complete. The retired FoundationsAndLibraryIntegration references in
QM.1/QM.6 are also explicitly identified in the packet. I confirmed the
retirement record. These acknowledged handoff obligations are not new
findings against the accepted index-only map.

## Six routing notes checked against the actual source contracts

All six routing quotations, the index quotation and the projective-source
quotation match literally. All nine original README Git blobs still match
the physical current files. I read the full selected stages below and
their relevant scope/convention passages. InductionRestriction Layers 0,
2 and 7 and CompactGroups Layers 0, 1, 2 and 5 were also read in full.

| Consumer | Attack and disposition |
| --- | --- |
| ArithmeticGaloisRepresentations R01.1/4/5/G7 | Algebraic induction and a factor-set construction do not supply continuity, invariant lattices, coefficient descent or characteristic-p recognition. The note requires exact supplier matching and preserves these arithmetic tasks. It makes no unsupported library-absence claim. |
| AutomorphicFormsOnReductiveGroups AF.1/1a/4 | Compact complex averaging does not provide smooth Fréchet globalization, relative cochains or van Est. The consumer explicitly owns those constructions. Retain finite-length, coefficient and disconnected-component hypotheses. |
| AutomorphicSpectralTheory AS.0/4 | Compact Peter–Weyl Hilbert sums do not discharge measurable direct integrals, residual/Eisenstein terms or spectral surjectivity. Those are explicit consumer outputs, as the note says. |
| DeligneWeightsAndPurity DWP.0/2/8 | DWP.2 retains its rational ℓ-adic symplectic tensor invariant/coinvariant calculation and coefficient comparison until an exact supplier is shown. DWP.8's geometric semisimplicity is not ordinary finite-group Maschke, nor arithmetic Frobenius semisimplicity. No unsupported substitution is approved. |
| QSeriesPartitionsAndMockModularForms QM.1/6 | The family excludes affine/general Kac–Moody theory. A finite-character input does not construct the VOA/Monster/no-ghost/denominator chain or prove genus zero. The note preserves that chain in QM.6 and records the retired gates. |
| SmoothRepresentationsOfLocalGroups SR.0/1/2/2a/3a/6 | Smoothness, support modulo a subgroup, adjunction direction and modulus are additional data. Pro-p averaging requires p invertible, while late integral finiteness has narrower coefficient hypotheses. The note retains the early/late distinction and does not derive characteristic-p exactness from complex compact averaging. |

In the induction supplier, the commutative-ring functorial core and
division-free coset character formula are distinguished from averaged
formulas and Maschke/splitting-field hypotheses. In the compact supplier,
the averaging and finite-dimensional reducibility contracts are over ℂ
with continuity and compactness. The map's recommendations respect those
boundaries. This is a source-contract audit; it does not certify every
proof outline or implementation statement in either child README.

## The already-recorded projective counterexample survives

The actual InductionRestriction Layer 7 still contains the sentence
equating projective equivalence with cohomology of factor sets, followed
by the contradictory warning that factor-set classes do not classify
representations. The packet already records this source error and the
correct replacement; it is not omitted from the accepted work.

For C₂ on ℂ², take the generator to I₂ or diag(1,−1). Exact integer matrix
multiplication checks all four products in each representation. Both are
genuine normalized lifts, so their factor sets are identically one. Their
projective kernels have sizes two and one, since diag(1,−1) is not scalar.
Projective conjugacy preserves kernels. This verifies the counterexample
without a bibliographic or library-existence assumption.

Changing a lift rescales its cocycle by a coboundary; a fixed factor-set
class admits a category of twisted-group-algebra modules. Preserve the
existing correction rather than reporting the same source defect as a new
error in the link map.

## Provenance, validation and limits

Public sources are the repository documents at the inspection base,
including the [index](https://github.com/CBirkbeck/tauceti-explorer/blob/1823c502a4d131083effaca47c7c9cb04915a8ad/content/tau-ceti/RepresentationTheory/README.md),
[induction supplier](https://github.com/CBirkbeck/tauceti-explorer/blob/1823c502a4d131083effaca47c7c9cb04915a8ad/content/tau-ceti/RepresentationTheory/InductionRestriction/README.md),
[compact supplier](https://github.com/CBirkbeck/tauceti-explorer/blob/1823c502a4d131083effaca47c7c9cb04915a8ad/content/tau-ceti/RepresentationTheory/CompactGroups/README.md)
and the six `content/campaign/<consumer>/README.md` documents named in the
table. All were inspected on 2026-09-30 at the scope stated above. The
packet's nine immutable source paths and Git blob hashes still identify
the exact bytes. No external monograph or paper proof audit is claimed.

Input SHA-256 hashes:

- Accepted packet:
  `25465cbe6da416772ffe36bd3acebeb50aad1a9f6095a73080b5f84dd62c16f9`.
- Physical index README:
  `e757a62b95fb39a930dba604bf09a1e657555ab52641c8589850e39e5c09324e`.

`check_links` passes with zero links, zero overlaps, nine examined entries
and zero errors/warnings. Read-only assembly succeeds with 2,840 stages and
8,007 edges; merging the accepted empty packet preserves the complete
edge-pair set. The red-team checker, deliverable intake and staged
whitespace checks pass before submission.

The target cites no baseline declaration as built or absent. Its Mathlib
082e2d3 and Tau Ceti f790474 pins are retained as context, not converted
into a new library claim. No Lean file is changed or compiled. The child
jobs and unresolved consumer interfaces keep their existing status.
