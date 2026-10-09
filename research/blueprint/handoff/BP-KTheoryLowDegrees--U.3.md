# BP-KTheoryLowDegrees--U.3

Issue #7559; Codex session `codex-flY2Wo`; branch `codex-flY2Wo-u3`.
This is a complete planning pass. U.3 is **planned**, with one precise
LieGroups supplier request and the matching gap. It is not marked closed and
no declaration is claimed to be implemented.

The packet imports all 44 U.3 targets from the accepted U.1 packet and adds
six declarations: one homotopy-transfer construction, four promoted API
lemmas, and one no-SL-contraction theorem. It has five API items, three tests,
17 checked baseline declarations and no new planets. The parent's six U.3
planets are preserved. The parent packet and all other jobs are untouched.

The new application step bundles a jointly continuous determinant-one matrix
homotopy in the existing SL subtype, postcomposes with the supplied native
SO retraction, and proves the initial, final and basepoint equations
separately. For the final equation the parent Spin-coordinate comparison
provides a native SO witness at each circle point. Surjectivity of the circle
exponential is used pointwise; no continuous choice of angle is assumed.
The parent's no-SO-contraction lemma supplies the contradiction.

The only mathematical input to discharge is the request to
`tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`:
for **every N≥2**, a continuous map from the existing real SL matrix subtype
to SO(`realCliffordForm N 0`), with the pinned induced SO topology, identity
equation and coordinate-fixing equation specified in the packet. A supplier
using matrix SO must also give a public continuous comparison into native
quadratic-form SO with unchanged coordinates. The comparison in the pinned
`RealSpecialOrthogonal` source is private and is not a public baseline API.
Do not construct Iwasawa, another SO group, or another Spin cover here.

Once the supplier has an exact declaration or node, replace the requested
stage prerequisite with it. At assembly, add
`KTheoryLowDegrees:U.3/circle-no-sl-contraction-via-retraction` to the proof
prerequisites of the existing `SK1-real-circle-nonzero` target, as recorded
in `targetRefinements`. The parent trivial-class lemma provides the finite
based contraction. No further topological computation or ring-theoretic
decomposition is required by this application step.

Validation:

- `scripts/check_blueprint.py` passed with zero errors and zero warnings,
  including a second run against an index generated in memory from the
  actual pinned versions of every cited module. All 17 references resolved.
- The four deliverables passed `research/blueprint/intake.py check-files`.
  A correspondence check verified every API and test name, all 44 imported
  ids, the six existing planets, cross-packet acyclicity and absence of local
  paths, source excerpts and mathematical-reader code.
- The full suggested file was submitted to `lean-check`. It could not
  elaborate because the shared build lacks the compiled Tau Ceti
  `LinearAlgebra.CliffordAlgebra.RealForm` import. The native SO topology
  import is also absent there. No build, update, cache fetch or language
  server was started. **The native suggested file is not compiled.**
- A scratch signature check substituting Mathlib's matrix SO carrier is a
  separate sanity check, not verification of the native suggested file.
  It elaborated at the pinned Mathlib with exit status zero and only the
  expected placeholder warnings. The native deliverable retains its actual
  Tau Ceti imports and quadratic-form SO carrier.

Sources read: Weibel, author-hosted combined K-book draft dated 29 August
2013, Proposition III.1.5 and Examples III.1.5.3–III.1.5.4, printed
pp.184–185 / PDF pp.192–193; Morris, *Introduction to Arithmetic Groups*,
version 1.0 of April 2015, §7.1, Theorem 7.1.1 and Exercises 1–4, printed
pp.152–154 / PDF pp.168–170. Public URLs, access date and SHA-256 hashes
are in the packet. The precise native topology and coordinate declarations
were read at the pinned commits. No needed source text is missing; the
remaining boundary is the external supplier API. All source statements and
proof descriptions are in the worker's own words.

The scratch sources and logs are disposable and contain no state required
by the next worker. Resume from the supplier request and the exact six-node
application bridge in the deliverables.
