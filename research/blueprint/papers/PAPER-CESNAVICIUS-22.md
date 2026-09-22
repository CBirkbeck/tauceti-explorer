# PAPER-CESNAVICIUS-22: extraction and routing checkpoint

Status: partial. Agent: Codex; session codex-a71f92; issue #1389.
The author version was read completely. This is a source-backed planning
checkpoint, not a formalization and not a claim of transitive source closure.

The JSON contains 149 items: 8 pinned-library imports, 10 planned imports, and
131 missing items, each routed exactly once. Its 29 definitions have use-derived
API outlines and 87 mathematical test statements; none of those tests ran in Lean.
There are 26 explicit gap records. No Lean deliverable is required by this paper job.

## Result and scope

Let O be a Dedekind ring, allowing fields and finite products, and let R be a
regular semilocal flat O-algebra with geometrically regular O-fibers. For a
quasi-split reductive R-group G, Theorem9.1 proves

    ker(H¹(R,G) → H¹(Frac(R),G)) = {*},

where Frac means the total ring of fractions. In the local case this gives
Theorem1.2 for unramified regular local rings. It is a trivial-kernel theorem,
not a claim that every twist remains quasi-split or that every such H¹ map is
injective.

Theorem9.3 says that any reductive G over the same R is split exactly when its
generic fiber is split. Corollary1.3 gives the ordered factorization
G(Rhat[1/r]) = G(Rhat)·G(R[1/r]) for principal completion.

Theorem9.5 has a different hypothesis: every R-form of G_ad must have H¹
injectivity. Under that hypothesis, generic quasi-splitness descends. The
equicharacteristic consequence imports the full Fedorov–Panin/Panin result;
Theorem9.1 alone does not supply it. Conjectures1.1 and9.4 are not extracted as
proved results.

For Corollary9.6, 2 must be invertible. The proof uses the orthogonal-torsor
interpretation and CT79's cancellation equivalence to reduce to hyperbolic
forms of even rank. It does not declare arbitrary SO inner forms quasi-split.
The two H¹ injectivities and the isometry-descent result are separate items.

## Versions and corrections

The main source is the [author's November8,2022 PDF](https://www.imo.universite-paris-saclay.fr/~kestutis.cesnavicius/split-unramified.pdf),
all32 pages including proofs, footnotes and references.
Its SHA-256 is
984748e90f36730ddf4295176ca4b12e6aa7235c141461c0354e40320ef7476a.
Access date is2026-09-22.

The published paper is Forum of Mathematics, Pi10(2022),e9,1–30,
[DOI10.1017/fmp.2022.5](https://doi.org/10.1017/fmp.2022.5).
The publisher's Lemma6.3 statement/proof opening and Theorems9.1,9.3,9.5
with proofs were compared. Numbering and relevant hypotheses agree; the
publisher lacks the later correction footnote. The remaining publisher pages
were not reread in full. The [arXiv v7 history](https://arxiv.org/abs/2009.05299v7)
explicitly records a postpublication footnote on p.20. Its PDF is dated
November9, despite the November8 submission date. No exact byte/text identity
between the PDFs is asserted. All acquired PDF hashes and reading limits are
in supportingSources.

Three repairs matter to the dependency graph:

1. In Lemma6.3, the coefficient-field identification of a first-order thickening
   need not be linear over an imperfect residue base field. The corrected
   argument uses CTHK97 Theorem3.1.1 to embed each thickening in the affine line
   and separates their images by translations. An imperfect field is infinite.
   The perfect-field argument retains the coefficient-field construction.
2. [Gille's2005 erratum](https://math.univ-lyon1.fr/~gille/publis/erratum05.pdf)
   repairs the parabolic-type step in Gil02 Lemma3.12. The type must descend
   using the proper parabolic scheme and specialization at the normalized
   infinity fiber. The original lemma cannot be imported with its unrepaired proof.
3. [Gille's May26,2026 errata](https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf)
   repair Gil09 Lemma4.5. For M=Z_H(S)/S, special-fiber anisotropy is first
   transferred to the generic fiber, including its central torus, before Guo's
   integral-points theorem yields M(O)=M(K). The split-torus reference is
   Borel–Tits Corollary6.8, replacing Proposition6.11.

The corrected dependencies are explicit items, not comments that disappear
behind an unqualified citation.

## What was extracted

| Portion | Main coverage and guards |
| --- | --- |
| §§1–2 | Local theorem, completion factorization, quasi-pinnings, quasi-trivial Borel tori, and SC reduction with factorial strict henselizations |
| §3 | Avoidance; all three Bertini conclusions and successive degree control; weighted charts/blowups; seven field projection and seven Dedekind-base projection conclusions |
| §§4–5 | Curve fibration, torsor lifting, unipotent reduction, compatible quasi-pinning, finite étale equating, and constant-group curve torsor |
| §6 | Point-count cover, simple residue extensions, corrected thickening embedding, cartesian flat presentation, infinitesimal neighborhoods and monic polynomial |
| §7 | Torsor patching, support excision, the two distinct filtered-group claims, and affine-line reduction |
| §8 | Total isotropy, projective-line descent, corrected field/Whitehead inputs, residue loop cosets and affine-line triviality |
| §9 | Main semilocal theorem, ring examples, split descent, conditional/equicharacteristic quasi-split descent and three quadratic consequences |

Simultaneously constructed existential tuples, such as a curve with its section,
group and torsor, remain one existential item. Independently stated conclusions
are split. Some supporting-source projection and approximation arguments still
need finer declaration-sized decomposition; this is recorded rather than hidden.

Important conventions are retained. The paper's regular sequence allows a zero
terminal quotient, so the matching Mathlib notion is IsWeaklyRegular, not
IsRegular. Its quasi-split convention includes a quasi-pinning: a Borel, a
maximal torus, and the simple-root-line trivialization. Over a semilocal base
existence of a Borel is equivalent, but not over arbitrary bases. A smooth
curve's closed residue extension is simple, not necessarily separable.

Proposition4.1 uses total codimension≥2; Variant3.7 uses fiberwise codimension.
The finite-field Bertini argument allows successively sufficiently large
degrees divisible by the characteristic exponent, not necessarily equal
degrees. Weighted blowups are not assumed to commute with nonflat base change.

Lemma7.2(b)'s kernel statement concerns a smooth S-group with normal vector
filtration. Its surjectivity statement concerns a U-group with central vector
quotients. Proposition8.4 requires total isotropy, semisimplicity, simple
connectivity, and a torsor trivial outside an R-finite closed locus. Its proof
lifts loop cosets; it does not assert surjectivity of the raw loop-group map.

## Library and ownership findings

The baseline is Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Cetif790474821cf4256814db967cb154e7af3d0c369. Actual statements were
read for the regular-local, weak-regular-sequence, absolute Proj, henselian,
sheaf-cohomology, reductive-field, simply-connected-field and Borel-field
imports. The source paths and declaration references are in libraryAudit
and baseline.

The field restrictions are material. Tau Ceti already has substantive
reductive, semisimple and Borel theory; it would be incorrect to call that
missing. Those predicates do not, merely by their existence, supply a
general-ring reductive group or the semilocal torsor theorems.

Reviewed SF.0/SF.1/SF.2/SF.4, R03.3 and LPV.3 audits were read. There is no
reviewed coverage entry for either reductive-group roadmap in the inspected
data, and none is fabricated. Exact layer text and pinned declarations were
used instead.

Upstream ReductiveGroups' Layer8 already owns relative theory, classification,
central isogenies and the associated foundation interfaces. Layer9 supplies
pinned integral split models. StableReduction Layer2 owns finite-type relative
Proj and proper-curve cohomology/base change. The new work imports both rather
than putting duplicate constructions in foundational campaign layers.

The atlas, new roadmaps, packets, integrated decompositions, paper results and
reserved IDs were screened. Accepted RS25 and RS31 boundaries were checked.
The separate Gille–Parimala semiglobal-flags proposal concerns a different
arithmetic direction; it is not a regular-semilocal GS owner.
LefschetzPencilsAndVanishingCycles:LPV.3 supplies relevant shared incidence
geometry, but its finite-field point after extension is not CES22's original
base-field presentation theorem. Existing special Bertini/projection uses
are not treated as complete general owners.

## Routes

Six source routes retain the shared foundation owners:

- SchemeAndStackFoundations:SF.0: regular maps, approximation, étale components
  and the affine-target comparison.
- SchemeAndStackFoundations:SF.1: torsors, twisting, torus purity, nonabelian
  sequences, flat-neighborhood patching and filtered affine H¹ vanishing.
- SchemeAndStackFoundations:SF.2: quasi-coherent and supported cohomology,
  flat excision and multiplicative-type H².
- SchemeAndStackFoundations:SF.4: formal gluing, including the non-Noetherian
  input needed for arbitrary semilocal rings.
- DeformationAndDerivedPatchingAlgebra:R03.3: regular-local/factorial and
  Cohen–Macaulay flatness algebra.
- ReductiveGroupsPartII:RG2.0a: the existing affine finite-type Weil restriction
  owner, with its Shapiro interface.

Two new directions are proposed as Part II extensions, not edits to upstream:

**Scheme, stack, cohomology and intersection foundations, Part II: arithmetic
geometric presentation** (SchemeAndStackFoundationsPartIIArithmeticPresentation)
owns the41 geometric items beyond carrier-level foundations. Its final targets
are Proposition4.1's relative curve fibration and Lemma6.3's cartesian
affine-line presentation, with the exact finite/imperfect-field corrections.
The parent is its first prerequisite. The JSON brief specifies the imports,
all intermediate results, non-goals and degree/base-change guards.

**Reductive groups, Part II: unramified Grothendieck–Serre**
(ReductiveGroupsPartIIGrothendieckSerre) owns62 missing application and
torsor-theory items. It begins after the upstream reductive foundations and
imports the geometry extension and existing cohomology/descent suppliers.
Its exact final targets are9.1,9.3, conditional9.5, its separately sourced
equicharacteristic consequence,9.6 and the local/completion corollaries.

General henselian-DVR Bruhat–Tits scope is an unresolved boundary, not a
license to construct a second building. The inspected RG2.2/RG2.3 local-field
scope does not cover all imperfect/infinite residue fields needed by Guo.
The JSON requests an owner/scope decision for precisely those interfaces.

## Remaining work and checks

The main paper, CTHK97 §3, selected Moret-Bailly descent proofs, Gille's §3
and2005 erratum, the Whitehead §4 and2026 repair, and all of Guo v3 have been
read as recorded. Gille02's text encoding is corrupted; its relevant pages
were read as images, including the introductory standing hypotheses.

The highest-priority missing primary chains are CTS87 and CTS79 purity,
GLL15/Gab01 Bertini, the relevant SGA3/EGA interfaces, Moret-Bailly's earlier
descent algebra, non-Noetherian formal gluing, Gil21/Alp14, Harder/Tits/Borel–Tits,
general henselian Bruhat–Tits, Popescu's linked proofs, FP15/Pan20, and CT79
cancellation. Each gap names its consumers. The report makes no claim that all
transitive definitions and lemmas have already been enumerated.

The handoff records the executed checker and custom audits. No catalogue,
upstream document, packet, audit or library file is changed by this submission.

