# BP-ColemanPowerSeries: continuous arithmetic norm transitions

Codex — codex-7e92bd. Issue #699; claim 5861384811 confirmed by exact bot
reply 5861386093. Whole issue read before and after claiming. Partial checkpoint;
every node remains unchecked.

## Delivered

208 nodes: 2 definitions, 21 constructions, 146 lemmas, 26 theorems and
13 comparisons; 112 API items (105 on definitions/constructions), 159 packet
tests (77 on those objects), 161 typed examples, 12 planets and 263 baseline
citations. Six gaps, twelve requests, thirteen inherited source findings and
zero closed stages remain.

Fourteen new nodes comprise two constructions, nine lemmas, one theorem and
two comparisons. They supply continuous relative field, integral and unit
norm transitions; actual Frobenius evaluation; relative coordinate and
multiplication-matrix specialization; the integral and unit norm/evaluation
square; reduction of evaluation; preservation of unit residues; and adjacent
compatibility for norm-fixed unit series. All 194 predecessor whole nodes,
258 baseline records, twelve requests, thirteen findings and preceding
suggested-file bytes are preserved. Only the L0/L1 remaining work is narrowed.

## Mathematical argument

The actual fields K_n, integral closures O_n, roots ζ_n and differences ϖ_n
retain their existing native topologies. The source level is n+1. Relative
coordinates are continuous by restricting their scalars to ℚ_p and applying
native finite-dimensional linear continuity over the complete field ℚ_p.
The native field norm is the finite determinant of multiplication in the
existing relative basis, so it is continuous entry by entry.

Native preservation of integrality corestricts this specified field norm to
integralNorm:O_(n+1)→O_n. The subtype topology gives continuity. Scalars map
to their pth powers; ϖ_(n+1) maps to (−1)^(p+1)ϖ_n. The generic native
Algebra.intNorm is not replanned: this is the actual field-norm corestriction
without assuming a separate relative integral-algebra setup. Native Units.map
and Continuous.units_map give unitsNorm as a ContinuousMonoidHom on the
actual full unit groups. No full-unit ℤ_p-module structure is asserted.

Let ε_n be the existing seriesEvaluation. On polynomial inputs,
ε_(n+1)(φF)=ι(ε_n(F)) follows from the root compatibility. Continuity and
native truncation convergence extend this to every integral series. Frobenius
continuity is supplied through the existing coordinate assembly on the zeroth
single-coordinate family. Applying this equality to the formal expansion
Σ_i φ(c_i)(1+T)^i identifies its evaluated coefficients with the existing
relative power-basis coordinates. Applying it to F(1+T)^j identifies the
multiplication matrices. Commutation of native determinants with ring maps
proves integralNorm_n(ε_(n+1)(F))=ε_n(colemanNorm(F)), for all F including
nonunits and zero. Units extensionality gives the unit-group square.

The native constant-plus-shift decomposition proves that reduction of ε_n(F)
is reduction of its constant coefficient. An arbitrary upper unit has an
existing unit polynomial-series lift. The norm square and the established
Coleman congruence modulo p therefore prove that its norm has the same residue
in ZMod p. Residue-one units are preserved. Norm-fixed unit series have the
required adjacent arithmetic compatibility, without yet asserting the actual
inverse-limit carrier or interpolation bijection.

Nine new typed examples include scalar p↦p^p, the signed dyadic uniformizer,
the root norm, the unit−1, constants, zero and preservation of residue1.
At p=2,n=0 the norm of ζ_1−1 is+2, while ζ_0−1=−2. The root norm also has
its negative sign. No unqualified dyadic root norm-compatibility is inferred.

## Reading and ownership

The complete published RJW printed 161–164 and 166–170 were freshly read,
including equation (10-1), the whole Lemma 10.9 proof, Proposition 10.10 and
all of the congruence and interpolation arguments in 10.11–10.13.
Publication SHA256:
78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6.
The source assumes p odd. The determinant-based actual-carrier decomposition
and dyadic extension are worker deductions. All thirteen inherited findings
and source-version records are preserved; no new finding or independent
review is claimed.

The current handoff, full reviewed AUDIT-24 L0/L1 rows and relevant existing
formal Frobenius and actual cyclotomic basis/evaluation declarations were
reread. The four predecessor outputs exactly match merged PR #3291.
Accepted RS-16, remaining audit rows, atlas/links, owner interfaces and the
LocalFieldsRamification and Multiquadratic model documents retain their
continuous-reading provenance. Named local-field structures, normalized
valuations and ramification invariants remain with their existing owner.

Five new baseline records follow full native statements and ambient hypotheses:
finite-dimensional linear continuity, preservation of integrality by a field
norm, continuity of native unit maps, the constant-plus-shift series identity,
and coefficient-topology convergence of polynomial truncations. The relative
norm's finite determinant and scalar norm formulas, multiplication-matrix
entries, determinant map law and native integral-norm API were also read.
The index was only a locator. Pinned-source searches found no existing
cyclotomic norm/evaluation adapter; this is not an exhaustive upstream absence
claim, and prior bounded upstream-search provenance is retained.

The actual PMIA supplier has 320 nodes. Its sixteen additions in our merged
PR #3293 were authored and fully read in this continuous session. Its suggested
source SHA256 is
d9a5079316a70e82bbe867853129fdda1a3059b11e781e270595de373778dda8.
The Dirichlet 247→254 delta consists of seven tame-character nodes already
read fully in that preceding PMIA job, preserving all older nodes. Neither
change adds a reverse dependency. The source ledger remains at 7616 entries
with its preceding owner/file/id preservation and full-reading provenance.

## Validation

The complete suggested file compiles at the pinned baseline with zero errors
and 436 warnings, all and only expected placeholders. The actual current
PMIA320 supplier was freshly compiled first: zero errors and 684 placeholder
warnings. Its source and generated artifact hashes are recorded. The source
audit covers 2846 byte-verified Mathlib modules, three previously built pinned
TauCeti modules and that actual supplier. No native library or Lake project
was built. The 29 new mathematical bodies are placeholders, not proofs.

Suggested SHA256:
a941c2713309bb1a0d35f892bd005fd98e882d91c4c502ca787d10e235702b4d.
Source-audit SHA256:
5e8423bfce0b03c8061d46d7f0e07f91f3f3112b04962bf7745765639f341c63.
The own compiler has ended; no own language server or watcher remains.

Exact arithmetic at p=2,3,5,7 checks 24 Frobenius coordinate identities,
24 coefficientwise Coleman congruences, 48 independent relative root-product
comparisons in actual cyclotomic polynomial quotients, and 48 residue
comparisons at two consecutive relative steps. Eighteen principal-unit cases,
four scalar norms, four root signs, four difference signs and four zero cases
pass. These finite calculations check conventions and specialization formulas;
they do not prove continuity, infinite series convergence or inverse limits.

The indexed checker, four-file intake, filename-correct errata wrapper and
whitespace checks pass. Preservation and new reader/declaration/API/test parity
pass. The reachable graph has 279 nodes, 1193 acyclic edges, 325 native leaves
and no unresolved stage leaves. This does not close the recorded gaps.

At publication main 6e864402d0548adc7a47e21755ecb1c08277efdb, all 53 guarded
input blobs and all four predecessor output blobs are unchanged from starting
main 2566939af56e4177dfd642feeb41fa7f4785e279. The issue body is unchanged.
Only the four authorized deliverables are submitted from the own job branch.

Retained scratch: inputs.json, input-delta.json, WORKLIST.md, issue-before.json,
issue-claimed.json, issue-publication.json, claim.json, claim-bot.json,
comments-after.json, four predecessor files, baseline-read.json, new-nodes.json,
append.lean, extend.py, write-reader.py, compile.py, verify.py, guard.py,
lean-source-audit.json, suggested-compile.log, supplier-compile.json,
PadicMeasuresIwasawaAlgebras-compile.log, arithmetic.py, arithmetic-results.json,
verification.json, checks.json, publication-guard.json, submission.json,
intake-pr.json and four final files in handoff-evidence. The source PDF retains
its preceding provenance. One persistent clone and one own Lean process at a
time were used. The temporary proposed-supplier build is removed after submission.

## Resume

Build the full and principal unit inverse limits using these actual continuous
norm transitions. Prove closedness and compactness of the compatible loci,
the G-action, Tate-module inclusion with the correct dyadic convention, and
norm-compatible Teichmüller splitting. Verify principal-unit pro-p hypotheses
before importing the ℤ_p-module structure; full units are not ℤ_p-modules.

Use the arithmetic evaluation square and existing unit polynomial lifts to
construct the actual interpolation map. Prove finite-zero/interpolation
uniqueness from the specified Weierstrass input, then perform compact successive
approximation for surjectivity and recover Theorems 10.2 and 10.13. The adjacent
compatibility node supplies neither that inverse limit nor the bijection.

Keep the named local-field/normalized-valuation comparison with its owner,
and continue the exact L2–L4 gaps: the actual Coleman composite, kernel,
cokernel and cyclotomic-unit quotient. General unramified or semilocal
coefficients need explicit Frobenius and norm data. All twelve outgoing
requests remain unchanged; no stage is closed.
