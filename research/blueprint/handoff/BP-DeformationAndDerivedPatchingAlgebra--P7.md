# Degree-wise actual initial relations — #551 checkpoint

Codex — codex-a71f92, 2026-10-03. Claim 5964959432 was confirmed explicitly
by bot 5964960489 after the whole issue was reread.
Mathematical base: `7a0839ba10a362fba9724a9704e986412ea03aa8`.
Publication base: `9c8a340faae54f977214d1a159764c3ca25a1e0e`.
Only the four issue-authorized deliverables change. The shared checkout
was read-only; no repository snapshot, library build, new Lake project,
cache fetch, language server, manual merge/label change or worker delegation
was used.

## Result and remaining boundary

Ten new declaration nodes (one actual coefficient-linear projection and nine
lemmas), five API items and six typed tests provide the two directions of
the principal-equation degree relation and actual projection kernel.
For finite σ, R=k[[X_i]], v=span(X_i) and g∈v^n, HC_n(g)=0 iff
g∈v^(n+1). With no-zero-divisors k, exact order(f)=d≤n, actual
denominator membership is equivalent to HC_n(g)=HC_d(f)·w for a
homogeneous degree-(n−d) series w. The strict-below-order and zero-equation
branches require no domain. The projection definition and its quotient
representative API need no finiteness of σ.

The codex-a71f92 continuation proves the actual degree-wise series/ideal kernel adapters and coefficient-linear equation-jet projection, including both principal relation directions, small-index, zero/unit and characteristic-two nonreduced tests. It preserves the complete incoming proof prefix. Still construct the polynomial-valued homogeneous comparison, identify the map's image with the existing q^n/q^(n+1) carrier, and assemble the multiplicatively compatible full tangent-cone graded isomorphism. Curve/support dimension, comparison with the general Hilbert–Samuel constructor, intrinsic/ambient multiplicities, general Hilbert–Serre, Artin–Rees, completion, localization, associativity, all eight stage targets and every routed source obligation remain required; canonical bodies remain admitted and every node remains unchecked and every stage retains its incoming partial or not_read status.

All 147 incoming node objects and the reserved general multiplicity node
are unchanged. No existing gap, request, source issue, route, supplier,
boundary field or source receipt is deleted or reattributed. Preserve all
eight stage statuses exactly: P7/R03.3/R03.4 partial; the other five not_read.
Every mathematical implementation status remains unchecked, and the whole
packet remains partial. The reader append supplies individual statements,
proof steps, inputs, API and discriminating tests; the suggested append
has matching native mathematical headers and six typed examples.

## Reading and source discipline

The current WORKERS and governing protocols were hash-confirmed at the
immutable base. The accepted scoped AUDIT-17 rows and complete accepted
review were read before math planning, as were applicable accepted RS-08
ownership and narrowing records, its architecture/conservation text and
whole campaign document. The two whole upstream style examples read in
this continuous session are JacobianChallenge and StableReduction;
their blobs at this base match the previously read exact blobs.

Credited DDPA-JET-HANDOFF §§3–5 were personally read with the actual
equation (9), both kernel directions and the remaining full graded map.
The generalized series/ideal adapters are authored deductions from that
proof and the already proved native finite-variable order equivalence;
they are not claimed as a newly printed theorem. Selected pinned native
homogeneous-component, order, ideal-sum and quotient/linear-map statements
were read with their hypotheses. Complete Stacks 00K4 mathematical content
was read for its conventions. Bounded pinned concept, open Mathlib issue/PR
and Zulip screens supply no additional implementation assumption. Source
hashes and exact reading extent are in HS-INITIAL-RELATION-PIN-a71f92;
all whole-paper/routed-source backlog stays attributed and open.

## Checks and resources

Native proof SHA-256:
`695a088a82bfd4d432a4af5bf41d4f1b99d33138db2bcf86f3d9c08c9973a3a5`.
Canonical suggested SHA-256:
`d4436ea6117da50ee365d6886425697862cfebae297be2f735cfdca3a279bc6e`.
Incoming native prefix SHA-256:
`5a8f33443d5002d6d11eb5a4b513cfdafc36fa8fd4cf0a2874ea4b2b504a0389`.

The complete 2251-line native proof passes with 129 distinct axiom audits,
only propext/Classical.choice/Quot.sound, no admissions and no warnings/errors.
Its complete 2018-line incoming prefix is byte-preserved. Six new named tests
cover zero input, units, zero equation survival, characteristic-two degree-one
survival and degree-two equation annihilation, and the exact n=d boundary.
The complete 3134-line canonical file passes with 411 placeholder warnings
only and 207 examples. The native file contains 64 anonymous inherited
examples in addition to its inherited/new named tests.

Both compiles used the already existing Lean 4.34.0-rc2 / Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 build. Tau Ceti source pin
f790474821cf4256814db967cb154e7af3d0c369 was checked; no Tau Ceti import is
required by this suggested file. Available memory was 38–39 GiB before
each compile. One Lean process ran at a time under a 1200-second limit.
Final native time was 10.70 seconds, peak RSS 3567696 KiB. No process is
left running. Source/log scratch remained under 2 MiB before replay and
is removed recoverably after the PR opens.

Actual indexed scripts/check_blueprint.py logic returns no errors/warnings:
157 nodes, 139 API items, 129 required definition/construction tests,
13 planets, 292 baseline declarations, 15 gaps and 2 requests.
(The all-node test count, including lemma fixtures, is printed by the
supplementary validator.) Actual intake file rules pass. The actual
immutable build.assemble output retains R03.6 and 210 whole-roadmap
declarations. Own and scoped combined DAGs are acyclic, with no unresolved
references; all incoming stage edges and other roadmap skipped/pending
records are unchanged. All 65 accepted restructure pairs are reachable.
Of 13 required supplier pairs, 12 are reachable. The one missing
LocalFieldsRamification layer 0 → R03.4 pair is inherited and control-equal;
it is a separate ownership/integration boundary, not repaired here.

## Durable public replay

[Public proof/check archive 1ee3d626cd226cffc0ee869aff618df03e133c65](https://github.com/CBirkbeck/tauceti-explorer/commit/1ee3d626cd226cffc0ee869aff618df03e133c65)
is the final head's second parent and changes only the same four authorized
paths. Its suggested-file comment contains the exact full native proof
between BEGIN/END ARCHIVED CHECKED INITIAL RELATIONS codex-a71f92 markers.
Its handoff contains full path-normalized native/canonical logs, the actual
validation receipt, and complete immutable_view.py / validate.py scripts.
No private scratch directory is needed to resume.

The recovery program below extracts only the issue's four files and exact
proof/check evidence, using apply_patch for writes. Supply REPO as the
existing clone, REPLAY_SCRATCH as a new empty disk scratch directory, ARCHIVE
as 1ee3d626cd226cffc0ee869aff618df03e133c65, and CANDIDATE as the immutable PR head. Read-only git fetch
of those exact commits is permitted; never clone/copy the repository.

```python
"""Recover only the four issue deliverables and their exact native replay evidence."""
import hashlib,sys,subprocess
from pathlib import Path
repo=Path(sys.argv[1]).resolve();dst=Path(sys.argv[2]).resolve()
archive=sys.argv[3];candidate=sys.argv[4]
stem="DeformationAndDerivedPatchingAlgebra--P7"
paths={
"research/blueprint/packets/"+stem+".json":"packet.json",
"research/blueprint/readmes/"+stem+".md":"reader.md",
"research/blueprint/suggested/"+stem+".lean":"Canonical.lean",
"research/blueprint/handoff/BP-"+stem+".md":"handoff.md"}
def blob(commit,path):
 return subprocess.check_output(["git","show",commit+":"+path],cwd=repo).decode()
archlean=blob(archive,"research/blueprint/suggested/"+stem+".lean")
marker="\n/- BEGIN ARCHIVED CHECKED INITIAL RELATIONS codex-a71f92\n"
end="END ARCHIVED CHECKED INITIAL RELATIONS codex-a71f92 -/\n"
assert archlean.count(marker)==1
canonical,native=archlean.split(marker);native=native.rsplit(end,1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="695a088a82bfd4d432a4af5bf41d4f1b99d33138db2bcf86f3d9c08c9973a3a5"
assert hashlib.sha256(canonical.encode()).hexdigest()=="d4436ea6117da50ee365d6886425697862cfebae297be2f735cfdca3a279bc6e"
hand=blob(archive,"research/blueprint/handoff/BP-"+stem+".md")
def section(heading,language):
 tail=hand.split("\n## "+heading+"\n",1)[1]
 data=tail.split("\n```"+language+"\n",1)[1].split("\n```\n",1)[0]
 return data if data.endswith("\n") else data+"\n"
files={name:blob(candidate,path)for path,name in paths.items()}
assert files["Canonical.lean"]==canonical
files.update({"Native.lean":native,
"Native.log":section("Native log (machine paths normalized)","text"),
"Canonical.log":section("Canonical log (machine paths normalized)","text"),
"validation.log":section("Actual immutable validation log (path normalized)","text"),
"immutable_view.py":section("Exact immutable view","python"),
"validate.py":section("Exact validator","python")})
assert dst.is_dir() and not any((dst/name).exists()for name in files)
patch="*** Begin Patch\n"
for name,data in files.items():
 assert data.endswith("\n"),name
 patch+="*** Add File: "+str(dst/name)+"\n"+"\n".join("+"+line for line in data[:-1].split("\n"))+"\n"
patch+="*** End Patch\n"
subprocess.run(["apply_patch"],input=patch,text=True,check=True,stdout=subprocess.DEVNULL)
print("Recovered exact issue files, native proof, normalized logs and actual validator; no repository snapshot.")

```

Run recovery and the actual validator against the stated immutable
publication base. The recovered compile logs document the exact checked
bytes; to rerun Lean, first verify the existing build pins and free -g,
then run Native.lean and Canonical.lean sequentially, each with timeout 1200.
Do not compile below 20 GiB available, set up a project, build libraries,
or start a language server.

```bash
python3 recover.py "$REPO" "$REPLAY_SCRATCH" "$ARCHIVE" "$CANDIDATE"
TAUCETI_REPO="$REPO" N11_VALIDATE_BASE=9c8a340faae54f977214d1a159764c3ca25a1e0e TAUCETI_BASELINE="$PINNED_BASELINE" python3 "$REPLAY_SCRATCH/validate.py"
```

The publication replay is exercised byte-for-byte before opening the PR;
the validator is rerun on the recovered files without repeating the
unchanged compiler run. Submission uses Refs #551, not a closing keyword.
The bot performs intake; no manual merge or labels.

## Where to resume

First compare native homogeneous series with homogeneous polynomials,
then identify the actual projection image with the existing q^n/q^(n+1)
carrier and assemble the full graded algebra map/isomorphism with generator,
component and multiplication specifications. Only after native curve/support
dimension is proved, compare the actual unique eventual polynomial with
the existing general constructor and extract intrinsic/ambient multiplicity.
Do not change the general reserved key into this special case. General
Hilbert–Serre, support/degree, Artin–Rees, completion, localization, associativity,
all stage targets and every routed-paper/source correction remain required.

---

The complete incoming handoff follows as credited historical evidence;
its earlier reading and check receipts belong to their respective authors.

# Actual plane quotient lengths determine unique rational polynomials — #551 checkpoint

Codex — codex-5ebb6f, 2026-10-03. Winning [claim 5964618237](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5964618237), confirmed by [bot 5964619220](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5964619220).
Mathematical base `1cb7fbca1727576cfc5c3fa0de58b9f1092552ea`; publication base `0f8afef629b4d0be5a436d2d5da7112ee34a9999`.
This is a partial planning checkpoint, with all eight stages partial and every implementation status unchecked.

For every field k and actual A=k[[x,y]]/(f), q=image(x,y), native finite
order(f)=d gives the explicit rational polynomial P_d=d(T+1)−d(d−1)/2.
The native proof independently establishes that this is the unique polynomial
agreeing eventually with actual cumulative quotient lengths. It supplies the
sharp witness max(0,d−2), accepts a competing polynomial with any tail witness,
and uses pinned Mathlib infinite-evaluation uniqueness on the infinite rational
image of a natural tail. It needs no general Hilbert–Serre premise, Noetherian
or local instance on A, reducedness, irreducibility, algebraic closure,
perfectness or coefficient-characteristic restriction. Finiteness precedes the
natural-value conversion, inherited from the checked actual finite-jet proof.

Polynomial degree is one at d>0, its leading coefficient is d, and
natDegree! times leadingCoeff equals d for all d. At d=0, P₀=0, with
ordinary polynomial degree −∞ and native natural degree zero. This does not
assign dimension zero to a zero module. For f=0 the separate actual quotient
has unique polynomial Q=(T+1)(T+2)/2, degree two and leading coefficient 1/2;
its factorial coefficient is one. The zero series has infinite order, while a
unit equation has order zero and gives the zero quotient. The actual scalar
field may be F₂, but the lengths and polynomials here are recorded in ℕ and ℚ.
No rational denominator is used inside that coefficient field.

Seventeen new nodes are two constructions and fifteen lemmas, all in R03.3.
Nine usable API items and eleven named tests accompany them. The existing
plane-curve-polynomial node gains only one prerequisite and one appended proof
step: use this independently verified special-case existence before comparing
with the general constructor’s eventual-value specification. Equality with
that unfinished general constructor is not certified by this prototype.
The reserved general multiplicity node is unchanged; extracting a coefficient
from an explicit polynomial is not a second definition of multiplicity.

All 130 incoming contracts are preserved; 129 complete node objects are
unchanged. Inventory is 147 nodes (8 definitions, 24 constructions, 99 lemmas,
16 theorems), 134 API items, 177 tests including 123 definition/construction
tests, 281 indexed baseline declarations, 13 planets, 15 gaps and two supplier
requests. Every source object and route, earlier continuation receipt, request,
gap, source finding, old remaining list and planet is retained. One precise
remaining entry is appended to R03.3. Reader and canonical source preserve their
complete incoming text, with only three imports added before the canonical
prefix. The scope and general key contract are unchanged.

## Reading, credit and ownership

The whole current issue was read before claiming and reread after the bot
confirmed this session’s claim. WORKERS was reread on this branch; the binding
blueprint, expansion and upstream instructions were read in this continuous
session, with the blueprint closure/API and §§12–15 reread for this checkpoint.
At least two upstream documents had been read in this continuous session;
no new whole-upstream-document reading is asserted here. The actual campaign
scope, all eight applicable complete reviewed AUDIT-17 rows, the accepted RS-08
review and applicable narrowing/owner records, the exact reserved key node,
maintained key survey and owner, and the complete scoped ModularCurves overlap
entry were read. Generic rational polynomial operations are imported from
Mathlib; R03.3 owns these local-algebra adapters. Other stage owners are retained.

Fresh mathematics reading covers the complete credited authored
[DDPA-CURVE-POSTULATION §§1–3](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md), including each finite-jet and sharp-cutoff proof in those sections;
[Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4) opening graded/cumulative
conventions and Proposition 10.59.5 with its complete proof; and selected exact
native statements and proofs at the Mathlib pin. These include Roots uniqueness,
linear/quadratic degree and leading coefficient, infinite natural intervals,
the infinite-image equivalence with its Infinite.image alias, rational cast
injectivity, and the complete HilbertPoly uniqueness proof whose infinite-image
argument is adapted. HilbertPoly’s rational-generating-function constructor is
already built and is not the missing general module Hilbert–Samuel theorem.
The new special-case existence and coefficient deductions are authored adapters,
not an allegation that Stacks prints this special computation.

The new exact-pin records include source files, lines and hashes for seven
additional indexed declarations. The existing broader Roots uniqueness record
is reused. Bounded RingTheory/MvPowerSeries and Polynomial name screens found no
existing actual plane quotient-length/postulation adapters in those searched
areas; this is not an exhaustive absence survey. Mathlib [PR #9819](https://github.com/leanprover-community/mathlib4/pull/9819) remains OPEN at
`413e5b872a7c758e0eb91f99cb96d6a61c81f0a2`; no unmerged result is imported.
Bounded public Zulip searches produced no additional applicable API decision.
No fresh complete routed-paper collation or whole-packet node-by-node audit is
claimed. No new source mistake is alleged. All inherited findings remain.

The complete 1732-line predecessor is recovered, hash-verified, preserved
verbatim after the three imports, and rerun within the 2018-line combined proof.
Selected relevant proof bodies were read; the whole predecessor was not freshly
read line by line. Its SHA-256 is
`e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1`.
Credit remains with all predecessor authors: codex-J6LwjP, codex-a71f92,
codex-5ebb6f, codex-rtOQ9t, codex-7e92bd, ChatGPT — gpt6astra-20261002-7d2f90,
and ChatGPT Pro — cp-20261002-sr-c72e81. Generic proof adaptation credits the
Mathlib authors, including Fangming Li and Jujian Zhang’s HilbertPoly proof.
Earlier computational receipts beyond the recovered source remain historical.

## Complete-file validation

Both complete files elaborate in the existing Lean 4.34.0-rc2 build against
exact Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; neither imports a
Tau Ceti module. The independent source baseline is exact Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, not an assertion that a Tau Ceti
build is certified. A single compiler ran at a time with timeout 1200 and
43 GiB available before each final check. No project setup, library build,
cache retrieval, language server or background compiler was started or left.

The native file has 64 retained examples and eleven new named test proofs,
113 distinct transitive axiom audits, and no errors, warnings or admissions.
Only propext, Classical.choice and Quot.sound occur in the axiom lists.
The canonical suggested file has 201 examples and exactly 396 admitted-proof
warnings, no other warnings or errors. Its 18 mathematical headers and all
11 new example types match the native statements after whitespace normalization.
The small private linear-normal-form proof is only a native proof step, not an
additional canonical mathematical contract.

The fixtures check quartic polynomial 4T−2; smooth T+1; unit zero with degree
−∞; actual characteristic-two arbitrary-tail uniqueness; sharp agreement
starting at two and failing at one; cumulative polynomial distinct from the
constant graded value; the F₂ expression 4T−2 vanishing while actual H(0)=1;
Q’s quadratic shape and all-index actual lengths; distinct actual zero/unit
quotients; and uniqueness for the zero equation. They use actual quotients,
not carriers defined by their expected dimension or length.

```json
{
  "Native": {
    "sourceSha256": "5a8f33443d5002d6d11eb5a4b513cfdafc36fa8fd4cf0a2874ea4b2b504a0389",
    "diagnosticSha256": "110907d3bb3f65b2283c46b20d290c23ac43fca586952f6985bd7329ef70eb17",
    "lines": 2018,
    "bytes": 99933,
    "examples": 64,
    "newNamedTests": 11,
    "errors": 0,
    "warnings": 0,
    "admissionWarnings": 0,
    "axiomAudits": 113,
    "sorryAxInAudits": 0,
    "availableGiBBeforeCompile": 43,
    "elapsed": "0:09.34",
    "maxRSSKiB": 3562840,
    "exitStatus": 0
  },
  "Canonical": {
    "sourceSha256": "d79478f1e937c1b3047a92677e71b7ee3bec1eb95c99030f3a99188301414a9e",
    "diagnosticSha256": "314462559f7a6fc1660365ebff1eeaff75c6d070b4f727b74ecdf4d57d93783a",
    "lines": 3034,
    "bytes": 149522,
    "examples": 201,
    "newNamedTests": 11,
    "errors": 0,
    "warnings": 396,
    "admissionWarnings": 396,
    "axiomAudits": 0,
    "sorryAxInAudits": 0,
    "availableGiBBeforeCompile": 43,
    "elapsed": "0:25.61",
    "maxRSSKiB": 3574948,
    "exitStatus": 0
  }
}
```

Indexed packet and actual intake validation report no errors, warnings or
file refusals. The actual assembler retains the other R03.6 part, all stage
edges, other-roadmap skipped/pending links and empty own skipped/pending lists.
All 65 accepted restructure links touching this roadmap are reachable.
Twelve of thirteen inherited supplier pairs are reachable; the same inherited
LocalFieldsRamification layer-0 → R03.4 owner-reconciliation boundary remains.
It is checked against the incoming control rather than silently repaired here.
Stage, own declaration and scoped combined graphs are acyclic, with no
unresolved declaration references. Eighteen governing/source/ownership/scoped
catalogue/checker inputs were byte-identical between the mathematical and
publication bases; unrelated merged roadmaps are retained in the branch.

```json
{
  "publicationBase": "0f8afef629b4d0be5a436d2d5da7112ee34a9999",
  "mathematicalBase": "1cb7fbca1727576cfc5c3fa0de58b9f1092552ea",
  "checker": {
    "roadmap": "DeformationAndDerivedPatchingAlgebra",
    "status": "partial",
    "nodes": 147,
    "kinds": {
      "lemma": 99,
      "theorem": 16,
      "definition": 8,
      "construction": 24
    },
    "apiItems": 134,
    "unitTests": 123,
    "planets": 13,
    "baselineDeclarations": 281,
    "prerequisites": {
      "baseline": 366,
      "node (this packet)": 221,
      "node (integrated)": 1
    },
    "gaps": 15,
    "requests": 2,
    "stagesInScope": 8,
    "stagesClosed": 0
  },
  "errors": [],
  "warnings": [],
  "intake": "pass",
  "preservedContracts": 130,
  "preservedWholeNodes": 129,
  "newNodes": 17,
  "mathHeadersMatched": 18,
  "newTestTypesMatched": 11,
  "allAPIItems": 134,
  "allTests": 177,
  "nativeAxiomAudits": 113,
  "canonicalAdmissionWarnings": 396,
  "nativeSha256": "5a8f33443d5002d6d11eb5a4b513cfdafc36fa8fd4cf0a2874ea4b2b504a0389",
  "canonicalSha256": "d79478f1e937c1b3047a92677e71b7ee3bec1eb95c99030f3a99188301414a9e",
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDAG": {
    "vertices": 147,
    "edges": 221,
    "acyclic": true
  },
  "scopedCombinedDAG": {
    "vertices": 3138,
    "edges": 8992,
    "acyclic": true
  },
  "reachableDeclarations": 148,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "baselineLeaves": 250,
  "unresolvedReferences": 0,
  "otherPartsRetained": [
    "DeformationAndDerivedPatchingAlgebra--R03.6"
  ],
  "roadmapDeclarations": 200,
  "supplierStagePairs": 13,
  "supplierStagePairsReachable": 12,
  "inheritedMissingPairs": [
    [
      "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
      "DeformationAndDerivedPatchingAlgebra:R03.4"
    ]
  ],
  "acceptedRestructurePairs": 65,
  "acceptedRestructurePairsAllReachable": true,
  "stageEdgesUnchanged": true,
  "otherSkippedPendingUnchanged": true,
  "ownSkippedPendingEmpty": true,
  "changedPaths": [
    "research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md",
    "research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json",
    "research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md",
    "research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
  ]
}
```

## Public recovery and reproduction

The checked source is publicly archived in immutable ancestor
[17609bb00b2bdb9f50bb72f35150dd692670fb44](https://github.com/CBirkbeck/tauceti-explorer/blob/17609bb00b2bdb9f50bb72f35150dd692670fb44/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean)
between ACTUAL CURVE POLYNOMIALS markers. Its prefix is the exact canonical
source. The inert archive comment is absent from the final signature plan.
All public evidence stays within the four allowed deliverables.

Save this first complete Python fence as recover.py in small disk scratch.
Its SHA-256 is `2fc0839354a4d577106a8b9c21e6f1917bfd078cc149ada1334ed5eb06d775fa`.
It fetches immutable public sources and byte-verifies fifteen proof, control
and script files; mathematical and publication bases are separate controls.
Pass this submitted handoff’s filename as the second argument, so its second
Python fence supplies the exact complete validator below. Use the existing
clone, existing exact-pin build and exact pinned declaration-index file.
No second clone or Lake project is required.

```python
from pathlib import Path
import urllib.request,hashlib,sys,re,json
S=Path(sys.argv[1]);S.mkdir(parents=True,exist_ok=True)
ROOT="https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/"
PATH="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
ARCHIVE='17609bb00b2bdb9f50bb72f35150dd692670fb44'
MATHBASE='1cb7fbca1727576cfc5c3fa0de58b9f1092552ea'
PUBLICATIONBASE='0f8afef629b4d0be5a436d2d5da7112ee34a9999'
EXPECTED={
  "Native.lean": "5a8f33443d5002d6d11eb5a4b513cfdafc36fa8fd4cf0a2874ea4b2b504a0389",
  "Canonical.lean": "d79478f1e937c1b3047a92677e71b7ee3bec1eb95c99030f3a99188301414a9e",
  "IncomingNative.lean": "e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1",
  "IncomingCanonical.lean": "8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c",
  "NewPolynomials.lean": "417bb9416a669deb4e17021f4294d376968cc67d0923067b0bd0708cde6707a3",
  "PolynomialTests.lean": "80dc6b7aea0138d15241b3fef0bb6a488c41d8268cedd320bf3d8390974e5a78",
  "NewImports.lean": "176a28725435fa3476d182aafc22cf7452c13325749df801dac22e01ffd7bc6a",
  "NewAudits.lean": "351d9b1bbc8fdc3636a82bdd4d48896968930c70d6d97171a167e8400e88d4df",
  "new-canonical.lean": "444364f7aaae21c29f0d4454309d6bb5597d9b868bacd7ba6f482c97c29461e3",
  "math-names.json": "79bb7ecfa3bf4036ee92f17466abd8a05e4807052d759baa979bb652a744dc95",
  "DeformationAndDerivedPatchingAlgebra--P7.json": "b5138a2a0825bd243d127a12a660e1be7401d30bf4d7084beb74d03295dac029",
  "DeformationAndDerivedPatchingAlgebra--P7.md": "cf7c4e45d2ee54f969cade07f87eb55290a0956c8f21d6f6f9bd393866afdd03",
  "DeformationAndDerivedPatchingAlgebra--P7.lean": "8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c",
  "BP-DeformationAndDerivedPatchingAlgebra--P7.md": "eaeda2630c43774f92f7d1cac584a45dde23a14853b72788089e6f1f5ddd3840",
  "validate.py": "e5256413c88f1265c89ad08465bcef609200d01cad63d35a2006cb4d9563b4f2"
}
def get(commit,path=PATH):return urllib.request.urlopen(ROOT+commit+"/"+path,timeout=90).read()
def put(name,data):
 assert hashlib.sha256(data).hexdigest()==EXPECTED[name],name
 (S/name).write_bytes(data)
b=get(ARCHIVE)
c,tail=b.split(b"\n/- BEGIN ARCHIVED CHECKED ACTUAL CURVE POLYNOMIALS\n",1)
n=tail.split(b"\nEND ARCHIVED CHECKED ACTUAL CURVE POLYNOMIALS -/\n",1)[0]
put("Canonical.lean",c);put("Native.lean",n)
p=get("277c8f6129fe7d98b31c9f204f34a5f0f8214e95")
incoming=p.split(b"\n/- BEGIN ARCHIVED CHECKED SHARP PLANE CURVE POSTULATION\n",1)[1].split(b"\nEND ARCHIVED CHECKED SHARP PLANE CURVE POSTULATION -/\n",1)[0]+b"\n"
put("IncomingNative.lean",incoming)
imports=b"import Mathlib.Algebra.Polynomial.Roots\nimport Mathlib.Algebra.Polynomial.Degree.SmallDegree\nimport Mathlib.Order.Interval.Set.Infinite\n"
put("NewImports.lean",imports)
assert n.startswith(imports+incoming)
new,rest=n[len(imports+incoming):].split(b"\nnamespace TauCeti.HilbertSamuel.CurvePolynomialTests",1)
test,au=(b"\nnamespace TauCeti.HilbertSamuel.CurvePolynomialTests"+rest).split(b"\n#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial\n",1)
put("NewPolynomials.lean",new)
put("PolynomialTests.lean",test)
put("NewAudits.lean",b"\n#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial\n"+au)
for directory,extension in [("packets","json"),("readmes","md"),("suggested","lean")]:
 name="DeformationAndDerivedPatchingAlgebra--P7."+extension
 put(name,get(MATHBASE,"research/blueprint/"+directory+"/"+name))
put("BP-DeformationAndDerivedPatchingAlgebra--P7.md",get(MATHBASE,"research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md"))
old=(S/"DeformationAndDerivedPatchingAlgebra--P7.lean").read_bytes()
put("IncomingCanonical.lean",old)
assert c.startswith(imports+old)
put("new-canonical.lean",c[len(imports+old):])
math_names=['planeCurvePolynomial', 'planeCurvePolynomial_eval', 'planeCurvePolynomial_zero', 'planeCurvePolynomial_natDegree', 'planeCurvePolynomial_leadingCoeff', 'planeCurvePolynomial_factorial_leadingCoeff', 'planeSurfacePolynomial', 'planeSurfacePolynomial_eval', 'planeSurfacePolynomial_natDegree', 'planeSurfacePolynomial_leadingCoeff', 'planeCurvePolynomial_eval_iff', 'planeCurvePolynomial_tail', 'planeCurvePolynomial_unique', 'planeCurve_existsUnique_polynomial', 'planeZeroEquation_polynomial_eval', 'planeZeroEquation_polynomial_unique', 'planeZeroEquation_existsUnique_polynomial', 'planeSurfacePolynomial_factorial_leadingCoeff']
put("math-names.json",(json.dumps(math_names,indent=2)+"\n").encode())
# Read the submitted handoff at the existing submitted clone; its second Python fence is this exact validator.
h=Path(sys.argv[2]).read_text()
fences=re.findall(r"```python\n(.*?)\n```",h,re.S)
assert len(fences)>=2
put("validate.py",(fences[1]+"\n").encode())
(S/"base.txt").write_text(MATHBASE+"\n")
(S/"publication-base.txt").write_text(PUBLICATIONBASE+"\n")
print("Recovered 15 byte-verified proof/control/script files plus mathematical and publication bases.")
```

Save this second complete Python fence as validate.py if reproducing it
separately. SHA-256 `e5256413c88f1265c89ad08465bcef609200d01cad63d35a2006cb4d9563b4f2`.
It uses the actual submitted packet checker, intake file rules and assembler,
reads mathematical controls from the immutable base, and checks changed paths
against the publication base. VALIDATE_BASE may override only the path-comparison
base when auditing a later merged checkout. It performs no repository or atlas
writes. The checker consumes fresh complete compile logs in the same scratch.

```python
from pathlib import Path
import sys,json,re,ast,hashlib,collections,copy,subprocess,os
R=Path(sys.argv[1]).resolve();S=Path(sys.argv[2]).resolve();INDEX=Path(sys.argv[3])
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';PREFIX='research/blueprint/'
FILES=[PREFIX+x+'/'+STEM+'.'+e for x,e in [('packets','json'),('readmes','md'),('suggested','lean')]]+[PREFIX+'handoff/BP-'+STEM+'.md']
MATHBASE=(S/'base.txt').read_text().strip();BASE=os.getenv('VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
def blob(path):return subprocess.check_output(['git','show',MATHBASE+':'+path],cwd=R)
def sha(data):return hashlib.sha256(data).hexdigest()
p0=json.loads(blob(FILES[0]));p=json.loads((R/FILES[0]).read_text())
old={n['id']:n for n in p0['nodes']};new={n['id']:n for n in p['nodes']};added={k:n for k,n in new.items()if k not in old}
assert len(old)==130 and len(new)==147 and len(added)==17
changed_node=RID+':R03.3/plane-curve-polynomial'
for nid,n0 in old.items():
 for key in n0:
  if nid==changed_node and key in {'prerequisites','proofSteps'}:assert new[nid][key][:-1]==n0[key],(nid,key)
  else:assert new[nid][key]==n0[key],(nid,key)
assert all(new[k]==v for k,v in old.items()if k!=changed_node)
for key in p0:
 if key not in {'summary','nodes','baseline','sources','coverage'}:assert p[key]==p0[key],key
assert set(p)-set(p0)=={'explicitPolynomialContinuation'}
for key in p0['baseline']:
 if key!='declarations':assert p['baseline'][key]==p0['baseline'][key],key
assert p['baseline']['declarations'][:274]==p0['baseline']['declarations'] and len(p['baseline']['declarations'])==281
assert p['sources'][:-1]==p0['sources']
for row,row0 in zip(p['coverage'],p0['coverage']):
 if row['stageId']!=RID+':R03.3':assert row==row0
 else:
  for key in row0:
   if key!='remaining':assert row[key]==row0[key],key
  assert row['remaining'][:-1]==row0['remaining']
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked'for n in new.values())
reader=(R/FILES[1]).read_text();lean=(R/FILES[2]).read_text();oldlean=blob(FILES[2]).decode()
assert reader.startswith(blob(FILES[1]).decode())
imports=(S/'NewImports.lean').read_text();extra=(S/'NewPolynomials.lean').read_text();tests=(S/'PolynomialTests.lean').read_text();cn=(S/'new-canonical.lean').read_text()
assert lean==imports+oldlean+cn and lean.encode()==(S/'Canonical.lean').read_bytes()
for n in added.values():
 assert n['statement'] in reader and n['declaration'] in reader,n['id']
 for t in n.get('tests',[]):assert t['name'] in lean and t['statement'] in reader,t
 for a in n.get('api',[]):assert a['name'].split('.')[-1] in cn and a['statement'] in reader,a
native=(S/'Native.lean').read_text()
assert native==imports+(S/'IncomingNative.lean').read_text()+extra+tests+(S/'NewAudits.lean').read_text()
assert sha((S/'IncomingNative.lean').read_bytes())=='e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1'
assert not re.search(r'\bsorry\b|\baxiom\b|\badmit\b',native)
log=(S/'native.log').read_text();clog=(S/'canonical.log').read_text()
assert not re.search(r'error:|warning:|sorryAx',log) and 'Exit status: 0' in log
au=re.findall(r"'([^']+)' depends on axioms:\s*\[([^\]]*)\]",log)
assert len(au)==113 and len({n for n,_ in au})==113
assert all(set(re.findall(r'[\w.]+',axes))<={'propext','Classical.choice','Quot.sound'}for _,axes in au)
assert 'error:' not in clog and clog.count('warning:')==clog.count('warning: declaration uses')==396 and 'Exit status: 0' in clog
assert len(re.findall(r'^example\b',native,re.M))==64 and len(re.findall(r'^example\b',lean,re.M))==201
def norm(s):return re.sub(r'\s+',' ',s).strip()
def header(s,start):
 tail=s[start:];end=re.search(r' :=(?= by\b|\n  C)',tail);assert end,tail[:120]
 return tail[:end.start()]
names=json.loads((S/'math-names.json').read_text());assert len(names)==18
for name in names:
 pat=r'^(?:def|lemma) '+re.escape(name)+r'\b';a=re.search(pat,extra,re.M);b=re.search(pat,cn,re.M);assert a and b,name
 assert norm(header(extra,a.start()))==norm(header(cn,b.start())),name
matches=list(re.finditer(r'^-- test: (\S+)\n',tests,re.M));assert len(matches)==11
for m in matches:
 b=re.search(r'^-- test: '+re.escape(m[1])+r'\n',cn,re.M);assert b,m[1]
 assert norm(re.sub(r'^lemma \S+','example',header(tests,m.end())))==norm(header(cn,b.end())),m[1]
# The proof diagnostics are read only; recompile with the documented pin before this checker.
tree=ast.parse((R/'research/blueprint/intake.py').read_text())
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name=='file_problems']
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
for dst in FILES:
 text=(R/dst).read_text();assert not env['file_problems'](dst,text),dst
 assert not re.search(r'[ \t]+$',text,re.M),dst
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',text),dst
changed=set(subprocess.check_output(['git','diff','--name-only',BASE],cwd=R,text=True).splitlines());assert changed<=set(FILES),changed
sys.path.insert(0,str(R/'scripts'));import check_blueprint,build,blueprints
errors,warnings,summary=check_blueprint.check(R/FILES[0],check_blueprint.load_index(INDEX),check_blueprint.world())
assert not errors and not warnings,(errors,warnings);summary.pop('packet',None)
packets,documents,definitions=blueprints.load_promoted(R)
otherparts=[(stem,q)for stem,q in packets if q.get('roadmapId')==RID and stem!=STEM];assert otherparts
keep=[x for x in packets if x[0]!=STEM];documents[STEM]=FILES[1]
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(p0);a0=json.loads((R/'data/atlas.json').read_text())
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for path in sorted((R/folder).glob('*.json')):
  q=json.loads(path.read_text())
  for n in q.get('nodes',[]):world.setdefault(n['id'],n)
world.update(new)
stages={x['id']:x for x in a['stages']};stageids=set(stages)|set(check_blueprint.world()[1]);scope=set(p['scope'])
stageedges={(e['source'],e['target'])for e in a['stageEdges']}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in out[s]:out[s].add(t);indeg[t]+=1
 stack=[v for v,c in indeg.items()if c==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,c in indeg.items()if c][:15]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
ownedges={(q,nid)for nid,n in new.items()for q in n.get('prerequisites',[])if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid);n=world[nid]
 if n.get('parentStageId'):dep.add((n['parentStageId'],nid))
 for q in n.get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:'))and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(r['supplier'],c)for r in p['requests']for c in r['neededBy']if c in new or c in stageids}
ar=next(r for r in a['roadmaps']if r['id']==RID)
assert ar['blueprint']['declarations']==len(new)+sum(len(q['nodes'])for _,q in otherparts)
assert not ar['blueprint']['skippedLinks'] and not ar.get('pendingLinks',[])
control={(e['source'],e['target'])for e in b['stageEdges']};assert stageedges==control
def skips(atlas):return {r['id']:(r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[]))for r in atlas['roadmaps']if r['id']!=RID}
assert skips(a)==skips(b)
def reachable(s,t,edges=stageedges):
 out=collections.defaultdict(set)
 for u,v in edges:out[u].add(v)
 stack=[s];visited=set()
 while stack:
  v=stack.pop()
  if v==t:return True
  if v in visited:continue
  visited.add(v);stack.extend(out[v]-visited)
 return False
def stage_of(v):
 visited=set()
 while v in world:
  assert v not in visited;visited.add(v);v=world[v].get('parentStageId')or(world[v].get('realises')or[None])[0]
 return v
pairs={(e['source'],e['target'])for e in a0['stageEdges']if e['target']in scope}
for n in new.values():
 for q in n.get('prerequisites',[]):
  if q not in new and not q.startswith(('mathlib:','tauceti:')):pairs.add((stage_of(q),stage_of(n['id'])))
for r in p['requests']:
 for c in r['neededBy']:pairs.add((stage_of(r['supplier']),stage_of(c)))
missing={(s,t)for s,t in pairs if not reachable(s,t)}
assert missing=={(s,t)for s,t in pairs if not reachable(s,t,control)}
expected={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert missing==expected,missing
acceptedpairs=set()
for path in (R/PREFIX/'restructure').glob('*.result.json'):
 q=json.loads(path.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 for row in q.get('links',[]):
  if any(row.get(k,'').startswith(RID+':')for k in ['source','target']):acceptedpairs.add((row['source'],row['target']))
assert all(reachable(s,t)for s,t in acceptedpairs)
report={'publicationBase':BASE,'mathematicalBase':MATHBASE,'checker':summary,'errors':errors,'warnings':warnings,'intake':'pass','preservedContracts':130,'preservedWholeNodes':129,'newNodes':17,'mathHeadersMatched':18,'newTestTypesMatched':11,'allAPIItems':sum(len(n.get('api',[]))for n in new.values()),'allTests':sum(len(n.get('tests',[]))for n in new.values()),'nativeAxiomAudits':113,'canonicalAdmissionWarnings':396,'nativeSha256':sha(native.encode()),'canonicalSha256':sha(lean.encode()),'stageDAG':dag(stages,stageedges),'ownDAG':dag(new,ownedges),'scopedCombinedDAG':dag(set(stages)|seen,stageedges|dep),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(new)),'baselineLeaves':len(baseref),'unresolvedReferences':0,'otherPartsRetained':[stem for stem,_ in otherparts],'roadmapDeclarations':ar['blueprint']['declarations'],'supplierStagePairs':len(pairs),'supplierStagePairsReachable':len(pairs)-len(missing),'inheritedMissingPairs':sorted(missing),'acceptedRestructurePairs':len(acceptedpairs),'acceptedRestructurePairsAllReachable':True,'stageEdgesUnchanged':True,'otherSkippedPendingUnchanged':True,'ownSkippedPendingEmpty':True,'changedPaths':sorted(changed)}
print(json.dumps(report,ensure_ascii=False,indent=2))
```

Set REPO, PROOF_SCRATCH, EXISTING_PINNED_BUILD and PINNED_INDEX to the existing
clone, small disk scratch, existing exact-pin build and exact index file.
Check free -g before each compile and skip that compile below 20 GiB available.
Run these sequentially, never starting two Lean processes at once:

```bash
python3 recover.py "$PROOF_SCRATCH" "$REPO/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md"
free -g
cd "$EXISTING_PINNED_BUILD"
timeout 1200 /usr/bin/time -v lake env lean "$PROOF_SCRATCH/Native.lean" > "$PROOF_SCRATCH/native.log" 2>&1
free -g
timeout 1200 /usr/bin/time -v lake env lean "$PROOF_SCRATCH/Canonical.lean" > "$PROOF_SCRATCH/canonical.log" 2>&1
python3 "$PROOF_SCRATCH/validate.py" "$REPO" "$PROOF_SCRATCH" "$PINNED_INDEX"
```

The publication recovery and complete validator were exercised as a byte-for-byte
round trip before submission. The already successful final compile logs were
used for that independent file reconstruction check; compilers were not rerun
without a change to their sources. Only the four permitted files differ from
the publication base.

## Where to resume

Prove the actual tangent-cone kernel and native curve-ring dimension, then
compare the unique actual polynomial with the existing general constructor
through its proved eventual-value specification. Use the checked coefficient
arithmetic for the intrinsic and ambient multiplicity comparisons only after
the relevant support and dimension hypotheses are established. General
Hilbert–Serre induction, support/degree, Artin–Rees, completion, localization
lengths, associativity, all eight stage targets and every routed-paper
obligation remain required. The native special-case existence proof does not
close the general multiplicity key. Continue from these actual carriers and
preserve all source, supplier and historical worklists below.

---

The complete incoming handoff follows as historical evidence. Its earlier
reading and check receipts describe their own checkpoints.

# Sharp plane-curve graded and cumulative thresholds — #551 checkpoint

Codex — codex-rtOQ9t, 2026-10-03. Winning claim 5964192823;
bot confirmation 5964193904. Mathematical base
`14122f5410315c7254b29874b6b80bf3f7bdd159`; publication base `84e885b95c0ad537079c0fe6fdbb122c8020ac33`.
This is a partial planning checkpoint; all implementation statuses remain unchecked.

For any field k, R=k[[x,y]], variable ideal v, A=R/(f), q=image(v), and
finite order(f)=d, the admission-free prototype now proves the actual
quotient-module graded function G(N)=min(N+1,d), and the rational cumulative
defect H(N).toNat−[d(N+1)−d(d−1)/2]=binom(d−N−1,2). The binomial arguments
use natural subtraction; the polynomial and defect use rational arithmetic.
Agreement with the cumulative polynomial holds exactly when d≤N+2;
agreement of G with d holds exactly when d≤N+1. For d≥3, at N=d−3 the
cumulative defect is exactly one. These are distinct sharp thresholds.

The native general quotient-transition length identity uses the actual
Submodule power-quotient inclusion, quotient transition, kernel, range and
surjectivity in the pinned library. It holds for every commutative ring,
module, ideal and natural index without a finite-length or local assumption.
Finite length is proved before conversion to natural numbers in the curve
arguments. A separate actual zero-equation proof gives G(N)=N+1; it does
not supply a finite order for zero. Units give d=0 and G=0, including the
zero quotient ring without an IsLocalRing assumption. Characteristic two
fixtures use real F₂[[x,y]] quotients, including quartic, smooth, unit and
zero equations; no carrier or length is prescribed by the expected formula.

Five added lemma nodes are plane-jet-binomial-defect, plane-jet-count-step,
plane-curve-graded-stable, plane-curve-postulation-predecessor and
plane-zero-equation-graded, all in R03.3. Four previously planned bodies are
now proved natively: quotient_length_succ, planeCurve_gradedFunction,
planeCurve_postulation_defect and planeCurve_postulation_iff. The nine
mathematical headers and all ten new named test types match the canonical
source after whitespace normalization. The tests distinguish the quartic
cumulative cutoff 2 from graded cutoff 3, check the negative rational
polynomial value at zero and its actual defect, the predecessor defect,
all-index quartic/zero/unit/smooth behavior, and exact finite count defects.

All 125 incoming contracts are preserved. 123 whole node objects are
unchanged; only the graded-function and postulation-defect nodes gain one
prerequisite and one appended proof step apiece. The reserved general
HilbertSamuelMultiplicity node is unchanged. Inventory: 130 nodes
(8 definitions, 22 constructions, 84 lemmas, 16 theorems), 125 API items,
166 total tests, 115 definition/construction tests, 13 planets, 274 indexed
baseline declarations, 15 gaps, two requests, eight stages and zero closed
stages. The 268 incoming baselines and all source routes, API contracts,
requests, gaps, remaining lists and source findings are retained. One precise
R03.3 remaining entry records the frontier. Reader and canonical incoming
text remain as complete prefixes apart from one added Mathlib import.

The 1430-line predecessor is preserved verbatim, SHA-256
`245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402`. Its 64 examples and 65 named axiom audits
are rerun as part of the full combined native check. Credit remains with
codex-J6LwjP, codex-a71f92, codex-5ebb6f, codex-rtOQ9t, codex-7e92bd,
ChatGPT — gpt6astra-20261002-7d2f90 and ChatGPT Pro — cp-20261002-sr-c72e81.
The complete incoming handoff follows this current receipt below. Earlier
computational regressions beyond that recovered source were not rerun.

## Reading and ownership boundary

The whole current issue was read before claiming and reread after the bot
confirmed this claim. The four binding instructions were read in this
continuous session; all twenty governing, ownership, audit, accepted RS-08,
checker and incoming deliverable inputs were unchanged when the branch was
updated from the mathematical base to the publication base. The reviewed
AUDIT-17 rows for all eight applicable scopes were read completely, along
with the exact reserved multiplicity key, survey and owner. The campaign
reader, applicable accepted RS-08 ownership and the complete actual scoped
ModularCurves overlap entry were read. This entry preserves ModularCurves'
existing upstream scope and the coefficient-category boundary at R03.1.

Fresh mathematical reading covers [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4)
for the graded/cumulative conventions and Proposition 10.59.5, and
[the credited authored postulation deduction, §§1–3](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).
The deduction is an authored blueprint calculation rather than an additional
published theorem. Selected indexed native statements were read at the
pin: PowTransition's actual maps and exactness, quotient map kernels,
module-length additivity, Pascal/monotonicity/vanishing and rational
choose-two, and ENat finite casts/addition. The six new baseline records
include exact source files, lines and hashes. The bounded RingTheory and
MvPowerSeries name search found no existing HilbertSamuel/postulation/
gradedFunction declarations in those directories; this is not an exhaustive
absence survey. The selected predecessor proof headers/bodies were read;
the entire predecessor was recovered, hashed and rerun, not claimed freshly
read line by line. No fresh complete routed-paper collation is claimed.
No source mistake is alleged. All inherited source findings and routes remain.

## Complete-file checks

Both files elaborate in the existing Lean 4.34.0-rc2 build using exact
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. They import no Tau Ceti
module. The independent source baseline is Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; this does not certify a Tau Ceti
build. Each check ran a single bounded compiler with timeout 1200 after
checking available memory. No project, library build, cache fetch or language
server was started, and no compiler remains running.

```json
{
  "Native": {
    "sourceSha256": "e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1",
    "lines": 1732,
    "examples": 64,
    "errors": 0,
    "warnings": 0,
    "admissionWarnings": 0,
    "axiomAudits": 84,
    "sorryAxInNativeAudits": 0,
    "availableGiBBeforeCompile": 39,
    "elapsed": "0:08.80",
    "maxRSSKiB": 3538664
  },
  "Canonical": {
    "sourceSha256": "8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c",
    "lines": 2881,
    "examples": 190,
    "errors": 0,
    "warnings": 367,
    "admissionWarnings": 367,
    "axiomAudits": 0,
    "sorryAxInNativeAudits": null,
    "availableGiBBeforeCompile": 37,
    "elapsed": "0:26.61",
    "maxRSSKiB": 3531252
  }
}
```

All 84 unique native axiom audits use only propext, Classical.choice and
Quot.sound. There are no native admissions or sorryAx dependencies.
The full submitted canonical file has 367 expected admission warnings and
no other warning or error; the 15 new admissions are five mathematical
signatures and ten example signatures. Historical canonical counts in the
incoming handoff are superseded by this current receipt.

The indexed checker and actual intake file checks pass with no errors or
warnings. Actual source-tree assembler comparison retains the accepted R03.6
part and overlays original and candidate in the same publication tree.
The stage graph and scoped combined graph include all actual stage edges,
reachable declaration dependencies, declaration parent-stage edges and
request edges. All endpoints resolve and all three graphs are acyclic.
There are no new missing supplier paths or changed stage edges. The existing
LocalFieldsRamification layer-0 → R03.4 gap is present in both control and
candidate and stays explicitly recorded. All 65 accepted restructuring
paths touching this roadmap are reachable. Other roadmaps' skipped/pending
links remain unchanged; this roadmap has none. These are scoped checks,
not a claim that every atlas declaration graph or paper is complete.

```json
{
  "publicationBase": "84e885b95c0ad537079c0fe6fdbb122c8020ac33",
  "checker": {
    "roadmap": "DeformationAndDerivedPatchingAlgebra",
    "status": "partial",
    "nodes": 130,
    "kinds": {
      "lemma": 84,
      "theorem": 16,
      "definition": 8,
      "construction": 22
    },
    "apiItems": 125,
    "unitTests": 115,
    "planets": 13,
    "baselineDeclarations": 274,
    "prerequisites": {
      "baseline": 352,
      "node (this packet)": 198,
      "node (integrated)": 1
    },
    "gaps": 15,
    "requests": 2,
    "stagesInScope": 8,
    "stagesClosed": 0
  },
  "errors": [],
  "warnings": [],
  "intake": "pass",
  "preservedContracts": 125,
  "preservedWholeNodes": 123,
  "newNodes": 5,
  "mathHeadersMatched": 9,
  "newTestTypesMatched": 10,
  "allAPIItems": 125,
  "allTests": 166,
  "nativeAxiomAudits": 84,
  "canonicalAdmissionWarnings": 367,
  "nativeSha256": "e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1",
  "canonicalSha256": "8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c",
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDAG": {
    "vertices": 130,
    "edges": 198,
    "acyclic": true
  },
  "scopedCombinedDAG": {
    "vertices": 3121,
    "edges": 8952,
    "acyclic": true
  },
  "reachableDeclarations": 131,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "baselineLeaves": 242,
  "unresolvedReferences": 0,
  "otherPartsRetained": [
    "DeformationAndDerivedPatchingAlgebra--R03.6"
  ],
  "roadmapDeclarations": 183,
  "supplierStagePairs": 13,
  "supplierStagePairsReachable": 12,
  "inheritedMissingPairs": [
    [
      "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
      "DeformationAndDerivedPatchingAlgebra:R03.4"
    ]
  ],
  "acceptedRestructurePairs": 65,
  "acceptedRestructurePairsAllReachable": true,
  "stageEdgesUnchanged": true,
  "otherSkippedPendingUnchanged": true,
  "ownSkippedPendingEmpty": true,
  "changedPaths": [
    "research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md",
    "research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json",
    "research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md",
    "research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
  ]
}
```

## Public reconstruction and verification

The checked native source is publicly archived inside an ancestor commit
of this job branch at
[277c8f6129fe7d98b31c9f204f34a5f0f8214e95](https://github.com/CBirkbeck/tauceti-explorer/blob/277c8f6129fe7d98b31c9f204f34a5f0f8214e95/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean)
between the SHARP PLANE CURVE POSTULATION markers. The prefix is exactly the
submitted canonical file. The archive comment is removed in the final
suggested file to keep it a signature plan. No additional tracked file is
introduced. Its predecessor archive is
[6292c37](https://github.com/CBirkbeck/tauceti-explorer/blob/6292c37bd3730574a75b771115a52ad684dcea31/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean).

Save the complete code below as reconstruct.py in your own disk scratch.
Use the submitted existing clone, an existing pinned build, and the exact
pinned declaration-index file; do not create a second clone or Lake project.
The reconstruction SHA-256 is `e1c5ec918c0f64310fdf0e4bd554218e41f5a02514789a902a3bc0f481c25772`.

```python
from pathlib import Path
import urllib.request,hashlib,sys
S=Path(sys.argv[1]);S.mkdir(parents=True,exist_ok=True)
ROOT="https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/"
PATH="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
def get(commit):return urllib.request.urlopen(ROOT+commit+"/"+PATH,timeout=90).read()
def put(name,data,expected):
 assert hashlib.sha256(data).hexdigest()==expected,name
 (S/name).write_bytes(data)
b=get("277c8f6129fe7d98b31c9f204f34a5f0f8214e95")
c,tail=b.split(b'\n/- BEGIN ARCHIVED CHECKED SHARP PLANE CURVE POSTULATION\n',1)
n=tail.split(b"\nEND ARCHIVED CHECKED SHARP PLANE CURVE POSTULATION -/\n",1)[0]+b"\n"
put("Canonical.lean",c,"8365614bae72634c89a572179f90864b4ad8468c32b57b2dfe1f9e501703f55c")
put("Native.lean",n,"e98df77f9ff9b57b919b0a829e5dd8eb23e52a8c5a6c603609350e727756a5a1")
p=get("6292c37bd3730574a75b771115a52ad684dcea31").split(b"\n/- BEGIN ARCHIVED CHECKED EQUATION JET LENGTHS\n",1)[1].split(b"\nEND ARCHIVED CHECKED EQUATION JET LENGTHS -/\n",1)[0]+b"\n"
put("Predecessor.lean",p,"245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402")
i=b'import Mathlib.RingTheory.Ideal.Quotient.PowTransition\nimport Mathlib.Data.Nat.Choose.Cast\n'
put("Imports.lean",i,"f974405cb539b8cdfb50802aed4f333d72a896066e49fcd1d5abc6ffa2914e45")
ci=b'import Mathlib.Data.Nat.Choose.Cast\n'
put("CanonicalImports.lean",ci,"134aabb7bff05ac10fcf5421d5302d7a6312aa2b0479ed648fa1461b5de2c769")
assert n.startswith(i+p)
new=n[len(i+p):len(i+p)+11280]
tests=n[len(i+p)+11280:]
put("New.lean",new,"9bb6b8853aa942a893d2da63e6c23483329221531a7f13c8cd9da3b8a794ff9c")
put("Tests.lean",tests,"07bd0ed4d4c03c15a9458af8acc93d77fdefb10da2baed5be1f2b52ce86d70db")
assert n==i+p+new+tests
(S/"publication-base.txt").write_text("84e885b95c0ad537079c0fe6fdbb122c8020ac33\n")
print("Recovered canonical file, complete credited predecessor, nine proof bodies and ten tests; all seven hashes match.")
```

Save this complete checker as validate.py in the same scratch. Its SHA-256 is
`5d0f57fa88f511d5c9a92b88addb55f2869682bd4ebd47fbf0040ceabab42a7d`. It reads the actual submitted checker/intake/
assembler and performs no atlas or repository writes. Runtime outputs go
only to the reviewer's own scratch.

```python
"""Read-only validation in the submitted existing clone; no atlas/repository writes.
Arguments: repository root, own proof scratch, exact pinned declaration-index file.
"""
from pathlib import Path
import sys,json,re,ast,hashlib,collections,copy,subprocess
R=Path(sys.argv[1]).resolve();S=Path(sys.argv[2]).resolve();INDEX=Path(sys.argv[3])
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';PREFIX='research/blueprint/'
FILES=[PREFIX+x+'/'+STEM+'.'+e for x,e in [('packets','json'),('readmes','md'),('suggested','lean')]]+[PREFIX+'handoff/BP-'+STEM+'.md']
BASE=(S/'publication-base.txt').read_text().strip()
def blob(path):return subprocess.check_output(['git','show',BASE+':'+path],cwd=R)
def sha(data):return hashlib.sha256(data).hexdigest()
p=json.loads((R/FILES[0]).read_text());p0=json.loads(blob(FILES[0]))
old={n['id']:n for n in p0['nodes']};new={n['id']:n for n in p['nodes']};added={k:n for k,n in new.items()if k not in old}
assert len(old)==125 and len(new)==130 and len(added)==5
changes={RID+':R03.3/'+x for x in ['plane-curve-graded-function','plane-curve-postulation-defect']}
for nid,n0 in old.items():
 for key in n0:
  if nid in changes and key in {'prerequisites','proofSteps'}:assert new[nid][key][:-1]==n0[key],(nid,key)
  else:assert new[nid][key]==n0[key],(nid,key)
assert all(new[k]==v for k,v in old.items()if k not in changes)
for key in p0:
 if key not in {'summary','nodes','baseline','sources','coverage'}:assert p[key]==p0[key],key
for key in p0['baseline']:
 if key!='declarations':assert p['baseline'][key]==p0['baseline'][key],key
assert p['baseline']['declarations'][:268]==p0['baseline']['declarations'] and len(p['baseline']['declarations'])==274
assert p['sources'][:-1]==p0['sources']
for row,row0 in zip(p['coverage'],p0['coverage']):
 if row['stageId']!=RID+':R03.3':assert row==row0
 else:
  for key in row0:
   if key!='remaining':assert row[key]==row0[key],key
  assert row['remaining'][:-1]==row0['remaining']
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked'for n in new.values())
reader=(R/FILES[1]).read_text();lean=(R/FILES[2]).read_text();oldlean=blob(FILES[2]).decode()
assert reader.startswith(blob(FILES[1]).decode())
imports=(S/'CanonicalImports.lean').read_text();assert (lean.replace(imports,'',1)if imports else lean).startswith(oldlean)
assert lean.encode()==(S/'Canonical.lean').read_bytes()
for n in added.values():
 assert n['statement'] in reader and n['declaration'] in reader,n['id']
 for t in n.get('tests',[]):assert t['name'] in lean and t['statement'] in reader,t
native=(S/'Native.lean').read_text();extra=(S/'New.lean').read_text();tests=(S/'Tests.lean').read_text()
assert native==''.join((S/n).read_text()for n in ['Imports.lean','Predecessor.lean','New.lean','Tests.lean'])
assert sha((S/'Predecessor.lean').read_bytes())=='245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402'
assert not re.search(r'\bsorry\b|\baxiom\b|\badmit\b',native)
log=(S/'native.log').read_text();clog=(S/'canonical.log').read_text()
assert not re.search(r'error:|warning:|sorryAx',log) and 'Exit status: 0' in log
audits=re.findall(r"'([^']+)' depends on axioms:\s*\[([^\]]*)\]",log)
assert len(audits)==84 and len({n for n,_ in audits})==84
assert all(set(re.findall(r'[\w.]+',axes))<={'propext','Classical.choice','Quot.sound'}for _,axes in audits)
assert 'error:' not in clog and clog.count('warning:')==clog.count('warning: declaration uses')==367 and 'Exit status: 0' in clog
assert len(re.findall(r'^example\b',native,re.M))==64 and len(re.findall(r'^example\b',lean,re.M))==190
def norm(s):return re.sub(r'\s+',' ',s).strip()
def header(s,start):
 tail=s[start:];end=re.search(r' :=(?= by\b| rfl\b|\n)',tail);assert end,tail[:120]
 return tail[:end.start()]
names=['quotient_length_succ','planeJetCount_defect','planeJetCount_step','planeCurve_gradedFunction','planeCurve_postulation_defect','planeCurve_postulation_iff','planeCurve_graded_stable_iff','planeCurve_postulation_predecessor','planeZeroEquation_gradedFunction']
for name in names:
 pat=r'^(?:theorem|lemma) '+re.escape(name)+r'\b';a=re.search(pat,extra,re.M);b=re.search(pat,lean,re.M);assert a and b,name
 assert norm(header(extra,a.start()))==norm(header(lean,b.start())),name
tt=list(re.finditer(r'^-- test: (\S+)\n',tests,re.M));assert len(tt)==10
for m in tt:
 b=re.search(r'^-- test: '+re.escape(m[1])+r'\n',lean,re.M);assert b,m[1]
 assert norm(re.sub(r'^theorem \S+','example',header(tests,m.end())))==norm(header(lean,b.end())),m[1]
tree=ast.parse((R/'research/blueprint/intake.py').read_text())
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name=='file_problems']
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
for dst in FILES:
 text=(R/dst).read_text();assert not env['file_problems'](dst,text),dst
 assert not re.search(r'[ \t]+$',text,re.M),dst
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',text),dst
changed=set(subprocess.check_output(['git','diff','--name-only',BASE],cwd=R,text=True).splitlines());assert changed<=set(FILES),changed
sys.path.insert(0,str(R/'scripts'));import check_blueprint,build,blueprints
errors,warnings,summary=check_blueprint.check(R/FILES[0],check_blueprint.load_index(INDEX),check_blueprint.world())
assert not errors and not warnings,(errors,warnings);summary.pop('packet',None)
packets,documents,definitions=blueprints.load_promoted(R)
otherparts=[(stem,q)for stem,q in packets if q.get('roadmapId')==RID and stem!=STEM];assert otherparts
keep=[x for x in packets if x[0]!=STEM];documents[STEM]=FILES[1]
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(p0);a0=json.loads((R/'data/atlas.json').read_text())
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for path in sorted((R/folder).glob('*.json')):
  q=json.loads(path.read_text())
  for n in q.get('nodes',[]):world.setdefault(n['id'],n)
world.update(new)
stages={x['id']:x for x in a['stages']};stageids=set(stages)|set(check_blueprint.world()[1]);scope=set(p['scope'])
stageedges={(e['source'],e['target'])for e in a['stageEdges']}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in out[s]:out[s].add(t);indeg[t]+=1
 stack=[v for v,c in indeg.items()if c==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,c in indeg.items()if c][:15]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
ownedges={(q,nid)for nid,n in new.items()for q in n.get('prerequisites',[])if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid);n=world[nid]
 if n.get('parentStageId'):dep.add((n['parentStageId'],nid))
 for q in n.get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:'))and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(r['supplier'],c)for r in p['requests']for c in r['neededBy']if c in new or c in stageids}
ar=next(r for r in a['roadmaps']if r['id']==RID)
assert ar['blueprint']['declarations']==len(new)+sum(len(q['nodes'])for _,q in otherparts)
assert not ar['blueprint']['skippedLinks'] and not ar.get('pendingLinks',[])
control={(e['source'],e['target'])for e in b['stageEdges']};assert stageedges==control
def skips(atlas):return {r['id']:(r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[]))for r in atlas['roadmaps']if r['id']!=RID}
assert skips(a)==skips(b)
def reachable(s,t,edges=stageedges):
 out=collections.defaultdict(set)
 for u,v in edges:out[u].add(v)
 stack=[s];visited=set()
 while stack:
  v=stack.pop()
  if v==t:return True
  if v in visited:continue
  visited.add(v);stack.extend(out[v]-visited)
 return False
def stage_of(v):
 visited=set()
 while v in world:
  assert v not in visited;visited.add(v);v=world[v].get('parentStageId')or(world[v].get('realises')or[None])[0]
 return v
pairs={(e['source'],e['target'])for e in a0['stageEdges']if e['target']in scope}
for n in new.values():
 for q in n.get('prerequisites',[]):
  if q not in new and not q.startswith(('mathlib:','tauceti:')):pairs.add((stage_of(q),stage_of(n['id'])))
for r in p['requests']:
 for c in r['neededBy']:pairs.add((stage_of(r['supplier']),stage_of(c)))
missing={(s,t)for s,t in pairs if not reachable(s,t)}
assert missing=={(s,t)for s,t in pairs if not reachable(s,t,control)}
expected={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert missing==expected,missing
acceptedpairs=set()
for path in (R/PREFIX/'restructure').glob('*.result.json'):
 q=json.loads(path.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 for row in q.get('links',[]):
  if any(row.get(k,'').startswith(RID+':')for k in ['source','target']):acceptedpairs.add((row['source'],row['target']))
assert all(reachable(s,t)for s,t in acceptedpairs)
report={'publicationBase':BASE,'checker':summary,'errors':errors,'warnings':warnings,'intake':'pass','preservedContracts':125,'preservedWholeNodes':123,'newNodes':5,'mathHeadersMatched':9,'newTestTypesMatched':10,'allAPIItems':sum(len(n.get('api',[]))for n in new.values()),'allTests':sum(len(n.get('tests',[]))for n in new.values()),'nativeAxiomAudits':84,'canonicalAdmissionWarnings':367,'nativeSha256':sha(native.encode()),'canonicalSha256':sha(lean.encode()),'stageDAG':dag(stages,stageedges),'ownDAG':dag(new,ownedges),'scopedCombinedDAG':dag(set(stages)|seen,stageedges|dep),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(new)),'baselineLeaves':len(baseref),'unresolvedReferences':0,'otherPartsRetained':[stem for stem,_ in otherparts],'roadmapDeclarations':ar['blueprint']['declarations'],'supplierStagePairs':len(pairs),'supplierStagePairsReachable':len(pairs)-len(missing),'inheritedMissingPairs':sorted(missing),'acceptedRestructurePairs':len(acceptedpairs),'acceptedRestructurePairsAllReachable':True,'stageEdgesUnchanged':True,'otherSkippedPendingUnchanged':True,'ownSkippedPendingEmpty':True,'changedPaths':sorted(changed)}
print(json.dumps(report,ensure_ascii=False,indent=2))
```

After setting REPO to the submitted existing clone, PROOF_SCRATCH to your own
disk scratch, EXISTING_PINNED_BUILD to the existing build and PINNED_INDEX to
the exact existing index, run sequentially. Check free -g before each Lean
invocation and skip compiling if available memory is below 20 GiB. Retain
the 20-minute timeout and leave no process running.

```sh
python3 "$PROOF_SCRATCH/reconstruct.py" "$PROOF_SCRATCH"
cd "$EXISTING_PINNED_BUILD"
free -g
timeout 1200 /usr/bin/time -v lake env lean "$PROOF_SCRATCH/Native.lean" > "$PROOF_SCRATCH/native.log" 2>&1
free -g
timeout 1200 /usr/bin/time -v lake env lean "$PROOF_SCRATCH/Canonical.lean" > "$PROOF_SCRATCH/canonical.log" 2>&1
cd "$REPO"
PYTHONDONTWRITEBYTECODE=1 python3 "$PROOF_SCRATCH/validate.py" "$REPO" "$PROOF_SCRATCH" "$PINNED_INDEX"
```

## Where to resume

Prove the actual tangent-cone kernel and curve-ring dimension, then identify
the established finite formula with the existing general cumulative polynomial
and intrinsic/ambient multiplicities under proved hypotheses. The general
multiplicity key still includes all finite modules and primary ideals; this
plane-curve calculation does not replace it. General Hilbert–Serre induction,
support/degree, Artin–Rees, localization lengths, completion, associativity,
all eight stage targets and all inherited routed-paper obligations remain.
Continue from these actual carriers and sharp cutoff proofs rather than
assuming a general existence theorem or weakening a general owner contract.

---

The following complete incoming handoff is preserved as historical evidence.
Its reading, test and graph receipts describe its own checkpoint.

# Finite equation jets and actual curve lengths — #551 checkpoint

Codex — codex-7e92bd, 2026-10-03. Winning claim 5963743079, bot
confirmation 5963744198. Mathematical base `bfef64afffd06e4c8a18b53a76c331a147dd7eb7`;
publication base `9a3905af27dd59b81ab74e7df6ff86d5398eeb12`. All twenty governing,
audit, ownership, deliverable and checker inputs were unchanged at publication.

Two new lemma nodes make the finite quotient argument explicit: an equation
jet is finite over any commutative coefficient ring in finitely many variables;
over a field, its actual series-ring length equals its finite coefficient
dimension. The combined native proof then establishes the existing ambient
length, shifted length balance, all-index equation length, actual cumulative
curve function and separate zero-equation signatures. It handles the N<d
branch separately. No subtraction or natural conversion of an unproved
infinite length occurs.

For R=k[[x,y]], v=(x,y), A=R/(f), q=image(v), and order(f)=d finite,
H_q,A(N)=binom(N+2,2)−binom(N+2−d,2), with natural subtraction before
the extended-natural cast. This includes units and nonreduced equations in
positive characteristic. The zero equation has the ambient triangular count.
Neither general multiplicity nor curve dimension is defined by this formula.

All 123 old statement, hypothesis, acceptance, API, test, use and source
contracts are preserved; 121 whole node objects are unchanged. Two old proof
plans/dependency lists consume the checked finite adapter and exactness API.
The canonical source is the full incoming source plus two lemma signatures
and three examples. The reader retains its whole incoming text after the
new current section. The reserved multiplicity object, eight partial stages,
source findings, two requests and all historical remaining lists are retained.

Inventory: 125 nodes (8 definitions, 22 constructions, 79 lemmas,
16 theorems), 125 API items, 115 definition/construction tests and 156 total
test records, 13 planets, 268 indexed baseline declarations, 15 gaps and
2 requests. This checkpoint adds two lemmas and three tests; no API or
planet is added. All implementation statuses remain unchecked.

## Checks and proof boundary

The native source preserves the entire mathematical bodies of the incoming
975-line shifted-jet proof, the 121-line residue/length proof and the
128-line quotient-ring proof. Their imports are gathered into the top block;
no mathematical body is rewritten. The original hashes and archives are
checked by verify.py below. Credit remains with codex-J6LwjP, codex-a71f92,
codex-5ebb6f, codex-rtOQ9t, codex-7e92bd, ChatGPT —
gpt6astra-20261002-7d2f90 and ChatGPT Pro — cp-20261002-sr-c72e81.
The preceding complete handoff and its historical receipts remain available
[at the incoming base](https://github.com/CBirkbeck/tauceti-explorer/blob/bfef64afffd06e4c8a18b53a76c331a147dd7eb7/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).
Earlier finite computational regressions were not rerun.

The combined native check contains 64 examples and 65 named axiom audits.
Every audit excludes sorryAx and uses only propext, Classical.choice and
Quot.sound. Five existing actual-curve tests are freshly checked, along with
three new finite-coefficient/rank tests. The graded-function example is not
claimed proved. Eight declaration headers and eight example headers match
the admitted canonical source exactly after whitespace normalization.

Both complete files elaborate in the existing Lean 4.34.0-rc2 / exact
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 build. They import no
Tau Ceti module. The shared checkout's Tau Ceti HEAD is
cf386627e9176a3827c1a5fe804989fd94a4d216, not the source-audit pin; this
is full Mathlib-only elaboration. The independent source baseline remains
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Each final compile had
45 GiB available, ran one Lean process with timeout 1200, and used no library
build, cache download, new project or language server. No compiler remains
running.

```json
{
  "Native": {
    "sourceSha256": "245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402",
    "normalizedLogSha256": "1c6b32b6725be1a7377c50f1a5ac40fa032a27c411f5f63fd0c496d70d3be2d4",
    "lines": 1430,
    "examples": 64,
    "axiomAudits": 65,
    "errors": 0,
    "warnings": 0,
    "admissionWarnings": 0,
    "sorryAx": 0,
    "availableGiBBeforeCompile": 45,
    "seconds": 7.2,
    "maxRSSKiB": 3511764
  },
  "Canonical": {
    "sourceSha256": "c9035fb0d224d44c110e99d6e5c777692f1b7c7a1a4d19833abc17f101d41b79",
    "normalizedLogSha256": "38cbb579368216055c73e9cfbb476be1d2dc2d17fd4b0e338c16f70c945c513b",
    "lines": 2792,
    "examples": 180,
    "axiomAudits": 0,
    "errors": 0,
    "warnings": 352,
    "admissionWarnings": 352,
    "sorryAx": 0,
    "availableGiBBeforeCompile": 45,
    "seconds": 25.11,
    "maxRSSKiB": 3550000
  }
}
```

The indexed packet checker has zero errors and warnings. Full contract and
header preservation, actual intake file checks and whitespace checks pass.
The actual assembler overlays candidate and original packets in the same
publication tree. All three graphs are acyclic; the R03.6 part is retained;
there are no unresolved declaration dependencies or new missing stage paths.
All 65 accepted restructure paths are reachable. Twelve of thirteen scoped
supplier paths are reachable: the inherited LocalFieldsRamification layer-0
→ R03.4 gap remains in candidate and control, with its recorded request.
Stage edges and other roadmaps' skipped/pending links are unchanged; this
roadmap has no skipped/pending links.

```json
{
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDAG": {
    "vertices": 125,
    "edges": 192,
    "acyclic": true
  },
  "combinedDAG": {
    "vertices": 3116,
    "edges": 8815,
    "acyclic": true
  },
  "reachableDeclarations": 126,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "reachableBaselineReferences": 237,
  "unresolved": [],
  "otherPartsRetained": [
    "DeformationAndDerivedPatchingAlgebra--R03.6"
  ],
  "partDeclarations": 125,
  "partPlanets": 13,
  "roadmapDeclarations": 178,
  "requiredStagePairs": 13,
  "requiredStagePairsReachable": 12,
  "inheritedMissingStagePairs": [
    [
      "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
      "DeformationAndDerivedPatchingAlgebra:R03.4"
    ]
  ],
  "acceptedRestructurePairs": 65,
  "acceptedRestructurePairsReachable": 65,
  "stageEdgesUnchanged": true,
  "otherSkippedPendingUnchanged": true,
  "ownSkippedPendingEmpty": true
}
```

Fresh reading: complete issue before claiming and unchanged-body verification
after bot confirmation; incoming current handoff/proof recipe and continuation;
all eight applicable reviewed AUDIT-17 rows; campaign document, scoped stage
descriptions and original stage edges; accepted RS-08 own keeps/owners and
scoped link overlap; full reserved multiplicity entry and current owner node;
selected integrated depth/perfect-complex contracts. All three public proof
archives were recovered and hash-verified; the entire residue and quotient
proofs and selected incoming jet/shifted proof sections were freshly read.
DDPA-JET-HANDOFF §§3–4 and DDPA-CURVE-POSTULATION §§1–3 were freshly read.
HS-EQUATION-LENGTH-PIN records bounded native declaration reads and file
hashes. Earlier upstream-style and whole-source readings remain historical;
this is not a fresh complete read of every routed paper or the whole libraries.

Fresh open-PR search found [Mathlib #9819](https://github.com/leanprover-community/mathlib4/pull/9819),
head 413e5b872a7c758e0eb91f99cb96d6a61c81f0a2, still open. Its body and
file inventory were checked; the earlier full 131-line HilbertPolynomial
reading remains historical. Its general graded Hilbert–Serre work must be
reconciled before that open induction is implemented. No unmerged theorem is
used here. Two bounded public Zulip searches for Hilbert–Samuel/power-series
length and Hilbert polynomials returned no relevant mathematical thread;
this is not an absence proof.

## Recovery and reproduction

The complete checked native proof is archived in the allowed suggested path
at [6292c37bd3730574a75b771115a52ad684dcea31](https://github.com/CBirkbeck/tauceti-explorer/commit/6292c37bd3730574a75b771115a52ad684dcea31),
in an inert nested comment in the preceding commit. The final suggested file
removes only that archive comment and retains admitted bodies under PROTOCOL
§13. Save the following as recover.py in small disk scratch, then run it from
the existing clone with that scratch directory as argument. It fetches only
specific public commits if absent; it creates no repository snapshot.

```python
from pathlib import Path
import hashlib, subprocess, sys
out=Path(sys.argv[1]); assert out.is_dir()
archive="6292c37bd3730574a75b771115a52ad684dcea31"
base="bfef64afffd06e4c8a18b53a76c331a147dd7eb7"
path="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
commits=[archive,base,"25a2ed36500d86f9158bfddf498d6f9f57a78ab3",
 "20fb961cd54398638ba6a9b1b9b818fb546163bf","30299125337a2f2532f316bd5390b3729c64c1b2"]
for commit in commits:
 if subprocess.run(["git","cat-file","-e",commit+"^{commit}"],
     stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL).returncode:
  subprocess.run(["git","fetch","origin",commit],check=True)
t=subprocess.check_output(["git","show",archive+":"+path],text=True)
canonical,nested=t.split("\n/- BEGIN ARCHIVED CHECKED EQUATION JET LENGTHS\n",1)
native=nested.split("END ARCHIVED CHECKED EQUATION JET LENGTHS -/\n",1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402"
assert hashlib.sha256(canonical.encode()).hexdigest()=="c9035fb0d224d44c110e99d6e5c777692f1b7c7a1a4d19833abc17f101d41b79"
(out/"Native.lean").write_text(native)
(out/"Canonical.lean").write_text(canonical)
packet="research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json"
(out/"original-packet.json").write_bytes(subprocess.check_output(["git","show",base+":"+packet]))
print("Recovered and hash-verified both checked sources and the original packet.")
```

After checking free -g reports at least 20 GiB available, from the existing
exact-pin build run one file at a time:
`/usr/bin/time -f 'Elapsed %e seconds; peak %M KiB' timeout 1200 lake env lean "$task_dir/Native.lean"`
and then the corresponding Canonical.lean command. Capture combined output.
For the diagnostic hash, drop the final Elapsed timing line, replace the
compiled filename by `<lean-file>` and retain a final newline.

Save the following as verify.py and run from the submitted clone with the
recovery directory as argument. SHA-256:
`b28c312f377243d3adfff2ec996386d788f79afbc0e6b61424721a8bf4b3a342`.

```python
from pathlib import Path
import collections, hashlib, json, re, subprocess, sys

root = Path.cwd()
s = Path(sys.argv[1])
stem = 'DeformationAndDerivedPatchingAlgebra--P7'
path = 'research/blueprint/suggested/' + stem + '.lean'
p = json.loads((root/'research/blueprint/packets'/f'{stem}.json').read_text())
old = json.loads((s/'original-packet.json').read_text())
byid = {n['id']: n for n in p['nodes']}
contracts = ['statement', 'hypotheses', 'acceptance', 'api', 'tests', 'uses', 'sources']
for n in old['nodes']:
    assert all(byid[n['id']].get(k) == n.get(k) for k in contracts), n['id']
changed = [n['id'] for n in old['nodes'] if n != byid[n['id']]]
assert sorted(x.rsplit('/',1)[-1] for x in changed) == [
    'plane-equation-jet-length', 'plane-equation-jet-length-balance']
for k, v in old.items():
    if k not in ['nodes','sources','baseline','gaps']:
        assert p[k] == v, k
assert p['baseline']['declarations'][:len(old['baseline']['declarations'])] == old['baseline']['declarations']
assert p['sources'][:len(old['sources'])] == old['sources']
assert p['gaps'][:-1] == old['gaps'][:-1]
assert p['gaps'][-1]['detail'].startswith(old['gaps'][-1]['detail'])
assert all(n['implementationStatus'] == 'unchecked' for n in p['nodes'])

native = (s/'Native.lean').read_text()
canonical = (s/'Canonical.lean').read_text()
assert canonical == (root/path).read_text()
base = p['equationLengthContinuation']['base']
incoming = subprocess.check_output(['git','show',base+':'+path],text=True)
assert canonical.startswith(incoming)
readerpath = 'research/blueprint/readmes/'+stem+'.md'
oldreader = subprocess.check_output(['git','show',base+':'+readerpath],text=True)
assert (root/readerpath).read_text().endswith(oldreader)
assert not re.search(r'\bsorry\b|\baxiom\b',native)

archives = [
 ('25a2ed36500d86f9158bfddf498d6f9f57a78ab3', 'EXACT ORDER SHIFTED JETS',
  '7df121750db08c9caf5a04386c16f9b835a7e05642c586cab997d7a0870c8111'),
 ('20fb961cd54398638ba6a9b1b9b818fb546163bf', 'SERIES RESIDUE AND LENGTH',
  'e123da1f4b68b77a81bd08a2fb116c7a77f5475b568af9c8872e33ea5959321d'),
 ('30299125337a2f2532f316bd5390b3729c64c1b2', 'QUOTIENT RING HILBERT SAMUEL',
  'cd8cb5cd1291a582f25dc0363a0a8d020b1bcc57b79766b3471388f2862d3c11')]
for commit, marker, expected in archives:
    t = subprocess.check_output(['git','show',commit+':'+path],text=True)
    body = t.split('BEGIN ARCHIVED CHECKED '+marker+'\n',1)[1].split(
        'END ARCHIVED CHECKED '+marker,1)[0]
    assert hashlib.sha256(body.encode()).hexdigest() == expected
    body = ''.join(l for l in body.splitlines(keepends=True) if not l.startswith('import '))
    assert body in native

def header(t, start):
    tail = t[t.index(start):]
    end = re.search(r' := (?:by(?: sorry)?\n|rfl\n|\n)',tail)
    assert end, start
    return ' '.join(tail[:end.start()].split())

names = ['equationJet_finite','equationJet_length_eq_finrank',
 'totalJet_length_eq_finrank','planeTotalJet_length','planeEquationJet_length_balance',
 'planeEquationJet_length','planeCurve_function','planeZeroEquation_function']
for name in names:
    assert header(native,'lemma '+name+' ') == header(canonical,'lemma '+name+' '),name
tests = ['PlaneCurveAcceptance.'+x for x in ['unit_boundary','zero_equation_six',
 'smooth_linear','nonreduced_cumulative','below_equation_order']]
tests += ['HilbertSamuelEquationJetTest.'+x for x in ['nonreduced_rank',
 'nilpotent_coefficients_finite','zero_coefficients_finite']]
for name in tests:
    assert header(native,'-- test: '+name+'\n') == header(canonical,'-- test: '+name+'\n'),name

print(json.dumps(dict(oldContractsPreserved=len(old['nodes']),
 wholeOldNodesUnchanged=len(old['nodes'])-len(changed),
 canonicalPrefixPreserved=True,readerSuffixPreserved=True,
 predecessorProofBodiesPreserved=len(archives),namedHeadersMatched=len(names),
 exampleHeadersMatched=len(tests),nodes=len(p['nodes']),
 kinds=dict(collections.Counter(n['kind'] for n in p['nodes'])),
 apiItems=sum(len(n.get('api',[])) for n in p['nodes']),
 totalTestRecords=sum(len(n.get('tests',[])) for n in p['nodes']),
 definitionConstructionTests=sum(len(n.get('tests',[])) for n in p['nodes']
     if n['kind'] in ['definition','construction']),
 planets=sum('planet' in n for n in p['nodes']),
 baselineDeclarations=len(p['baseline']['declarations']),gaps=len(p['gaps']),
 requests=len(p['requests'])),indent=2))
```

Save the following actual assembler check as graph.py and run from the
submitted clone with original-packet.json as argument. It does not write
atlas files or add artificial realization edges. SHA-256:
`1df378b97a169e8ebf8a89036aaf6170d5dfa79a3cb512587f2dbfd9277c7a3b`.

```python
from pathlib import Path
import sys,json,copy,collections
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((Path.cwd()/'research/blueprint/packets'/f'{STEM}.json').read_text())
original=json.loads(Path(sys.argv[1]).read_text())
new={n['id']:n for n in p['nodes']}
root=Path.cwd()
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert otherparts, "must preserve other promoted roadmap parts"
keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(original)
world={}
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
 for path in sorted((root/folder).glob("*.json")):
  q=json.loads(path.read_text())
  for n in q.get("nodes",[]):world.setdefault(n["id"],n)
world.update(new)
stages={x["id"]:x for x in a["stages"]}
stageids=set(stages)|set(check_blueprint.world()[1])
stageedges={(e["source"],e["target"]) for e in a["stageEdges"]}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for source,target in edges:
  if target not in out[source]:out[source].add(target);indeg[target]+=1
 stack=[v for v,count in indeg.items() if count==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,count in indeg.items() if count][:15]
 return {"vertices":len(vertices),"edges":len(edges),"acyclic":True}
ownedges={(q,nid) for nid,node in new.items() for q in node.get("prerequisites",[]) if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 for q in world[nid].get("prerequisites",[]):
  if q.startswith(("mathlib:","tauceti:")) and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(n["parentStageId"],nid) for nid,n in new.items() if n.get("parentStageId") in new}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert stageedges=={(e["source"],e["target"]) for e in b["stageEdges"]}
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
out=collections.defaultdict(set)
for source,target in stageedges:out[source].add(target)
def reachable(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(out[v]-seen)
 return False
pairs={(e["source"],e["target"]) for e in a0["stageEdges"] if e["target"].startswith(RID+":")}
for node in p["nodes"]:
 for q in node.get("prerequisites",[]):
  if q in stageids and q not in world and q!=node["parentStageId"]:pairs.add((q,node["parentStageId"]))
for req in p.get("requests",[]):
 for consumer in req.get("neededBy",[]):
  if consumer in new:pairs.add((req["supplier"],new[consumer]["parentStageId"]))
  elif consumer in stageids:pairs.add((req["supplier"],consumer))
missingpairs={(s,t) for s,t in pairs if not reachable(s,t)}
oldout=collections.defaultdict(set)
for edge in b['stageEdges']:oldout[edge['source']].add(edge['target'])
def reachable0(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(oldout[v]-seen)
 return False
assert missingpairs=={(s,t) for s,t in pairs if not reachable0(s,t)}
assert missingpairs=={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert any('LocalFieldsRamification layer 0 to R03.4' in gap['detail'] for gap in p['gaps'])
# Independently retain all accepted restructure links touching the whole roadmap.
acceptedpairs=set()
for path in (root/"research/blueprint/restructure").glob("*.result.json"):
 q=json.loads(path.read_text())
 if q.get("review",{}).get("status")!="accepted":continue
 for row in q.get("links",[]):
  if any(row.get(k,"").startswith(RID+":") for k in ["source","target"]):
   acceptedpairs.add((row["source"],row["target"]))
assert all(reachable(s,t) for s,t in acceptedpairs),[(s,t) for s,t in acceptedpairs if not reachable(s,t)]
report={"stageDAG":dag(stages,stageedges),"ownDAG":dag(new,ownedges),
 "combinedDAG":dag(set(stages)|seen,stageedges|dep),"reachableDeclarations":len(seen),
 "externalDeclarations":sorted(seen-set(new)),"reachableBaselineReferences":len(baseref),
 "unresolved":sorted(unresolved),"otherPartsRetained":[stem for stem,_ in otherparts],
 "partDeclarations":len(new),"partPlanets":sum("planet" in n for n in p["nodes"]),
 "roadmapDeclarations":roadmap["blueprint"]["declarations"],
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missingpairs),
 "inheritedMissingStagePairs":sorted(missingpairs),
 "acceptedRestructurePairs":len(acceptedpairs),"acceptedRestructurePairsReachable":len(acceptedpairs),
 "stageEdgesUnchanged":True,"otherSkippedPendingUnchanged":True,"ownSkippedPendingEmpty":True}
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

## Continuation

Use the checked all-index cumulative formula to prove the existing native
gradedFunction formula, its rational postulation defect and sharp cumulative
agreement threshold, preserving the zero/unit and low-cutoff boundaries.
The existing polynomial identification still relies on its general existence
and uniqueness theorem. Prove the full tangent-cone kernel, actual curve
dimension and intrinsic/ambient multiplicity comparisons.

General Hilbert–Serre induction (reconciling #9819), degree/dimension,
Artin–Rees, finite top-dimensional localized lengths, associativity,
completion, parameter-ideal and regular-local comparisons, all P7/P8/P9 and
R03.1–R03.5 targets and every routed-paper obligation remain open. The two
supplier requests and the inherited local-field path gap are unchanged.
