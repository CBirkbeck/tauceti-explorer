# BP-AnabelianGeometryAndNonabelianChabauty — curve-effacement checkpoint

Worker: Codex — codex-a71f92. Refs #1020. Date: 2026-10-02.
Immutable audit/publication base: 22338bf4456c3e008e75de86d3bc9f132f7cf126.
Winning claim: [5955891736](https://github.com/CBirkbeck/tauceti-explorer/issues/1020#issuecomment-5955891736).
Bot confirmation: [5955894275](https://github.com/CBirkbeck/tauceti-explorer/issues/1020#issuecomment-5955894275).

## Outcome and preservation

Six new NC.0 declarations split the characteristic-zero smooth-curve proof:
connected prime-degree covers, degree-two prime killing, prime-power tower
killing, geometric all-cover effacement, descent of a geometric killing cover,
and separable-closure invariance of the full K(π,1) predicate. All 42 old IDs
and all old theorem statements survive. Forty old node objects are unchanged.
The reserved definition appends six discriminating tests, one source use and
seven baseline references. The old smooth-curve node changes only its proof,
prerequisites and source explanation, retaining its statement, scope and planet.

The current packet has 48 nodes: 3 definitions, 4 constructions, 14 lemmas,
21 theorems and 6 comparisons; 52 API items (40 on definitions/constructions),
38 test contracts, 11 planets, 62 baseline declarations, 9 gap groups and
16 requests. The seven stage IDs and status values survive; no stage is closed.
All implementationStatus values are unchecked. No generic geometry carrier
or second Picard/cohomology/fundamental-group owner is introduced.

## Mathematical checks and exact boundary

The nonzero degree-one character π→F_p is obtained from Kummer/Jacobian
p-torsion and the canonical H¹ comparison for any connected scheme. It
does not assume that the curve is already K(π,1). Its translation π-set has
p points and is transitive; the zero character gives p disconnected copies.

The actual canonical H² pullback is multiplication by cover degree. A degree-p
cover kills μ_p, but does not kill μ_(p²); a tower of two degree-p covers does.
The prime-power tower need not be Galois as a composite. Its genus stays
positive by the imported unramified Riemann–Hurwitz formula. The exponent
zero boundary means coefficient n=1, not the nonfinite coefficient n=0.

The geometric theorem verifies constant prime-field effacement on every
connected finite cover, then uses the already owned coefficient dévissage.
Affine curve étale vanishing is imported separately from coherent Serre
vanishing. A nonaffine smooth separated finite-type curve is projective.

Separable descent has two distinct stages: descend the finite cover and its
properties, then enlarge the finite field again until the pulled-back class
is zero. Continuity gives eventual zero, not injectivity of restriction.
Conversely, geometric coefficient group operations and a class descend to
finite stages before finite-étale invariance is applied. No properness or
arbitrary-extension cohomology invariance is assumed. The explicit
Spec R / Spec C test shows why identifying the two H² groups is wrong.

Generic Kummer/Picard computations and pullback-degree are requested from
SF.2, with curve geometry/Jacobian torsion and genus from SF.3. IG.0 supplies
finite π-set/covers and connectedness. A separate SF.2 continuity request
names qcqs, affine transitions, group-operation descent and eventual
vanishing. These are open precise requests, not proof certificates.

The reserved key AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1
remains the unique owner; its coefficient class and all canonical degrees
remain part of the data, on the full π, never an implicit pro-p quotient.
RT-AREA-algebraicgeometry/8 remains handled by the existing exact A2 NS=Pic/Pic⁰,
symmetric-Hom injection and finite-generation/rank request. NC.5 imports NS
and the generic height supplier; no duplicate or reverse height dependency.
The routed 19 NC.5 and 17 NC.2 BDMTV items, E9/E10, /58-versus-/93 split and
Chen /57–58 remain preserved not-read obligations.

## Sources actually read in this continuation

- Schmidt, version-of-record Compositio 100 (1996), Proposition 15 and its
  parsed proof pp.243–244, with §3/Proposition 13 context pp.242–243.
  PDF SHA-256 dc0350a302b5bc02de91a368790d40be1292dbcdcad108d21c08426affae1791.
  Scanned equations/degree diagram are omitted by parsing; p.244 screenshot
  failed and was not visually inspected. The direct degree formula was
  independently read in Stacks 0AMB, rather than claiming this image read.
- Schmidt–Stix published §2.3/Lemma 2.7 pp.826–827, including its references.
  The broader raw any-field theorem is not narrowed in the source; this
  packet retains its original characteristic-zero geometric curve scope.
- Achinger arXiv:1407.0337v1 Proposition 3.4(c), entire finite-separable and
  separable-closure proof paragraph, printed p.8.
  PDF SHA-256 7c26b2ca8df1b73bd6acd89872955cd6a1137de0933a948914f8cc5689d86791.
  Its general field-extension proof and all transitive limit leaves are
  not claimed closed by the algebraic separable case.
- Stacks 03RQ, 0AMB and 03RR, complete statements and printed proofs;
  03PL Kummer proof; 03P8, 03RM, 0BA0 and 03RP statements/printed proofs.
  The representability, Tsen/Brauer, abelian multiplication, degree-pullback
  and curve/function-field supplier proof leaves remain open.
- Stacks 03Q4 through 59.51.3 and 59.51.5 proofs, 09YQ statement,
  03RV finite-locally-constant representability proof and 07RR
  surjectivity-descent proof. 01ZM retrieval failed repeatedly;
  generic 32.10.1/32.8 and inverse-site cohomology 21.16.6 remain requests.
  No unpublished source mistake was identified in the selected scope.

Reviewed NC.0–NC.6 audit, all seven stages and seventeen touching atlas edges
were read. All 29 matching link files have only negative examined entries.
Current SF/IG packets were checked for exact suppliers; no adequate node was
found for these requested interfaces. Seven new pinned Mathlib statements
were read completely. The native TauCeti NumericalType torsion file was read:
its finite multidegree Picard group is not Pic⁰ of the smooth curve.
Earlier receipts are historical, not fresh whole-paper/full-library reads.
JacobianChallenge and StableReduction upstream readers were fully read in
the continuous worker run; AlgebraicCurves ownership conventions freshly
inspected. Current WORKERS/PROTOCOL changes were checked at the immutable base.

## Verification

The full suggested file was **not compiled**: the existing exact Mathlib build
has no matching built TauCeti imports. Twelve exact Mathlib-only arithmetic
examples elaborated successfully with twelve admitted-proof warnings and no
other warnings or errors. Fragment SHA-256
a563d7f57368952f0ad6367b42809f52f2dda6319e14c477844ba563db3d3b2e.
They check the native prime-order additive group/cardinality, degree-as-scalar
zero, coprime-degree inverse/bijectivity and the n=1/power boundaries.
No geometric declaration, cover, cohomology comparison or descent signature
was elaborated. All six declarations and six tests have explicit mathematical
omission contracts rather than fake predicates. The full inherited native
body is preserved; one individual Mathlib import and the new ledger/arithmetic
block are added. No background compiler is left running.

Exact dependency-free finite regression passed:
5,184 degree maps/168,480 values; 251,680 composition values; 611 prime-power
values; 135 abelian-character models/28,712 additivity checks/135 orbit checks;
168 genus steps; 8 C₂ cocycle identities/2 coboundary nonexamples; 12 eventual-zero
toy chains. Model SHA-256
e9d0508a7f2f3a9e58b4f9e57636e971f0f1c67ad4bfec38ce5a3f23fe2250ba.
These are finite arithmetic/character sanity checks, not geometric constructions,
cohomology comparison proofs or universal proofs. The exact script is below.
The inherited S₃ regression receipt is preserved but was not rerun here.

Packet checker, exact intake, preservation/privacy and actual atlas assembly
checks are recorded after their execution below. Only this job's four allowed
files are published. The shared checkout stays read-only.

## Precise continuation

First supply/type the actual IG.0 finite-cover/character and SF.2 coefficient,
canonical ε, Kummer-degree and continuity interfaces, and SF.3 curve/Jacobian/genus
inputs. The six new lemmas now expose every substantial curve assembly step.
Do not mark them closed while their generic proof leaves remain requests.
Then split the product K(π,1) argument's Künneth and product-cover inputs, and
the elementary-fibration/raw-homotopy route after its foundational owner is
reconciled. Tangential Chen paths/specialization remain an independent NC.0
target, not supplied by the curve K(π,1) proof. NC.3 continuous-cocycles,
functoriality, central-extension/twisting granularity and omitted native APIs
remain; representability and local Selmer conditions are unstarted. Read
NC.1 reconstruction and the full NC.2/NC.5 BDMTV routes to source closure.

## Durable exact finite-model script

```python
"""Exact finite arithmetic regressions, not scheme/cohomology proofs."""
from itertools import product
from math import gcd
import json

counts = {"degree_maps": 0, "degree_values": 0, "composition_values": 0,
          "prime_power_values": 0, "characters": 0, "character_additivity": 0,
          "translation_orbits": 0, "genus_steps": 0, "C2_cocycle_identities": 0,
          "C2_coboundary_nonexamples": 0, "eventual_zero_cases": 0}

for n in range(1, 65):
    for d in range(81):
        values = [(d*x) % n for x in range(n)]
        assert values.count(0) == gcd(d,n)
        assert len(set(values)) == n // gcd(d,n)
        assert (len(set(values)) == n) == (gcd(d,n) == 1)
        assert (set(values) == {0}) == (d % n == 0)
        if gcd(d,n) == 1:
            inverse = pow(d, -1, n)
            assert all(inverse*y % n == x for x,y in enumerate(values))
        counts["degree_maps"] += 1
        counts["degree_values"] += n
    for d,e in product(range(11), repeat=2):
        for x in range(n):
            assert e*(d*x % n) % n == (d*e*x) % n
            counts["composition_values"] += 1

for p in (2,3,5,7):
    for a in range(4):
        n = p**a
        for x in range(n):
            assert (p**a*x) % n == 0
            counts["prime_power_values"] += 1
        if a > 1:
            assert p % n != 0
        for g in range(1,8):
            tower_genus = g
            for step in range(a):
                tower_genus = 1+p*(tower_genus-1)
                assert tower_genus >= 1
                counts["genus_steps"] += 1
            assert tower_genus == 1+p**a*(g-1)

assert (3*1) % 9 == 3 and all(9*x % 9 == 0 for x in range(9))
assert all(4*x % 3 == x for x in range(3))
assert 1+3*(2-1) == 4 and 1+9*(2-1) == 10

# Model the abelian character group supplied by H1, not a geometric pi1.
for p,g in ((2,1),(2,2),(3,1),(3,2),(5,1)):
    vectors = list(product(range(p), repeat=2*g))
    for coefficients in vectors:
        character = lambda v: sum(a*x for a,x in zip(coefficients,v)) % p
        image = {character(v) for v in vectors}
        nonzero = any(coefficients)
        assert image == (set(range(p)) if nonzero else {0})
        # It suffices to check additivity against every standard basis vector.
        for v in vectors:
            for j in range(2*g):
                e = tuple(int(i == j) for i in range(2*g))
                w = tuple((x+y) % p for x,y in zip(v,e))
                assert character(w) == (character(v)+character(e)) % p
                counts["character_additivity"] += 1
        orbits = {frozenset((a+b) % p for b in image) for a in range(p)}
        assert len(orbits) == (1 if nonzero else p)
        counts["characters"] += 1
        counts["translation_orbits"] += 1

# The arithmetic restriction test has a concrete nonzero C2/F2 class.
c = lambda g,h: g*h % 2
for g,h,k in product(range(2), repeat=3):
    assert (c(h,k)+c(g,(h+k)%2)-c((g+h)%2,k)-c(g,h)) % 2 == 0
    counts["C2_cocycle_identities"] += 1
for b1 in range(2):
    b = lambda g: b1*g
    assert (b(1)-b(0)+b(1)) % 2 == 0 != c(1,1)
    counts["C2_coboundary_nonexamples"] += 1

# A filtered-colimit zero must be realized at a later stage, not the first.
for zero_stage in range(1,13):
    value = 1
    assert value != 0
    for stage in range(1, zero_stage+1):
        value = 0 if stage == zero_stage else value
    assert value == 0
    counts["eventual_zero_cases"] += 1

print(json.dumps({"status":"pass", "scope":"finite arithmetic and character models only",
                  "counts":counts}, sort_keys=True))
```

## Executed local validation receipt

The actual indexed checker returned zero errors and zero warnings: 48 nodes,
40 definition/construction API items, 38 unit tests, 11 planets and 62 baseline
records. The actual intake accepts all four files. Forty inherited node objects
and every old statement are preserved; all six new statements/names and six
tests match the reader and explicit omission ledger. A prose compiler-warning
token in the inherited reader was corrected to “admitted-proof warnings”.

The actual atlas assembly at the immutable audit tree, with only this packet
and reader overlaid, has 2,967 stages and 8,655 edges, acyclic. All five expected
supplier stage edges are present; no pending or skipped links. The dependency
subgraph reachable from this packet has 114 vertices, acyclic. These graph
checks do not close any mathematical gap. Full suggested-file SHA-256:
dbb822138c0790d3b0fc898ad09c9c0b29c3a67550123180dd7412b6d17af733.
JSON, allowed paths, privacy and whitespace checks passed. Validation is
read-only against Git blobs; no shared checkout, atlas data or scripts changed.

## Historical handoff

The complete preceding handoff is retained below for its exact formulas,
source boundaries and reproducible S₃ script; it describes earlier checkpoints,
not the current counts or fresh checks.

# Current checkpoint — finite-cover cohomological assembly

Codex — codex-5ebb6f, 2 October 2026. Refs #1020.
Claim 5955288574; bot 5955290873. Base aa4e072.

42 nodes: 3 definitions, 4 constructions, 12 lemmas, 18 theorems,
5 comparisons; 52 API items (checker counts 40 definition/construction
items), 32 tests, 11 planets, 55 baseline records, nine gaps,
fourteen requests. No stage is closed.

Five NC.0 nodes integrate the preceding proof handoff: direct-image transfer,
all-coefficient criterion, finite-étale invariance, two-cover dévissage and
constant-prime-field criterion. The retained cover criterion has a direct
noetherian, prime-supported cohomological proof. All 37 IDs survive;
35 node objects are unchanged. The reserved key gains an S₃ constant-F₃
H³ test. Raw homotopy retains its distinct scope.

Fresh Achinger 2014 §§2–3.4(a–b) and 2017 §4 selected proofs were read,
including rendered PDF pp.7–8. Source hashes, reading boundaries, six new
native baseline scopes and precise supplier requests are in the packet.
Generic continuous cohomology stays in upstream ProfiniteCohomology;
IG/SF/A2 ownership, NS and generic heights remain imports.

Indexed checker, intake, preservation/parity/DAG/planet checks and read-only
atlas assembly pass. The S₃ regression passes eight cases, 24 chain-map
and 24 cohomology comparisons, 1512 cocycle identities and pairing one.
Full Lean was not compiled: no combined exact-pin build found. Three
Mathlib-only smoke forms compiled with only admission warnings; receipts
state their limited scope.

Resume with actual supplier maps/omitted signatures, curve proof splitting,
raw homotopy, NC.3 granularity/representability/local conditions and the
Chen/BDMTV inventories. Historical handoffs retain the executable regression
and exact curve route. Scratch is deleted after submission.

---

# BP-AnabelianGeometryAndNonabelianChabauty — invariant-coset checkpoint

Agent: Codex — codex-rtOQ9t. Refs #1020. Winning claim 5953110496;
bot confirmation 5953113784. Publication base
04500e78b7d37fa3a04da7962a7d9f4d58fbfe16. Full issue read before claiming;
freshly fetched full post-confirmation body verified identical. Predecessors:
codex-a71f92 PR #5749 and codex-J6LwjP PR #5756. Their exact historical receipts
remain in Git history and the packet's continuationReceipts.

## Delivered

Eleven new NC.3 nodes package the native invariant coset set, projection π⁰ and
connecting map δ, with exactness at A^G, B^G, invariant cosets and H¹(G,A), and
the left B^G-orbit description of δ's fibres. Two constructions have six API
items and six typed suggested examples. Projection and representative APIs
are promoted to separate lemma nodes for downstream proofs.

The carrier is Mathlib's existing left coset quotient B/i(A), with its existing
QuotientAction/quotient machinery and fixedPoints subset. InvariantCosets is
only a local abbreviation instantiating these existing carriers. The subgroup
need not be normal. π⁰(1) specifies the source base point without assuming
quotient group operations. δ's actual suggested body takes the H¹ class of
the existing continuous connecting cocycle at the chosen quotient representative;
the representative formula proves independence. No continuous quotient section
or topology on the coset set is needed for these set-valued maps.

All 26 inherited node objects are unchanged, as are all eleven requests,
sourceCoverage inventories, sourceIssues, structural proposals and original
40 baseline records. The addressed coset-packaging gap is removed; the other
nine gap objects are unchanged. All seven stages remain partial/not_read and
all implementationStatus values remain unchecked. Packet totals: 37 nodes,
52 API items overall (40 on definitions/constructions), 31 test contracts,
11 planets, 49 baseline records, nine gaps and eleven supplier requests.

Only the four issue deliverables changed. No atlas, shared checker, other
roadmap or extraction was edited. The inherited suggested text is unchanged
apart from the inserted 148-line block before the central-extension marker.

## Fresh reading and ownership

Personally read Kim arXiv:math/0409456v1, printed pp. 5–9: cocycle and gauge
conventions, Proposition 1 and its proof, Proposition 2's printed proof, and
the nonnormal coefficient-subgroup exactness passage. Subsequently read p. 10
through Proposition 3 and its proof while rechecking the subgroup passage.
Earlier pp. 2–4, later sections and external proof citations were not freshly
read. The eleven general topological-group statements are direct elementary
derivations, not separately named source theorems of Kim. No new source mistake
was identified in this selected scope; historical errata/source receipts are
not fresh whole-source certificates.

PDF SHA-256: 00efa6e96091d564f7afa2ad9fb917a34cc0a55b7e258164383519b4e93ba941.
The distinct fresh source entry records the limited scope without rewriting
the old Kim source receipt.

All nine added Mathlib baseline records were checked against complete statements
and local hypotheses at 082e2d37e8b0463410cdb532e111cd43d5a66174 and the pinned
index. Read GroupAction/Quotient.lean lines 35–122, GroupAction/Defs.lean
fixedPoints/mem_fixedPoints and FixedPoints.subgroup with local hypotheses,
and Coset/Defs.lean's left relation, coset equality and representative lemmas.
The old forty baseline receipts remain historical; the fixed-point/coset
passages were corroborated afresh. Tau Ceti pin remains
f790474821cf4256814db967cb154e7af3d0c369.

Read all seven reviewed NC audit rows, all seven current stage descriptions,
and all seventeen touching atlas edges. Screened current link packets: zero
asserted matching links/overlaps and 29 negative examined entries. This is a
catalogue screen, not proof of no uses. Separately read accepted RS-29's
NC.0 arithmetic-path/tangential ownership and its IG.0/Belyi/IG.6 links, and
RS-03's forwarded elliptic Mordell–Weil/Selmer links to NC.5. No new cross-owner
request is needed for these NC.3 additions. Inherited A2/NS and height-owner
boundaries and all conjectural frontiers remain.

JacobianChallenge and Multiquadratic upstream READMEs were personally read in
full. ProfiniteCohomology was partly read only; do not claim a full read of it.

The reserved AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1 node is
preserved exactly: the coefficient class and all-degree canonical comparison
remain essential, with the raw homotopy comparison restricted to its verified
geometric-unibranch scope. Its missing geometric π/sheaf/ε carriers remain
explicit omissions and supplier requests, never assumed proposition fields.

RT-AREA-algebraicgeometry/8 remains handled by the inherited A2 request: import
NS(A)=Pic(A)/Pic⁰(A), its injection via φ_L into symmetric Hom(A,A∨), finite
generation using A6's finite-rank Hom, and ρ as its rank, building on
JacobianChallenge Layer E. NC.5 consumes these data; it does not define NS
locally. The BDMTV /9 ownership retarget is recorded logically in the existing
inventory; this job does not edit the extraction or A2's files.

## Validation and compilation boundary

Indexed check_blueprint: zero errors, zero warnings. Intake: four files,
zero problems. JSON/whitespace, complete 26-node preservation, original baseline
and source-inventory preservation, new statement/reader parity, declaration/API
name parity and six test-name/example forms passed.

The actual read-only build.assemble pipeline, substituting this packet in memory
into promoted packets, retains all 37 declarations and 11 planets, with no
skipped links. This uses normal retirement, accepted restructuring, link and
decomposition trimming. Complete assembled stage DAG: 3,018 vertices including
51 UPSTREAM interface endpoints, 8,654 edges, acyclic. Combined stage graph plus
this packet's complete declaration graph: 3,044 vertices, 8,768 edges, acyclic.
This is not a full audit of every other packet's unpublished declaration refs.
Overlay receipt SHA-256:
944932889b7f60da54eb8d597202ed3e1c6650646059956a0b51c8c7807863db.

Finite regression independently enumerates C₂ cocycles, gauge orbits, native
left cosets, invariants and all maps in the initial exact sequence. Models:
all six S₃ subgroups and all thirty S₄ subgroups under trivial and transposition
conjugation actions, plus every subgroup of C_n for 2≤n≤12 under negation.
Results: 88 stable action/subgroup cases, 40 nonnormal cases, 498 cosets,
340 invariant cosets, 1,079 representative checks, 2,728 fibre pairs and
162 cohomology classes. Seven cases reject a constant boundary and 56 reject
a constant projection. The C₂ ↪ C₄ doubling/negation example has a nontrivial
boundary on the odd invariant coset and no fixed lift. S₃'s nonnormal
transposition subgroup with trivial action has three invariant cosets.
Finite receipt SHA-256:
15ea19dbf769c12ef90b6f8f87b000857267a44132976de9193ea0f46e4af56b.

The full suggested file was NOT compiled: no existing combined build at both
pins was found. No new project, Lake update/cache retrieval, library build or
language server was started. The preceding worker's Mathlib-only excerpt
compiled before these additions; that historical receipt is not validation of
the new block. All new forms remain uncompiled and admitted. Finite computations
validate examples, never the general proofs or Lean elaboration.
New native block SHA-256:
4fdcbc0678e07e8d93918810ce75162733a080b9c757e42ac893ed23ff097f31.

## Resume

1. Use the newly packaged coset maps as the exactness interface. Elaborate their
   new native forms when a suitable existing pinned build is available; prove
   the local QuotientAction and fixedness lemmas, representative API and exactness.
   Do not substitute quotient groups for nonnormal cosets.
2. Split inherited continuous-cocycles, functoriality and central-extension into
   declaration-sized nodes; finish their explicit omission ledger, especially
   continuous H² central obstructions/freeness, twisting with target repointed
   at [c], and actual finite discrete action instances. InvariantCosets is an
   instantiation of native carriers, not another generic quotient theory.
3. Read/decompose the unipotent-point topology and representability proof leaves,
   then local conditions, global Selmer varieties and dimension calculations.
   The C₄ finite boundary is not a Selmer depth-two obstruction theorem.
4. Resolve the eleven inherited IG.0/IG.1/SF.2/SF.3/A2 requests and raw-homotopy
   foundation candidate. Retain the geometric-unibranch restriction and delegated
   Artin–Mazur/Schmidt/SGA proof leaves; import M₀,n from its reserved owner.
5. Read Chen /57–58 and all routed BDMTV obligations: 17 NC.2 and 19 NC.5 items,
   E9/E10 and four applications. Preserve /58 local word expansion versus /93
   global path-torsor comparison. NS belongs to A2. Generic heights stay with
   pending SelmerComplexesAndPadicHeightsPartII without a reverse NC.5 dependency.

Own scratch is under 1 MB and deleted once the PR is open. Durable hashes,
reading scopes, model descriptions, counts and resume instructions are above.
No compiler or background job remains running.

---

# NC.0 continuation — finite-cover effacement and curve cohomology

Agent: ChatGPT Pro — gpt6astra-20261002-c84f2a. Date: 2 October 2026.
Refs #1020. Winning claim 5953988275; bot confirmation 5953992816.

This is a source-proof checkpoint, not completion of the blueprint. The
canonical packet, reader and suggested file have not been changed in this
continuation. Their 37 nodes, 52 API items, 31 test contracts, 11 planets,
49 baseline records, nine gaps and eleven requests remain the inherited
counts. The candidate refinements below are not included in those counts.
No self-review, implementation or full-source audit is claimed.

## 1. Exact scope and the existing objects

Use the reserved node
`AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1`, not a second
K(π,1) predicate. For the results here, X is connected and noetherian, x is a
geometric point and π is its full profinite finite-étale fundamental group.
Let P be a set of primes. Allowed coefficients are finite locally constant
abelian étale sheaves with stalk orders supported on P. All primes gives the
full predicate; a singleton gives the corresponding primary predicate. No
invertibility condition is needed for the criterion itself.

This coefficient class is preserved by pullback, finite-étale direct image,
subquotients and extensions. That stability is used, not incidental. The
reserved definition allows other coefficient classes, but the finite-cover
invariance theorem below is not asserted for a class lacking these closure
properties. The group π is not replaced by a maximal pro-p quotient.

Write L(M) for the sheaf associated to a finite continuous π-module M and
ε^q_M for the canonical comparison H^q_cont(π,M) → H^q_et(X,L(M)). All
compatibility assertions concern ε, not an unspecified group isomorphism.

## 2. Cohomological proof of the finite-cover criterion

The following proof replaces the raw-homotopy detour in the existing
`NC.0/finite-cover-effacement` node. It does not close the separate
`NC.0/raw-homotopy-comparison` node.

### 2.1 A continuous group-cohomology class dies on an open subgroup

Let π be profinite and M a finite discrete continuous π-module. A continuous
inhomogeneous q-cochain π^q → M factors through (π/N)^q for some open normal
N acting trivially on M. Indeed, finite-valued continuity gives a finite
cover of the compact source by products of open cosets on which the cochain
is constant. Intersect their open normal subgroups and the kernel of the
finite action. The resulting quotient partition refines every chosen box.

A cocycle therefore descends to a cocycle on the finite group π/N. On
restriction to N its class factors through the cohomology of the trivial
group with trivial coefficients. That cohomology is zero in positive degree.
Consequently each positive-degree class dies on some open normal subgroup.
No common subgroup for all classes or all degrees is claimed.

The proof uses the ordinary continuous n-variable cochain model. Comparing
that model with the pinned nested homogeneous `continuousCohomology` is a
real supplier obligation. It cannot be removed merely by citing the name of
the existing cohomology type.

### 2.2 Transfer the killing problem to any finite cover

Suppose every positive-degree class on X, with every allowed locally
constant coefficient, can be killed by a finite étale surjective cover.
Let f:Y → X be finite étale, F an allowed coefficient on Y and
α ∈ H^q(Y,F). The sheaf f_*F is again finite locally constant. Its stalk at
x is a product over the geometric sheets; the monodromy permutes the sheets
and acts on their fibres. It is not generally the constant product sheaf.

Finite-étale direct image is exact: étale locally the cover is a finite
disjoint union of copies of the base and direct image is a finite product.
Thus its higher derived functors vanish, giving the canonical map
μ_f:H^q(X,f_*F) → H^q(Y,F) as an isomorphism. Take α' = μ_f^{-1}(α), and
choose g:X' → X finite étale surjective killing α'. In the pullback square
Y'=Y×_X X', with f':Y' → X' and g':Y' → Y, the equality required is

    g'^* μ_f(α') = μ_f'(bc(g^*α')),

where bc:g^*f_*F ≅ f'_*g'^*F is the actual finite-étale base-change map.
This equality follows by composing the base-change isomorphism with the
adjunction counit; the triangle identities identify the composite with the
cohomological pullback. Its right side is zero. Hence g' kills α.

There is no trace divided by deg(f), no Galois assumption on f, and no
assumption that the coefficient characteristic avoids deg(f). This is the
key nonnormal-cover and bad-degree interface for formalisation.

### 2.3 Vanishing of higher direct image to the finite-étale topos

Let ρ:X_et → X_fet be the canonical morphism. On the finite-étale site,
R^qρ_*F is the sheaf associated to

    (Y → X) ↦ H^q_et(Y,F|Y).

Therefore its vanishing for q>0 is precisely finite-cover effacement at all
objects of the finite-étale site. The preceding step obtains that property
from the killing condition on X. If an object is disconnected, treat its
finitely many connected components and take the disjoint union of their
covers. A nonempty finite étale cover of a connected component is surjective;
connectedness of X alone must not be substituted for connectedness of that
particular object.

For a finite module M, the unit identifies M with ρ_*ρ^*M. The higher direct
images vanish by the preceding argument. Leray then identifies the edge map
with ε^q_M and proves it is an isomorphism in every degree. Conversely, the
K(π,1) comparison and 2.1 kill every positive-degree class; naturality of ε
identifies group restriction with pullback to the corresponding cover.

This proves the cohomological finite-cover criterion on connected noetherian
schemes without using a raw étale homotopy type, Artin–Mazur's Whitehead
criterion, or a geometric-unibranch assumption. The existing narrower
geometrically-unibranch-variety statement is an immediate specialization.
The required site/cohomology comparisons remain imported mathematical inputs,
not newly certified Lean facts.

### 2.4 Finite-étale invariance and constant-coefficient form

If f:Y → X is finite étale surjective, the primary or full K(π,1) property
ascends by 2.2. It descends because a class on X can first be pulled back to
Y and then killed by a cover of Y; the composite is finite étale surjective.
For disconnected Y, use the componentwise convention in 2.3.

Equivalently, it is enough to test constant finite coefficients in degrees
q≥2 on every connected finite étale cover Y of X. To recover arbitrary
locally constant coefficients, first trivialize them on a finite cover.
Degree one requires no asphericity input: the torsor representing a class is
finite étale and its pullback along itself has the diagonal section, which
kills the class. Degree zero is the ordinary invariants/sections comparison.

Testing constant F_p only on X is not the criterion asserted here. Two valid
forms are: constant coefficients on every finite cover; or all finite locally
constant F_p-vector sheaves on X, for every prime p under consideration.

### 2.5 Devissage is a two-cover argument

For an exact sequence 0 → F' → F → F'' → 0 and a positive-degree class α
with coefficients F, first kill its image in F'' on a finite cover. Exactness
then lifts the pulled-back class to cohomology with coefficients F'. Kill
that lift on a second finite cover. The composite kills α. Both assumptions
must hold after finite base change. A finite filtration by primary-power
layers and then F_p-vector sheaves proves the stated reduction of coefficients.
There is no assumption that an arbitrary finite π-module has a filtration
by trivial one-dimensional π-modules.

## 3. Completing the characteristic-zero smooth-curve proof route

The existing `NC.0/smooth-curve` cites Schmidt's Proposition 15 but leaves its
proof unacquired. That passage has now been located. The following
cohomological reconstruction also makes the degree calculation explicit.

First take an algebraically closed field k of characteristic zero and a
connected smooth curve C that is affine, or proper of genus at least one.
The same alternative holds for every connected finite étale cover Y of C:
affineness is preserved by a finite map, and in the proper case Riemann–Hurwitz
gives g(Y)=1+deg(Y/C)(g(C)−1)≥1.

For an affine Y, the curve cohomological-dimension theorem gives
H^q(Y,F_ell)=0 for q≥2. This is an étale curve-cohomology input, not coherent
Serre vanishing and not a conclusion inferred from K(π,1).

For a proper Y of genus h≥1, the curve Picard/Kummer calculation gives
H^1(Y,μ_ell)=Pic^0(Y)[ell], a group of order ell^(2h), and
H^2(Y,μ_ell)=Z/ell, with higher cohomology zero. Choose a primitive ell-th
root in k to identify μ_ell with the constant additive F_ell sheaf. There is
a nonzero H^1 class. The finite-étale torsor interpretation makes it a
nonzero character π_1(Y) → F_ell, hence a surjection. Its torsor
h:Z → Y is connected and has degree ell. This uses the general degree-one
torsor dictionary, not the K(π,1) theorem being proved.

The degree-two pullback is multiplication by deg(h). One can see this without
introducing a separate trace formalism: in the Kummer exact sequence the
identification of H^2(Y,μ_n) with Z/n is induced by degree on Pic(Y)/n.
Pullback of line bundles multiplies degree by deg(h). Naturality of Kummer
therefore gives

    deg_n(h^*α) = deg(h) deg_n(α).

For n=ell and deg(h)=ell, the pullback kills every degree-two class. The new
curve again has positive genus, so repeated connected ell-covers can also
kill the Z/ell^a degree class if that version is required. Retain μ_n until
a root-of-unity choice is made; a canonical constant-coefficient identification
is not asserted.

This proves the constant-coefficient effacement test on every finite cover.
Sections 2.4–2.5 give the full property, including nontrivial finite monodromy.
For a geometrically connected smooth curve over an arbitrary characteristic-zero
field, pass to a separable closure and descend the finite cover, its finite
coefficient data and the equality killing the class to a finite extension.
Finite presentation and étale-cohomology continuity provide this descent;
finite-étale invariance handles the finite extension. Conversely the same
finite-stage argument ascends the property. This is the separable-algebraic
base-extension case, not an assertion of arbitrary nonproper base-change
invariance without its proof.

Tests for this decomposition:

- P^1 over an algebraically closed field fails in degree two, since its finite
  connected covers are trivial and H^2(P^1,μ_ell)=Z/ell is nonzero.
- For an elliptic curve E, [ell]:E → E has degree ell^2 and kills its
  H^2(−,μ_ell). Nonzero degree-two cohomology is compatible with K(π,1).
- A cover of degree prime to ell acts invertibly on H^2(−,μ_ell), so cannot
  serve as the killing cover for a nonzero degree class.
- Genus zero proper curves and affine curves must not be conflated; the
  cohomological-dimension input is used only for the affine alternative.

## 4. Explicit rejection of a maximal-pro-p substitution

This is a group-level test. No scheme with fundamental group S_3 is constructed
or assumed by this checkpoint.

Write G=S_3=C_3⋊C_2 as pairs (a,e), where a∈{0,1,2} and e∈{0,1}, with

    (a,e)(b,f)=(a+(-1)^e b mod 3, e+f mod 2).

Put χ(a,e)=(-1)^e. The function α(a,e)=a mod 3 is a 1-cocycle with sign
coefficients. If A(a,e) is its integer lift in {0,1,2}, set

    β(g,h)=(A(g)+χ(g)A(h)−A(gh))/3 mod 3.

The numerator is divisible by 3. Applying the sign-coefficient differential
twice shows that β is a 2-cocycle with sign coefficients. Their cup product
has trivial coefficients because sign tensor sign is trivial:

    c(g,h,k)=α(g)χ(g)β(h,k) mod 3.

It is a normalized 3-cocycle with constant F_3 coefficients. This follows
either by expanding its differential with the two displayed cocycle identities,
or by the cochain cup-product identity.

Let r=(1,0). In the normalized bar complex with F_3 coefficients,

    z=[r|r|r]+[r|r^2|r]

is a cycle. The two boundaries are respectively
−[r^2|r]+[r|r^2] and [r^2|r]−[r|r^2]. Direct evaluation gives
c(r,r,r)=0 and c(r,r^2,r)=1, so c(z)=1. Every coboundary pairs to zero
with z; therefore [c] is nonzero in H^3(S_3,F_3).

On the other hand, every homomorphism from S_3 to a finite 3-group kills the
involution s. The relation srs^{-1}=r^{-1} then gives r=r^{-1}; combined
with r^3=1 this kills r too. The maximal pro-3 quotient is thus trivial.
Its degree-three F_3 cohomology is zero, so inflation from that quotient
cannot recover [c]. Even constant p-torsion coefficients do not justify
silently replacing the full group by its maximal pro-p quotient.

## 5. A nonnormal finite-cover coefficient test

Take the nonnormal transposition subgroup H=C_2 in S_3 and the trivial
H-module F_2. Coinduction is the permutation module F_2[G/H] (equivalently
functions on the three left cosets, with the usual action). Its degree-zero,
one and two cohomology dimensions are (1,1,1). For the constant rank-three
S_3-module F_2^3 the corresponding dimensions are (3,3,3).

This rejects replacing f_* of a constant sheaf on a three-sheeted cover by
a constant rank-three sheaf downstairs. Its stalk rank alone does not
specify its monodromy. The comparison map used in the regression is not an
arbitrary vector-space bijection: it is restriction to H followed by
evaluation at the identity coset, the cochain map in Shapiro's lemma.
The index-two subgroup C_3 with F_2 coefficients supplies a separate test
where the coefficient characteristic divides the covering degree.

## 6. Exact integration targets and owners

All entries here are proposed refinements, not registered nodes or claims of
closed requests. Preserve the existing reserved ID and every retained node ID.

1. Refine `NC.0/finite-cover-effacement` using 2.1–2.4. Its cohomological proof
   no longer needs the raw-homotopy comparison. Retain its current narrower
   signature until the noetherian generalization is explicitly incorporated.
2. Add an NC.0 assembly lemma for transporting effacement through finite-étale
   direct image, with the displayed μ/base-change/counit square as acceptance.
   The generic exact f_*, base-change and derived comparison belong to SF.2.
3. Add the finite-étale ascent/descent theorem in 2.4 for the full and
   prime-supported coefficient classes. This is not a new definition.
4. Add the extension/devissage assembly lemma of 2.5, keeping both covers and
   the intermediate lifted class visible. Generic long exact sequences remain
   SF.2 inputs.
5. Refine `NC.0/smooth-curve`: split the connected prime-degree cover step,
   the degree-two killing step and the separable-closure descent step. Import
   curve cohomology and Picard-degree calculations through SF.2/SF.3 and the
   existing JacobianChallenge/AlgebraicCurves owners; do not rebuild Jacobians.
6. Give the reserved definition's pro-p warning the explicit test in section 4.
   A native finite-group cocycle/cycle example must use the existing group
   cochain complex. If it becomes a reusable general group-cohomology theorem,
   route its ownership to that supplier and import it here as a test.
7. Keep `NC.0/raw-homotopy-comparison` separate. Artin–Mazur's detection and
   profiniteness theorems and the raw pro-space carriers remain its actual
   gaps. The direct cohomological argument does not prove those statements.

The freshly read supplier descriptions support these boundaries: IG.0 owns
finite covers, fibre functors and profinite-group classification; IG.1 owns
arithmetic fundamental-group comparisons; SF.2 owns sites, cohomology,
base change and integration of duality suppliers; SF.3 integrates curve,
Picard and Jacobian theory. No reverse dependency from these generic suppliers
to the K(π,1) assembly is needed. Their descriptions are specifications, not
proofs that each detailed interface is already built.

## 7. Sources and verification boundary for this continuation

Fresh primary reading, separate from every preceding worker's receipt:

- Piotr Achinger, *K(π,1)-neighborhoods and comparison theorems*,
  arXiv:1407.0337v1: §§2.1–2.6 and §§3.1–3.4, including the proof of
  Proposition 3.4(a–b) and the separable-extension paragraph of (c).
  https://arxiv.org/html/1407.0337v1 and https://arxiv.org/pdf/1407.0337.
  The proposition is numbered 3.4 in this preprint; Achinger's 2017 paper
  cites the published numbering 3.2. These are not interchangeable locators.
  HTML and parsed PDF text were read; attempts to render the relevant PDF
  pages failed. No published-version collation or downloaded-byte hash is
  claimed. A regenerated document date is not a new arXiv version.
- Achinger, *Wild ramification and K(π,1) spaces*, Inventiones 210 (2017),
  453–499: version-of-record HTML, §4 Definition 4.1, Proposition 4.2,
  Lemma 4.3, Proposition 4.4, Example 4.5 and §7.5.
  https://link.springer.com/article/10.1007/s00222-017-0733-5.
  This supports the all-prime convention, coefficient devissage, degree-one
  torsor argument and separation from pro-ell completion. Its wild-Bertini
  and affine-asphericity proofs are outside the fresh reading scope.
- Alexander Schmidt, *Extensions with restricted ramification and duality
  for arithmetic schemes*, Compositio 100 (1996), 233–245: selected §3,
  Proposition 13 and Proposition 15 with the surrounding proof, pp. 242–244.
  https://www.numdam.org/article/CM_1996__100_2_233_0.pdf.
  Rendered pages 242 and 243 were inspected. Page 244 was read as parsed text;
  its diagram did not render successfully, so it is not visually certified.
  Section 3 above reconstructs the needed degree calculation through Kummer
  and Picard degree instead of claiming a checked reading of that diagram.
- The Stacks Project, tag 03RQ, Lemma 59.69.1: the canonical Picard/Kummer
  description of cohomology of a smooth projective curve with invertible
  torsion. https://stacks.math.columbia.edu/tag/03RQ.
  Its referenced Picard, Kummer and Brauer inputs are still supplier proof
  leaves, not freshly completed by reading this statement.

No new published-source error is alleged. In particular, the more explicit
curve proof and the S_3 example are additions to this plan, not assertions
that the cited theorems are false.

Two native statements were freshly inspected at the actual Mathlib pin
082e2d37e8b0463410cdb532e111cd43d5a66174:

- `groupCohomology.coindIso`, in
  `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean`:
  H^n(G,Coind_H^G A) ≅ H^n(H,A), for a representation of a subgroup of an
  ordinary group. This is the discrete Shapiro theorem. Its statement does
  not supply continuous Shapiro for open subgroups of a profinite group.
- `continuousCohomology`, in
  `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`:
  homology of the nested homogeneous continuous cochain complex. Its existence
  alone does not provide comparison with the usual n-variable model, discrete
  Shapiro, or the derived finite-étale-topos comparison used here.

The accepted AUDIT-08 report and its updated NC.0 entry were read. The updated
entry recognizes the geometric-point fibre functor on étale schemes over an
arbitrary scheme; do not revive the obsolete assertion that nothing non-affine
exists. The missing join to finite-cover Galois categories and canonical
cohomology comparisons is different. The seven NC stage descriptions and
seventeen touching atlas edges were read. The generic IG and SF supplier
stage descriptions were also inspected. This was not a new whole-catalogue
or all-49-baseline audit.

## 8. Executed finite regression

The Python/NumPy script below was executed with exact integer arithmetic
modulo 2 or 3; no floating-point ranks are used. It checks four S_3 subgroup
representatives (one from each conjugacy class), each at both primes.
It verifies 24 chain-map identities and 24 induced cohomology isomorphisms
in degrees 0–2, including nonnormal coefficients. Separately it checks the
216 sign-valued 2-cocycle identities and 1,296 constant-valued 3-cocycle
identities, the bar-cycle pairing 1, and that the computed H^3(S_3,F_3)
has dimension one. The nonzero-class proof in section 4 does not require
trusting the dimension calculation.

Observed dimensions (order of H, index, prime; H^0,H^1,H^2):

    (1,6,2): (1,0,0)       (1,6,3): (1,0,0)
    (2,3,2): (1,1,1)       (2,3,3): (1,0,0)
    (3,2,2): (1,0,0)       (3,2,3): (1,1,1)
    (6,1,2): (1,1,1)       (6,1,3): (1,0,0)

The constant rank-three F_2 module gives (3,3,3), as required by the
counterexample in section 5. These are finite regression results, not a
proof of the geometric comparison or a Lean elaboration receipt.

Save the following as `check_nc0.py` and run `python3 check_nc0.py` with NumPy:

```python
from itertools import product
import json
import numpy as np

G = list(product(range(3), range(2)))
one = (0, 0)
def mul(g, h):
    a, e = g; b, f = h
    return ((a + (-1)**e * b) % 3, (e + f) % 2)

def rref(A, p):
    A = np.asarray(A, dtype=np.int64).copy() % p
    row = 0; pivots = []
    for col in range(A.shape[1]):
        idx = np.flatnonzero(A[row:, col])
        if len(idx) == 0:
            continue
        j = row + int(idx[0]); A[[row,j]] = A[[j,row]]
        A[row] = A[row] * pow(int(A[row,col]), -1, p) % p
        for j in range(A.shape[0]):
            if j != row and A[j,col]:
                A[j] = (A[j] - A[j,col] * A[row]) % p
        pivots.append(col); row += 1
        if row == A.shape[0]:
            break
    return A, pivots

def rank(A, p):
    return len(rref(A,p)[1])

def null(A, p):
    R, pivots = rref(A,p)
    free = [i for i in range(A.shape[1]) if i not in pivots]
    Z = np.zeros((A.shape[1],len(free)), dtype=np.int64)
    for j, f in enumerate(free):
        Z[f,j] = 1
        for i, c in enumerate(pivots):
            Z[c,j] = -R[i,f] % p
    assert not np.any((A @ Z) % p)
    return Z

def words(K,q):
    return list(product([g for g in K if g != one], repeat=q))

def differential(K, action, q):
    d = action[one].shape[0]
    inp = words(K,q); out = words(K,q+1)
    pos = {w:i for i,w in enumerate(inp)}
    D = np.zeros((len(out)*d,len(inp)*d),dtype=np.int64)
    I = np.eye(d,dtype=np.int64)
    for j,w in enumerate(out):
        terms = [(w[1:],action[w[0]])]
        for i in range(1,q+1):
            merged = w[:i-1] + (mul(w[i-1],w[i]),) + w[i+1:]
            terms.append((merged,(-1)**i * I))
        terms.append((w[:-1],(-1)**(q+1)*I))
        for v,A in terms:
            if v in pos:
                k = pos[v]; D[j*d:(j+1)*d,k*d:(k+1)*d] += A
    return D

def perm_action(H):
    cosets = []
    for g in G:
        c = frozenset(mul(g,h) for h in H)
        if c not in cosets:
            cosets.append(c)
    action = {}
    for g in G:
        A = np.zeros((len(cosets),len(cosets)),dtype=np.int64)
        for j,c in enumerate(cosets):
            i = cosets.index(frozenset(mul(g,h) for h in c)); A[i,j] = 1
        action[g] = A
    for g,h in product(G,repeat=2):
        assert np.array_equal(action[mul(g,h)],action[g]@action[h])
    return cosets, action

def evaluate(H,cosets,q):
    inp = words(G,q); out = words(H,q); pos = {w:i for i,w in enumerate(inp)}
    E = np.zeros((len(out),len(inp)*len(cosets)),dtype=np.int64)
    k = cosets.index(frozenset(H))
    for i,w in enumerate(out):
        E[i,pos[w]*len(cosets)+k] = 1
    return E

subgroups = [[one], [one,(0,1)], [one,(1,0),(2,0)], G]
records=[]; chain_checks=0; cohom_checks=0
for H in subgroups:
    cosets, action = perm_action(H)
    trivial_H = {h:np.ones((1,1),dtype=np.int64) for h in H}
    DG = [differential(G,action,q) for q in range(3)]
    DH = [differential(H,trivial_H,q) for q in range(3)]
    E = [evaluate(H,cosets,q) for q in range(4)]
    for p in (2,3):
        for q in range(2):
            assert not np.any((DG[q+1]@DG[q])%p)
            assert not np.any((DH[q+1]@DH[q])%p)
        dims=[]
        for q in range(3):
            assert not np.any((E[q+1]@DG[q]-DH[q]@E[q])%p)
            chain_checks += 1
            ZG = null(DG[q],p); ZH = null(DH[q],p)
            BG = DG[q-1] if q else np.zeros((ZG.shape[0],0),dtype=np.int64)
            BH = DH[q-1] if q else np.zeros((ZH.shape[0],0),dtype=np.int64)
            hG = ZG.shape[1]-rank(BG,p); hH = ZH.shape[1]-rank(BH,p)
            assert hG == hH
            assert rank(np.concatenate((BH,E[q]@ZG),axis=1),p) == ZH.shape[1]
            dims.append(hG); cohom_checks += 1
        records.append({'order_H':len(H),'index':len(cosets),'p':p,'H0_H1_H2':dims})

def alpha(g): return g[0]
def sign(g): return (-1)**g[1]
def beta(g,h):
    v = alpha(g)+sign(g)*alpha(h)-alpha(mul(g,h))
    assert v%3 == 0
    return v//3 % 3

def c(g,h,k): return alpha(g)*sign(g)*beta(h,k)%3
for g,h,k in product(G,repeat=3):
    assert (sign(g)*beta(h,k)-beta(mul(g,h),k)+beta(g,mul(h,k))-beta(g,h))%3 == 0
for g,h,k,l in product(G,repeat=4):
    assert (c(h,k,l)-c(mul(g,h),k,l)+c(g,mul(h,k),l)-c(g,h,mul(k,l))+c(g,h,k))%3 == 0
r=(1,0); r2=(2,0)
z={(r,r,r):1,(r,r2,r):1}
boundary={}
for (g,h,k),a in z.items():
    for pair,s in [((h,k),1),((mul(g,h),k),-1),((g,mul(h,k)),1),((g,h),-1)]:
        if one not in pair:
            boundary[pair]=(boundary.get(pair,0)+a*s)%3
assert all(v==0 for v in boundary.values())
pairing=sum(a*c(*w) for w,a in z.items())%3
assert pairing==1
trivial_G={g:np.ones((1,1),dtype=np.int64) for g in G}
D2=differential(G,trivial_G,2); D3=differential(G,trivial_G,3)
cv=np.array([c(*w) for w in words(G,3)],dtype=np.int64)
assert not np.any((D3@cv)%3)
assert rank(np.column_stack((D2,cv)),3)==rank(D2,3)+1
h3=D3.shape[1]-rank(D3,3)-rank(D2,3)
assert h3==1
const3={g:np.eye(3,dtype=np.int64) for g in G}
DC=[differential(G,const3,q) for q in range(3)]
const_dims=[DC[q].shape[1]-rank(DC[q],2)-(rank(DC[q-1],2) if q else 0) for q in range(3)]
assert const_dims==[3,3,3]
print(json.dumps({'shapiro_cases':records,'chain_map_equalities':chain_checks,
    'cohomology_isomorphism_checks':cohom_checks,'beta_identities':6**3,
    'three_cocycle_identities':6**4,'cycle_pairing_mod3':pairing,
    'H3_S3_F3_dimension':h3,'constant_rank_three_F2_H0_H1_H2':const_dims},indent=2))
```

## 9. Remaining work and submission boundary

Integrate the proof-sized refinements into the canonical packet and reader,
and give their API/test names native suggested signatures when the actual
geometric types are available. The two fresh baseline inspections above are
not yet additional canonical baseline records. The raw homotopy, site,
continuous-cochain and curve-cohomology supplier proofs remain genuine inputs;
no arbitrary predicate fields have been introduced to stand in for them.
The other NC stages, Chen/BDMTV source obligations, NS ownership and general
height supplier requirements are unchanged.

Lean was not compiled. The available machine reported about 3 GB free, below
the worker rule's 20 GB threshold, and no existing combined pinned build was
available. No Lake project, library build, cache retrieval or language server
was started. The local standard blueprint checker was not run; this branch
changes only the allowed handoff, and submission CI must check that change.
The finite Python regression ran successfully. Source pages were read through
web tools; no downloaded-byte hashes for the newly read papers are claimed.
This checkpoint is a reproducible mathematical handoff, not a closed roadmap.
