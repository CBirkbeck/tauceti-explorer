# DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII — current quadratic basis checkpoint

Codex — codex-5ebb6f; 2 October2026; Refs #3378. Confirmed claim5958170336 following comment5958167836. Base b9239798babb94f290b4302764f457bacfe87d36, after merged PR#5816. This receipt supersedes only the preceding vector-space Basis/coordinate omission. All earlier source readings, certificates and unresolved obligations keep their attribution below.

## Result and exact scope

The existing quadratic-pinch-generation statement now has its promised actual native k-vector-space Basis and exact coefficient/degree interface. Five nodes are added: coordinateMap, its bijectivity, the canonical native LinearEquiv, transported native Module.Basis, and its coefficient representation theorem. q=t²+at+b over any field; A_q is the existing scalar-preimage Subalgebra in k[t]. The forward function is(P,Q)↦P(q)+tqQ(q). It is built by native aeval into A_q and multiplication by its actual member tq. Membership does not use the generation theorem, so the newly sharpened generation prerequisites do not create a cycle.

Existence uses the inherited pinch_spanning API; uniqueness uses the actual quadratic degree and pinch-normal-form injectivity. Native LinearEquiv.ofBijective supplies the inverse, including the iff between an ambient normal-form equation and the assigned pair. Transport Polynomial.basisMonomials.prod through that equivalence. With indexℕ⊕ℕ the vectors are q^n and tq^(n+1), with degrees2n and2(n+1)+1. Left index0 is1. The actual Finsupp basis representation has coefficients coeff_n(P) and coeff_n(Q), and its linearCombination reconstructs f in the actual subalgebra.

No separability, irreducibility, perfectness or characteristic assumption is used. This is a k-linear equivalence, not a product AlgEquiv: at q=t² the second unit gives t³, whose square is t⁶ rather than t³. A basis vector can have a nonzero t coefficient: over F₂, q=t²+t+1 has coefficient1 at t. Absence of a degree1 basis vector is a statement about whole polynomial degrees. The nine distinct typed examples include those two failed strengthenings, arbitrary zero input, characteristic-two generator values, the first-coordinate evaluation distinction t↦q, repeated-root round trips, all cusp exponents, index0/zero coordinates and the absence of degree1 across the whole basis family.

Current inventory:163 nodes(13 definitions,5 constructions,114 lemmas,26 theorems,5 comparisons),72 APIs,70 definition/construction test entries(9 distinct new examples, one shared between two constructions),110 baseline declarations,29 planets,17 gap groups,23 requests and7 partial stages. All158 inherited node statements,157 whole node objects, all prior APIs/tests,78 route records and21 source findings are preserved. Only quadratic-pinch-generation has its proof/prerequisites sharpened. All statuses are unchecked. No new planet, general polynomial/basis carrier, foundational supplier or geometric model is claimed.

## Source and owner reading

Fresh [Schröer v3 HTML](https://arxiv.org/html/2004.07025v3): §3 conductor paragraphs for one/two components and the complete displayed Prop3.1–3.2 proofs. Fresh HTML SHA256 d14049912dcab6a438ed62363e246d0087c61342c51813ac482f5aba48d92456. These helpers are derived affine coordinate adapters, not printed source lemmas and not a global curve comparison. Fresh [Stacks0ECH](https://stacks.math.columbia.edu/tag/0ECH): scheme-existence scope, Situation37.67.1 hypotheses and Prop37.67.3 with its proof; the affine-neighborhood condition remains essential. No fresh PDF visual inspection, full-paper collation or rerun of historical finite model scripts is claimed. All21 inherited source findings remain unchanged; no new source error is alleged.

Read reviewed AUDIT01/10 parent R11.1–6 and SF.0 rows before planning; PartII has no dedicated reviewed row. The selected accepted RS25 parent/supplier owner records and reserved Ferrand/owner entries are preserved. General relative Spec/Proj, cohomology and normalization stay with their suppliers. No whole-library absence claim follows from this screen. The12 additional exact pinned baseline statements import generic monomial/product/transported bases, finite-support reconstruction, algebra evaluation, bijective linear equivalences and polynomial-power degree. Their complete declarations and ambient hypotheses were read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174. Historical TauCeti/roadmap full-reading receipts retain their provenance.

## Proof prototype versus submitted signatures

[Immutable actual proof source](https://github.com/CBirkbeck/tauceti-explorer/blob/8337fdebca30e16ce95570df80f9680e05659f32/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean), commit `8337fdebca30e16ce95570df80f9680e05659f32`. It contains the actual bodies of all14 new named declarations and9 examples. The exact extraction and its14 axiom prints compiled together at the pinned existing Mathlib build:0 errors,0 warnings,13 examples(9 new,4 inherited),3.01 seconds,3,333,480KiB maximum RSS,69GB available before compilation. All14 new declaration axiom lists contain only propext, Classical.choice and Quot.sound, with no admitted axiom. No library build, cache, dependency update or language server was started.

The submitted suggested file admits every new body under PROTOCOL§13:14 named declarations and9 examples, with byte-identical signatures to the public proof snapshot. It preserves the existing native proof bodies outside this block. The exact final Mathlib-only extraction(companion native Subring namespace plus final QuadraticPinch namespace through finite_normalization) compiled:29 examples,0 errors,29 admission warnings(6 inherited plus23 new),0 other warnings,3.10 seconds,3,348,892KiB maximum RSS,68GB available. **The full combined TauCeti-importing suggested file was not compiled**; the required exact TauCeti artifacts are unavailable. That scope remains open and is not certified by a narrow Mathlib extraction.

SHA256 receipts:

- Public full proof source: `be50fcb22ae6401fb49cbc293095732925344d37d1b8ec88734a13ac492d35cc`.
- Proof extraction: `3bbca723269cbdf9c01f1e5633191990822ae9c26aafa702a2dec413a2de97dd`.
- Proof extraction with14 axiom prints: `7aa26bde4cf922775057e8aa93c8cf7193f6143ba0ffca66f2e4b003cb4d3d5c`.
- Proof/axiom log: `00916d4227af6c6236fc5d5f88d15f133cdccd6e85b982c83374876bcf47ee4f`.
- Submitted full source: `5cc2d7e77719c9fc4c20110500de6a81f3284fdcd4a07b25ba65c853ed458c9a`.
- Submitted native extraction: `6883a0f9dc413603782679844a89cdebea30460a8eccc15ac9aed0d2ad9bbd60`.
- Submitted extraction log: `29154ecd8cc9016cb827f9ade911607ab75993976d235c462c5011ca41b5eed6`.

The source/artifact hashes, memory/timing data, scope and graph receipt are also in quadraticBasisContinuation in the packet. Compiler log hashes describe this run; absolute invocation names and timing vary on reproduction. Source reconstruction below was checked byte-for-byte against the public immutable commit before scratch cleanup.

## Validation and next work

Indexed blueprint checker:0 errors,0 warnings. Actual atlas assembler with the current roadmap and packet:2,992 stage vertices plus51 existing virtual endpoints,8,727 stage edges; the packet has163 nodes/422 internal prerequisite edges. The combined graph has3,177 vertices/9,298 edges. All three graphs are acyclic;55 supplied stage pairs are reachable; no unresolved prerequisite, pending link or skipped integration edge. Stage requires and the general Ferrand key-definition statement are unchanged. Intake path/JSON checks, inherited-object preservation, packet/reader/signature parity,23 admitted-body checks and whitespace checks pass.

Resume with the actual bivariate presentation: transport k[U,V] to polynomials in V over k[U], divide by the monic quadratic relation, prove the remainder normal form and identify the actual full kernel/range and quotient AlgEquiv. The current coefficients certify only the specialized affine normal-form calculation. Finite normalization/localization/common fraction field, a k[q]-module freeness interface, projective P¹ chart comparisons, node/branch/completion and H0/H1/base-change interfaces remain separate. The earlier projective receipts below provide candidate coordinate calculations, not already registered native declarations. All17 gap groups and23 supplier requests remain; broader DVR/wild-fiber, rational-surface and model-completeness/source closure remains necessary.

## Reproduce the immutable proof extraction

Obtain the suggested file from the exact public commit above as ProofSuggested.lean, then run this Python3 program. Run the resulting ProofAudit.lean from the root of an already existing build at the exact Mathlib pin with `lake env lean`; do not set up or download a build for this checkpoint. A fresh WORKERS memory check still applies.

```python
from pathlib import Path
import re
s = Path('ProofSuggested.lean').read_text()
head = '\n'.join(x for x in s.splitlines()
    if x.startswith('import Mathlib.') or x.startswith('import Lean.'))
head += '\nopen scoped Polynomial\nuniverse u\nnoncomputable section\n'
body = s[s.index('namespace TauCeti.GenusOne.QuadraticPinch'):
         s.index('-- test: QuadraticPinch.test_split')]
native = head + body + '\nend TauCeti.GenusOne.QuadraticPinch\n'
Path('ProofNative.lean').write_text(native)
block = s[s.index('-- Quadratic coordinate/basis continuation.'):
          s.index('-- test: QuadraticPinch.test_split')]
names = re.findall(r'^(?:def|lemma) (\w+)', block, re.M)
audit = native + '\n' + '\n'.join(
    '#print axioms TauCeti.GenusOne.QuadraticPinch.' + n for n in names) + '\n'
Path('ProofAudit.lean').write_text(audit)
```

For the submitted extraction, use the submitted source instead. Retain its Mathlib/Lean import lines, then the original open declarations/universe/noncomputable section, then the native Subring namespace before AffinePinching and the final QuadraticPinch namespace before the quadratic-point-proper-pushout marker; close the latter namespace. This exactly excludes the TauCeti imports and unverified geometry while retaining the unchanged native carriers, all29 extracted examples and their stated admissions.

---

## Historical handoff, preserved with original attribution

# Quadratic normal forms and native generation — current checkpoint

Codex — `codex-a71f92`. Refs #3378. 2 October2026.
Bot-confirmed claim5957071769 /5957074220; whole issue reread.
Immutable read base: `d0ee3b9e6c08178c5731865831db82b409306dbb`.

Partial checkpoint, not a completed blueprint or a formalisation. Four new
lemma nodes make the quadratic polynomial decomposition and parity/uniqueness
arguments declaration-sized. The existing algebra gains one actual polynomial
spanning API and three characteristic-two/degree-boundary tests. Its generation
adjoin equality and cusp test now have native proofs. All154 inherited IDs and
mathematical statements are preserved;151 inherited node objects are unchanged.
The three refined objects are algebra, generation and presentation.

Inventory:158 nodes (12 definitions,3 constructions,112 lemmas,26 theorems,
5 comparisons);61 API items,60 definition/construction unit tests,29 planets,
98 exact-pin baseline declarations,17 gap groups and23 requests. Seven partial
stages,78 routed items and21 source findings remain. Every implementation status
is unchecked. No planet or route changes.

## Mathematical advance and exact boundary

Write q=t²+at+b. Native polynomial induction gives h=P(q)+tQ(q).
The multiplication-by-t update is
(P,Q) ↦ ((t−b)Q,P−aQ), verified using t²=q−at−b.
The nonzero second summand has odd degree; P(q) has even natural degree.
This proves injectivity of (P,Q)↦P(q)+tQ(q). Applying it to (P,tQ)
and cancelling t proves injectivity of (P,Q)↦P(q)+tqQ(q).
These statements include characteristic2, repeated roots and inseparable
quadratics; no separability assumption is inserted.

For f=c+qh in the already owned A_q, this yields
f=(C(c)+tP)(q)+tqQ(q). Native aeval into the actual subalgebra
k[q,tq] proves inclusion, and native adjoin_le proves the reverse inclusion.
The cusp equality is the a=b=0 instance.

The existing generation statement also specifies a vector-space basis and all
its degrees. Its complete native Basis/coefficient interface remains omitted,
with the full mathematical proof outline preserved in the packet/reader.
The full presentation signature remains admitted: the new injectivity helper
certifies zero coordinates of a chosen remainder, not native bivariate division,
range/kernel equality or the canonical quotient isomorphism. Finite inclusion
is still admitted; fraction-field/normalization and all global geometric,
nodal, P¹/cohomological and finite-extension count exports remain open.
The final native omission ledger names these exact interfaces.

The reserved general Ferrand key node is unchanged. This is a coordinate
consumer refinement, not a new general polynomial/subalgebra/normalization
carrier. Existing supplier requests and all source findings are unchanged.

## Fresh evidence and provenance

Read the current WORKERS, PROTOCOL, expansion source-faithfulness rules and
UPSTREAM_GUIDE. The two previously read nearby upstream roadmaps remain the
style guides; no fresh rereading receipt is claimed. Read all154 current
mathematical statements and focused definition/API/native contracts.

Read the reviewed parent R11.1–R11.6 and SF.0 rows (AUDIT01/10 accepted reviews),
the reserved Ferrand entry, Schröer's routed brief and78 item IDs, current
atlas parent/SF.0 descriptions, and accepted RS-25 parent/supplier owner records.
Current atlas extracts and blueprint links contain no PartII stage-edge/link
entry. No atlas, supplier or audit file is changed.

Fresh parsed reading: Schröer v3 §3, printed pp9–11, its conductor squares and
displayed Proposition3.1–3.2 proofs; Stacks0ECH Situation37.67.1 and1–5 with
displayed proofs. PDF screenshot attempts failed; no fresh visual diagram audit,
whole-paper reading or full Ferrand reread is claimed. New normal-form statements
are derived coordinate adapters, not attributed as printed source lemmas.
Public receipts:
[Schröer v3](https://arxiv.org/pdf/2004.07025v3), SHA-256
`ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61`;
[Stacks0ECH](https://stacks.math.columbia.edu/tag/0ECH), SHA-256
`f463dad9e8b6d26c33a0648fe580b0353831006054091d44fb47009579b78c14`.
The nine newly cited baseline declarations' full statements and ambient
hypotheses were read at Mathlib082e2d3. The native AdjoinRoot power-basis
construction was inspected as a near-match: it concerns k[t]/(q), not the
composed-polynomial subalgebra or the pinching normal forms.

All preceding receipts remain attributed. In particular, the preserved
projective checkpoint below and its133,830 finite assertions were not rerun.
No new finite-model experiment is claimed; the three added tests are actual
native Lean examples, including a counterexample when q=t.

## Exact elaboration and proof-axiom audit

An existing Mathlib build at the exact082e2d37e8b0463410cdb532e111cd43d5a66174
pin was reused. No build/project/cache installation or Lean language server
was started. Available memory was71GB; one Lean process ran at a time.
Both commands exited0: extraction2.19s; axiom audit2.24s.
Twenty examples; zero errors; six warnings, all inherited admitted declarations.
Full combined-file compilation is false: required Tau Ceti artifacts are absent.

Extraction recipe from the published suggested file: retain all individual
Mathlib import lines, add Lean.Elab.Tactic.Omega, the same open statements,
universe and noncomputable section; append the actual Subring namespace through
its end before AffinePinching; append the final QuadraticPinch namespace
through finite_normalization, stopping before the proper-point-pushout marker;
close that namespace. Do not include earlier geometry, finite-F₂ or global
conductor blocks; do not replace any carrier/import with a mock. Only blank-line
normalization is immaterial to the excerpt-parity check.

SHA-256 receipts:
suggested `6dce27f48b79cf0fa8fabc69a65aaf76ebb1d97e94ff537504509434da61d274`;
extraction `d571654115830d41149a0c64de7d40ec45b7287113bc4af7397e1d33d802face`;
audit source `cb9eff36522333db28498fc8d47b7ac7ba6794c78bfe951944f94b87fce37844`;
normalized extraction log
`0a4f3a6420875c2fb54633cc0964905afc9063ef60fe3f1ef863f69372073712`;
normalized axiom log
`ebaa01f4877eb25f03fe31d3db34a7b9202da4fe23d043588e4bfd62f495e3a6`.

The six admitted declarations are the old Subring cusp/node tests, quadratic
split/F₄ tests, presentation and finite inclusion. The new/proved
exists_normal_form, normal_form_degrees, normal_form_injective,
pinch_normal_form_injective, pinch_spanning and generation declarations each
depend only on propext, Classical.choice and Quot.sound; no admitted axiom
dependency. The exact normalized audit log is preserved here:

```text
Audit.lean:87:0: warning: declaration uses `sorry`
Audit.lean:92:0: warning: declaration uses `sorry`
Audit.lean:293:0: warning: declaration uses `sorry`
Audit.lean:297:0: warning: declaration uses `sorry`
Audit.lean:460:6: warning: declaration uses `sorry`
Audit.lean:494:6: warning: declaration uses `sorry`
'TauCeti.GenusOne.QuadraticPinch.exists_normal_form' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normal_form_degrees' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normal_form_injective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.pinch_normal_form_injective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.pinch_spanning' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.generation' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Validation and continuation

Actual pinned-tree checker: zero errors and zero warnings. Actual intake path,
JSON and privacy checks passed. Exact native excerpt/API/test parity passed.
Both the original read base and publication-parent1197be4c4c5ee30267a64a8d85aef8ff67abff8f
passed actual atlas assembly:2992 stages,8727 edges, acyclic;158 declarations,
29 planets, no pending or skipped links. All55 expected supplier-stage edges
are present. The combined backward dependency graph reaches504 vertices and
is acyclic;411 own declaration edges. The whole predecessor handoff is preserved
byte-for-byte modulo its final newline; all154 mathematical statements survive.
All five target blobs were unchanged at the fresh publication parent; current
protocols, reviewed audit, atlas snapshot and checker/intake/build scripts were
also unchanged. Roadmap definition is untouched; only four deliverables change.
Keep every gap open. The next mathematical work should construct
the native Basis/representation interface and integrate the full existing
presentation argument using actual bivariate division and quotient maps.
Then integrate the preserved projective/cohomological proof into declaration-sized
nodes and exact supplier requests. Do not claim the projective surface/model
classification closed.

The earlier complete projective checkpoint and its reproduction program follow
unchanged. Its “current” language refers to that historical checkpoint, not to
a fresh execution by this worker.

---

# Quadratic pinching: projective models, branches and cohomology

Agent: ChatGPT — `gpt6astra-20261002-7d2f90`. Refs #3378.
2 October 2026. Claim comment 5956489621 was confirmed by bot comment
5956491897; the issue was reread after confirmation. Publication base:
`c340a191f4b28ee8c1b3eba4c8cdf0bcf1b6eb99`.

**Partial source-proof checkpoint, not a completed blueprint or a formalisation.**
This submission changes only this handoff. It advances the preceding affine
quadratic calculation to explicit projective schemes, their normalizations,
their conductor squares, their coherent cohomology, and their geometric
singularities. It also gives an explicit two-component model and the counts
over every finite extension of a finite field. The independent finite
regressions below executed 133,830 assertions.

The complete preceding proof and its reproduction program are preserved at
[the immutable publication base](https://github.com/CBirkbeck/tauceti-explorer/blob/c340a191f4b28ee8c1b3eba4c8cdf0bcf1b6eb99/research/blueprint/handoff/DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII.md).
In particular, that document supplies the full affine presentation-kernel
argument and the finite-module resolution, not merely a relation that
vanishes. This new receipt does not overwrite their mathematical content
in any canonical file.

The unchanged canonical inventory is inherited: 154 nodes, 60 API entries,
57 definition/construction tests, 29 planets, 89 baseline references, 17 gaps
and 23 requests; seven partial stages, 78 routed items and 21 source findings.
These are not fresh whole-packet counts or closure certificates. No existing
node ID, source finding, request, implementation status or planet is changed.
The integration targets in Section 9 are **not registered nodes**. Their
native scheme/cohomology signatures and the packet/reader/suggested-file
integration remain work, not claims made by this checkpoint.

## 1. Setting and the affine input

Let k be any field, a,b in k, and put

    q(t) = t^2 + a t + b,        E = k[t]/(q),
    Q(T,S) = T^2 + a T S + b S^2,
    B = k[t],                   A = k + qB.

No perfectness, characteristic-zero or separability assumption is imposed
until a statement explicitly says so. The embedded length-two scheme
D=Spec(E) lies in the usual affine chart of P1_k. The coordinate t is part
of these explicit formulas; an intrinsic coordinate-independence theorem
would be an additional comparison, not literal equality of these models.

For clarity, the needed affine input can be recovered as follows. With
u=q(t), the map

    k[U][T]/(T^2+aT+b-U) -> k[t],   U |-> q(t), T |-> t

is an isomorphism, with inverse t mapping to the class of T. The two
composites are checked on generators. Monic division gives the unique
k[U]-normal form f(u)+t g(u). Reduction modulo q shows that this belongs
to A exactly when g(0)=0, equivalently g(U)=U h(U). Thus, with v=tq(t),
A has the unique normal form f(u)+v h(u).

The evaluation map from k[U,V] has image A and kernel generated by

    F(U,V) = V^2 + a U V + b U^2 - U^3.                 (1)

Indeed divide an arbitrary polynomial by the monic-in-V polynomial F.
Its remainder f(U)+V g(U) evaluates to f(u)+t u g(u), which is zero only
when f=0 and Ug=0, hence g=0. This proves the entire kernel. B is finite
over A, generated by 1,t. Also A[1/u] -> B[1/q] is an isomorphism, with
inverse t=v/u. Their fraction fields agree: f(t)/g(t)=(qf)/(qg).
The polynomial PID B is integrally closed, so this finite inclusion makes
B the integral closure of A in k(t).

These are the predecessor's generation, presentation and normalization
inputs, restated to make the projective argument independently readable.
They do not replace the existing carriers by newly assumed structures.

## 2. The one-component projective model and its actual normalization

Let C1 be the closed subscheme of P2_k with homogeneous coordinates [U:V:W]
and equation

    V^2 W + a U V W + b U^2 W - U^3 = 0.               (2)

Define a morphism

    nu1 : P1_k -> C1,
    [T:S] |-> [Q(T,S) S : T Q(T,S) : S^3].             (3)

All three coordinates have degree three. They have no common zero: if
S is nonzero, the third coordinate is nonzero; if S=0, the second is T^3.
Equivalently their common vanishing locus in projective space is empty,
which is the scheme-level basepoint-free condition, not just a test on
k-rational points. Substitution in (2) gives

    Q^2 S^3 (T^2+aTS+bS^2-Q) = 0.

So the map lands in the specified closed subscheme.

Here is a two-open proof of the normalization assertion, including the
point at infinity. On W nonzero set u=U/W, v=V/W. This is Spec(A) by (1),
and its inverse image under nu1 is S nonzero, namely Spec(B), with exactly
the inclusion in Section 1. Thus this part of the map is finite.

For the other open, work on V nonzero and write

    x=U/V, z=W/V, h(x)=1+a x+b x^2.

The equation is z h(x)=x^3. On the additional open h(x) nonzero this gives

    k[x,z,1/h]/(zh-x^3) = k[x,1/h].                    (4)

Its inverse image is the chart T nonzero with s=S/T and h(s) invertible;
formula (3) reads x=s, z=s^3/h(s). Thus nu1 is an isomorphism there.
These two opens cover C1: W=0 in (2) forces U=0, so the only point outside
the first open is [0:1:0], and it lies in (4), with h(0)=1.

Finiteness follows on this cover. Both affine rings are domains and their
intersection is a nonempty open, so C1 is integral. The same argument
works after every field extension, since the monic normal-form proof did
not use separability: C1 is geometrically integral. The source P1 is
normal, nu1 is finite, and it identifies function fields. The affine
integral-closure comparison on the first open and the isomorphism (4)
therefore identify nu1 with the normalization, with its actual map, not
merely with some degree-one parametrization.

Let p=[0:0:1] and infinity=[0:1:0]. The complement isomorphism of Section 1,
together with (4), gives

    P1 minus D  ->  C1 minus {p}

as an isomorphism. The inverse on u nonzero is t=v/u. The scheme-theoretic
fiber above p is B/(u,v)B=B/qB=E. In particular this fiber can be nonreduced;
replacing it by its set of points loses information used below. The
infinity point is smooth: on V=1 the derivative with respect to z at
(x,z)=(0,0) is 1.

## 3. The conductor square and cohomology of C1

The conductor on the affine normalization is qB. Its contraction to A is
(u,v), not in general uA. Indeed A=k+qB, and if a constant-residue element
c+qh belongs to the conductor, multiplication by t must again have scalar
residue in E. Since 1,t is a k-basis of E, this forces c=0. Conversely
qB is visibly contained in the conductor. Off p the normalization is an
isomorphism, so these ideals glue with the unit ideal there. Consequently
D on P1 and the reduced rational point p on C1 are the actual conductor
subschemes, and the square

    D -------> P1
    |           |
    v           v
    Spec(k) --> C1                                             (5)

is cartesian and a geometric, categorical scheme pushout. To check this
last assertion, on the open W nonzero its ring is exactly B x_E k=A;
off p it is the identity square. These identifications agree on their
intersection. Apply the affine finite-pinching universal property and
glue the resulting morphisms; uniqueness on the same open cover gives
universality against arbitrary scheme targets. This imports the general
G.0 theorem, rather than silently identifying an affine-category pushout
with a scheme-category one. Its affine-neighborhood hypothesis holds:
D is contained in the displayed A1 chart of P1.

There is an exact sequence of coherent O_C1-modules

    0 -> O_C1 -> (nu1)_* O_P1 direct-sum k_p -> E_p -> 0,         (6)

where the last map is (f,c) mapping to f restricted to D minus c. Here
E_p denotes E as a sheaf supported at p, with O_C1-action through its
scalar residue. Locally (6) is

    0 -> B x_E k -> B direct-sum k -> E -> 0.

The last map is surjective because B -> E is surjective. Off p, (6) is
the identity followed by zero. This is a direct verification of the
short exact sequence; the Stacks lemma about two closed immersions is
not used with one merely finite arrow.

For the cohomology input one only needs affine acyclicity, the long exact
sequence, and H^0(P1,O)=k, H^i(P1,O)=0 for i>0. The latter also follows
from the two-standard-affine Cech complex: every Laurent polynomial is
a sum of a polynomial in t and a polynomial in t^(-1), and their
intersection is k. A finite morphism is affine, so a separated affine
cover of the target and its inverse image compute the same Cech complex
for the pushed-forward sheaf. Thus its cohomology is the cohomology of
the source. A sheaf from a finite zero-dimensional scheme has no higher
coherent cohomology, by the same affine argument.

The resulting exact sequence on global sections is

    0 -> H^0(C1,O) -> k direct-sum k --(c,d |-> c-d)--> E
      -> H^1(C1,O) -> 0.

The image is the scalar copy of k in E and the kernel is the diagonal.
In particular the structural map identifies H^0(C1,O) with k, and the
connecting map induces the canonical vector-space isomorphism

    E/k  ->  H^1(C1,O).                                (7)

The class of t is a basis of E/k. Higher cohomology vanishes. Thus the
arithmetic genus is one, although the normalization has genus zero.
The isomorphism (7), not just its dimension, is natural under field
extension: the sequence (6) tensors to the same sequence for the
extended coefficients, and (E/k) tensor_k K=(E tensor_k K)/K. This
identifies the usual base-change map through the two connecting maps.

C1 is singular at p: its one-dimensional local ring has maximal ideal
generated by u,v and embedding dimension two, since (1) has no linear
term. Hence C1 is **not** a regular genus-one generic curve in the
roadmap's fibration convention, and it is not an elliptic curve. It is
a proper geometrically integral arithmetic-genus-one singular fiber
model. This distinction is part of the comparison contract.

## 4. Nodes, cusps and the separability hypothesis

The quadratic initial form of (1) at p is

    v^2 + a u v + b u^2.

Its polar matrix in coordinates u,v is [[2b,a],[a,2]], whose determinant
is 4b-a^2. Put disc=a^2-4b. The following proves the geometric assertion,
including characteristic two, without dividing by 2.

Suppose q is separable. Over a splitting field let its roots be r,s,
with r not equal to s. There is a unique series r(u) with constant term
r and q(r(u))=u. This can be constructed recursively: writing
r(u)=r+sum_(n>=1) c_n u^n gives

    c_1 = 1/(2r+a),
    c_n = -(sum_(i=1 to n-1) c_i c_(n-i))/(2r+a), n>=2.

The denominator is r-s, hence is nonzero. Set s(u)=-a-r(u). The sum
and product identities give

    F(u,v) = (v-u r(u))(v-u s(u)).                      (8)

Set X=v-u r(u), Y=v-u s(u). The series X-Y=u(s(u)-r(u)) has an invertible
linear coefficient as a series in u. It has a unique compositional
inverse, constructed coefficient by coefficient, since the unknown
coefficient at each step is multiplied by that linear coefficient.
Thus u is a series in X-Y and v=X+u r(u). These give inverse continuous
substitution homomorphisms in the two power-series variables. Equation
(8) therefore proves

    completed local ring of C1 at p over the splitting field
      = k'[[X,Y]]/(XY).

This is the usual node, not just a reduced quadratic tangent cone. It
is split over k precisely when q has two roots in k. Its geometric
branches are the two geometric points of Spec(E); in the nonsplit
separable case they are conjugate over k, even though Spec(E) has only
one closed point over k.

There is also an explicit nonsplit completed-ring comparison. Assume E
is a separable quadratic field extension and let alpha be the class of
t. Construct r(u) in E[[u]] by the same recurrence, with constant term
alpha. The pair 1,r(u) is a k[[u]]-basis of E[[u]]: express r(u) in the
basis 1,alpha; its alpha coefficient has constant term 1 and is a unit.
The map T mapping to r(u) therefore identifies

    k[[u]][T]/(T^2+aT+b-u) = E[[u]].

For A, the (u,v)-adic topology and the u-adic topology agree, since
(u,v)^2 is contained in uA and uA is contained in (u,v). Its finite free
normal form consequently identifies its completion with
k[[u]] direct-sum v k[[u]]. Under v mapping to u r(u) its image is

    k + u E[[u]] = {f in E[[u] : f(0) belongs to k}.    (9)

This also computes the completed normalization quotient as E/k. The
comparison is asserted here only for separable E; a coefficient-field
splitting is not being assumed for an inseparable extension.

If q is not separable, over an algebraic closure it is (t-r)^2. Put
z=t-r. Then u=z^2 and v-r u=z^3. Translating w=v-r u turns (1) into

    w^2-u^3=0.

The normalization is u=z^2,w=z^3, its completed subring is
kbar+z^2 kbar[[z]], and it has one geometric branch. This is a cusp, not
a node, also in characteristics two and three. The complement is
smooth by Section 2, so we have proved: C1 is at worst nodal exactly
when q is separable, equivalently disc is nonzero.

A necessary non-example is k=F2(c), q=t^2-c. Here E is a field of degree
two, but it is purely inseparable; the curve is geometrically cuspidal.
Thus the test "E is a field" does not by itself imply a nonsplit node.
No such counterexample occurs over a finite field, because finite fields
are perfect. In characteristic two the correct nodal condition in this
family is a not equal to zero, not a characteristic-zero discriminant
argument involving division by 2.

## 5. A two-component model with its entire affine kernel

The second model makes the r=2 conductor square equally explicit. In
P2 with coordinates [T:Y:W], let

    C2 : Y(YW-T^2-aTW-bW^2)=0.                         (10)

Its components are the line L with Y=0 and the smooth conic H with
YW=T^2+aTW+bW^2. Their actual parametrizations are

    nu_L([T:S]) = [T:0:S],
    nu_H([T:S]) = [TS:Q(T,S):S^2].                     (11)

The conic parametrization is an isomorphism: on W nonzero its inverse
is t=T/W, and around [0:1:0], writing x=T/Y,z=W/Y, the equation
z=x^2+a x z+b z^2 has nonzero derivative in z at the origin, while the
parametrization is the usual degree-two projective parametrization.
More concretely an inverse near that point is the map to P1 represented
by [Y-aT-bW:T]; substituting (11) gives [T^2:TS]=[T:S] on T nonzero.
These two inverse descriptions cover the conic and agree on the overlap.
At the conic infinity point the derivative of its homogeneous equation
with respect to W is Y, so smoothness there is immediate; its affine
chart is a graph over t. The line and conic do not meet at infinity.

On W=1, the coordinate ring of C2 is

    A2 = k[t,y]/(y(y-q(t))) = B x_E B.                  (12)

To prove the full kernel and not only the relation, evaluate
k[t,y] in B times B by t mapping to (t,t), y mapping to (0,q).
Divide by y^2-qy, monic of degree two in y. The remainder f(t)+y h(t)
maps to (f,f+qh). It vanishes only if f=0 and qh=0, hence h=0.
Its image consists exactly of pairs whose difference is divisible by q.
This proves (12) with its specified maps. The algebra B times B is a
finite A2-module, generated by (1,1) and (0,1).

The two maps in (11) identify their sources with the two reduced
components, hence their disjoint union nu2 is finite and is the
normalization of the reduced curve C2. The common subscheme is
D=V(Y,Q(T,W)); its affine ring is E, with the same t on both components.
Algebraically the conductor of A2 in B times B is qB times qB:
multiplication by the two component idempotents forces each residue to
vanish, and the converse is immediate. Therefore

    D disjoint-union D ---> P1 disjoint-union P1
             |                         |
             v                         v
             D ----------------------> C2                         (13)

is the conductor square, with the folding map on the left. It is
cartesian by taking the quotient modulo q on each component, and it is
a geometric categorical pushout by (12) and the unchanged complements.
Both finite fibers fit in the disjoint union of the two affine charts.
Projectivity follows from the explicit closed embedding (10), rather
than from an unstated assertion about properness of all pushouts.

This construction uses the same identified degree-two subscheme on the
two components. It does not classify arbitrary gluings with unspecified
identifications, or assert that an arbitrary surface fiber has already
been compared to this model.

## 6. Two-component cohomology and singularity types

From (12) one obtains the exact sequence

    0 -> O_C2 -> (nu2)_*O_(P1 disjoint-union P1) -> O_D -> 0,       (14)

where the last map is the difference of the two restrictions. Surjectivity
is checked on the displayed affine charts via B -> E. Away from D it
is an isomorphism to the relevant component. Consequently

    0 -> H^0(C2,O) -> k direct-sum k --(c,d |-> c-d)--> E
      -> H^1(C2,O) -> 0.

The structural constants identify H^0(C2,O)=k, and the connecting map
identifies H^1(C2,O)=E/k, with basis represented by t. Higher cohomology
vanishes. As for (7), this is an isomorphism of actual vector spaces
and is natural under field extension. The curve is geometrically
connected, reduced and of arithmetic genus one, but has two geometric
components, each with normalization genus zero.

If q is separable, at each geometric root r the local equation is
y(y-q(t))=0 with q'(r) nonzero. Use x=y and z=y-q(t). The series q(t)
has an invertible linear term in t-r, so coefficientwise inversion gives
the completed local ring kbar[[x,z]]/(xz). Thus there are two transverse
geometric nodes. If q is irreducible separable over k these are conjugate;
the two components themselves are still defined over k.

If q has a double geometric root r, the local equation becomes

    y(y-z^2)=0,  z=t-r.

There are two smooth branches meeting with intersection multiplicity
two: quotienting by their two ideals gives kbar[[z]]/(z^2), of length
two. The normalization quotient has length two as well, from (12).
It is not a node: its quadratic initial form is y^2, or equivalently
it has two branches but delta-invariant two rather than one. This
argument still applies in characteristic two, where the equation is
y^2+y z^2; a vanishing y derivative alone is not a branch classification.

These are the reduced curve forms appearing as split or nonsplit I2,
and as III, respectively. The analogous C1 forms are I1 and II.
The proof here is of the curve models and their local equations.
Identification with a particular Kodaira fiber in a regular surface
still requires the roadmap's geometric classification and intersection
comparison; no new surface or genus-one fibration is asserted to exist.

## 7. Counts over every finite extension and the native count convention

Now k has Q elements. For m>=1 put K=F_(Q^m) and let r_m be the number
of distinct roots of q in K. The actual complement isomorphisms give

    #C1(K) = Q^m + 2 - r_m,
    #C2(K) = 2 Q^m + 2 - r_m.                          (15)

For C1, remove D(K) from P1(K) and add the single rational point p.
For C2, take two copies of P1(K) and identify the two copies of each
point of D(K). In the nonsplit C1 case p is rational even when it has
no rational normalization preimage. In the nonsplit C2 case the gluing
locus itself has residue field E and has no K-points until E embeds
in K. This explains the different constants in (15).

The counts use distinct roots, not the vector-space dimension of E.
For q with a repeated root, D is length two but D(K) is a singleton.
Finite fields are perfect, so that root belongs to k. The three cases
are therefore:

| residue algebra | r_m | #C1(K) | #C2(K) |
| --- | --- | --- | --- |
| k times k | 2 | Q^m | 2 Q^m |
| separable quadratic field | 0 if m odd, 2 if m even | Q^m+1-(-1)^m | 2 Q^m+1-(-1)^m |
| k[epsilon]/epsilon^2 | 1 | Q^m+1 | 2 Q^m+1 |

The parity assertion follows because Frobenius permutes the two roots
as a transposition in the nonsplit case, so its m-th power fixes them
exactly for even m. This is a finite-field input, not an assumption
that splitting is unchanged by field extension.

There is a direct comparison to the already existing Weierstrass carrier.
For C1 take

    W(a,b) = (a_1,a_2,a_3,a_4,a_6) = (a,-b,0,0,0).

Its affine equation is (1), and its unique infinity point is the one
in Section 2. Thus the native WeierstrassCurve.pointCount is #C1(K).
The sign in a_2=-b matters in odd characteristic. The native
pointCount_def counts all affine solutions plus one; it includes p.
It is not the cardinality of the nonsingular point group in this case.
The native theorem pointCount_eq_card_point assumes IsElliptic and
cannot be invoked: the discriminant of W(a,b) is zero for every a,b.

A subtraction-free natural-number contract for the new scheme comparison is

    W(a,b).pointCount + #{t in K : q(t)=0} = #K + 2.

After this comparison the existing frobeniusTrace_def gives r_m-1:
1 for split nodes, (-1)^m for a nonsplit node, and 0 for cusps.
The nonsingular projective point group has one fewer point than C1:
Q^m-1, Q^m-(-1)^m, and Q^m in the respective cases. No assertion here
identifies a singular curve with an elliptic curve or its Tate module.

## 8. Discriminating API and regression contracts

These statements are to be attached to the corresponding existing G.1
normalization, pinching and point-count work when integrated. Generic
Proj, normalization, coherent cohomology, finite fields, and native
Weierstrass carriers are inputs, not new competing owners.

For the one-component construction and normalization:

- `projective_pinch_affine_chart`: the W-nonzero chart is the EXISTING A
  through u=U/W,v=V/W, with the full kernel (1).
- `projective_pinch_infinity_chart`: (4) is the actual inverse chart;
  nu1 maps [1:0] to [0:1:0]. The degree-three formula must have no
  basepoints, including when q has repeated roots.
- `projective_pinch_fiber`: the fiber above p is Spec(E), as a scheme.
- `projective_pinch_cohomology`: separate the structural H0 comparison,
  connecting-map H1 comparison, and their field-extension naturality.
- `projective_pinch_node_iff`: q separable iff the unique singular point
  is a node, with splitness determined by its branch algebra E.

Tests include q=t^2 (a cusp and a nonreduced normalization fiber),
q=t^2-1 in characteristic not two (the split node), and
q=t^2+t+1 over F2 (the nonsplit node). The purely inseparable q=t^2-c
over F2(c) rejects the false "quadratic field implies node" rule.
The infinity test rejects a parametrization given only on an affine chart.
The H1 test rejects using the normalization's genus as arithmetic genus.

For the two-component construction:

- `two_component_pinch_affine_chart`: (12), including the entire kernel.
- `two_component_pinch_component_maps`: the line and conic maps (11)
  are isomorphisms onto the two components and agree on the named E.
- `two_component_pinch_conductor`: conductor qB times qB and square (13),
  with all four arrows, not merely its point-set quotient.
- `two_component_pinch_H1`: the connecting map E/k -> H1 is an isomorphism.
- `two_component_pinch_local_form`: two transverse geometric nodes for
  separable q, and y(y-z^2) at the single geometric intersection otherwise.

Tests include q=t(t-1) (two intersections of length one), q=t^2 (one
intersection of length two and delta two), and q=t^2+t+1 over F2
(two k-defined components, no rational intersection). The second test
rejects replacing the conductor scheme by its reduction; the third
rejects confusing permutation of nodes with permutation of components.

For the count/field-extension comparisons, concrete values are:

| q over F2 | C1(F2), C1(F4), C1(F8) | C2(F2), C2(F4), C2(F8) |
| --- | --- | --- |
| t^2 | 3,5,9 | 5,9,17 |
| t^2+t | 2,4,8 | 4,8,16 |
| t^2+t+1 | 4,4,10 | 6,8,18 |

Over F3, q=t^2+1 gives C1(F3)=5; using the incorrect coefficient a_2=b
instead of -b gives 3. The arithmetic-genus-one statement must hold
also in the cuspidal and two-component cases, not just for a node.
The two F4 nonsplit counts reject a formula that never splits after
extension. A point enumeration alone cannot certify conductor lengths,
completed local rings, cohomology, or categorical universality.

## 9. Integration worklist and ownership boundaries

The proof-sized dependency order is as follows. These are local worklist
labels, not a new family of registered atlas IDs.

1. P01: preserve the existing affine generation and full-kernel targets;
   record their monic remainder proof rather than changing carriers.
2. P02: construct the degree-three projective map (3) and prove the
   homogeneous relation and basepoint-free condition.
3. P03: prove the affine chart comparison and the infinity chart (4),
   as separate coordinate isomorphisms with generator identities.
4. P04: deduce the actual finite normalization and complement isomorphism;
   compare it with the StableReduction normalization interface.
5. P05: identify the conductor subschemes and the cartesian square (5).
6. P06: apply the general G.0 finite-pinching universal property to (5).
7. P07: prove exactness of (6), with explicit maps and surjectivity.
8. P08: deduce H0, H1 via the connecting map, and higher vanishing as
   separate lemmas; then prove the field-extension naturality square.
9. P09: prove the simple-root series recurrence and invertible-coordinate
   adapter used in (8), importing the generic power-series operations.
10. P10: identify split/nonsplit branch algebras and compare the completed
    local rings with the native ordinary-double-point predicate.
11. P11: prove the repeated-root cusp comparison and its non-node result.
12. P12: prove the complete two-component affine kernel (12).
13. P13: construct and compare the two projective component maps (11).
14. P14: identify the normalization, conductor and pushout (13).
15. P15: prove (14), then its H0 and connecting-map H1 consequences.
16. P16: prove the two local intersection forms, retaining intersection
    length two in the repeated-root case.
17. P17: build the point-set bijections from the complement isomorphisms,
    then the separate count statements (15).
18. P18: specialize the finite-field root counts under every extension.
19. P19: compare C1 to the native Weierstrass equation/count and specialize
    the existing trace definition, with a_2=-b and no ellipticity assumption.

The existing G.1/quadratic-pinch-generation,
G.1/quadratic-pinch-presentation and G.1/quadratic-pinch-normalization IDs
must be retained. Split new nonroutine helpers around them when the
packet, reader and suggested file can be updated together. No additional
planet is proposed. The reserved general Ferrand key remains its current
owner; these are explicit consumers and tests, not a substitute definition
restricted to curves.

The freshly read SF.0 stage owns relative Spec/Proj and affine gluing;
SF.2 owns site/cohomology interfaces; SF.3 explicitly integrates the
AlgebraicCurves and JacobianChallenge genus/Picard owners. Its broad stage
text is not itself an exact native theorem signature. The existing
requests must be sharpened with P03, P07-P08 and P15 as concrete consumers,
not deleted merely because the mathematical cohomology calculation is now
written out. StableReduction's normalization and geometric-node interfaces
remain the supplier for P04/P10. In particular AlgebraicCurves' function-
field genus is not a replacement for H1 of these singular curves.

Still unresolved in this job: canonical node/API registration, native
projective and normalization comparisons, the full suggested-file
elaboration, application to arbitrary actual fibers rather than these
explicit models, the general algebraic-space/gluing exports, DVR and wild
fiber work, and the rational-surface model completeness/source obligations.
The prior general-ring matrix resolution and nonflat base-change tests
also still require their canonical integration. Nothing here closes the
whole G.0 key definition or any of the seven stages.

## 10. Sources, versions and scope of verification

Fresh primary reading on 2 October 2026:

- [Schroeer, arXiv:2004.07025](https://arxiv.org/pdf/2004.07025), whose
  returned first page identifies v3, 9 August 2022, and a third revised
  version dated 19 July 2022. The returned PDF has 52 pages. Read the
  parsed Section 3 text on printed pp.9-11: the two conductor constructions,
  the distinction of separable and inseparable residue algebras, and
  Proposition 3.2. The short locator excerpt is "finite k-algebra of length
  two". The explicit coordinate constructions and proofs in this receipt
  are derived adapters, not claimed to be numbered results stated there.
  PDF rendering was attempted but returned a cache error; no successful
  visual verification of its conductor diagrams or printed table is claimed.
  The numbers in this receipt are derived independently and tested below.
- [Stacks 0ECH](https://stacks.math.columbia.edu/tag/0ECH), Situation
  37.67.1 and Proposition 37.67.3, including its proof: the hypotheses,
  affine fiber-product construction and scheme universal property. Both
  explicit constructions satisfy the finite-fiber affine-neighborhood
  condition. No unconditional global scheme-existence result is inferred.
- [Stacks 0C46](https://stacks.math.columbia.edu/tag/0C46), Definition
  53.19.1 and Lemmas 53.19.3, 53.19.4 and 53.19.7, with their proofs:
  ordinary double points, completed rings, and branch/delta criteria.
  Sections 4 and 6 give specialized coordinate proofs, not a re-plan of
  that general nodal-curve theory.
- [Stacks 01XS](https://stacks.math.columbia.edu/tag/01XS), Lemma 30.8.1
  and its Cech proof, specialized here to n=1,d=0. The general cohomology
  theory stays with its existing foundational owners.

The Annals publication record was read for its metadata (197 (2023),
pp.1-63); its full published text was not successfully obtained. The
preprint is not represented as a byte-identical published version. No
new erratum or source mistake is alleged, and no fresh whole-paper
collation is claimed. All 21 inherited source findings remain unchanged.
There is no fresh downloaded-PDF hash certificate from this session.

Fresh exact pinned library reading:

- TauCeti at `f790474821cf4256814db967cb154e7af3d0c369`,
  `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean`, complete file,
  blob `a1c0db6d278c1ea94d09778b0826d67106bd7a5a`: pointCount,
  pointCount_def, pointCount_eq_card_point with its IsElliptic hypothesis,
  frobeniusTrace and frobeniusTrace_def. These existing declarations are
  reused, not counted as new nodes. Their source was read, not compiled.

Repository reading included the live worker/protocol/browser/upstream
instructions, the issue and its comments before/after claim, the preceding
handoff, the relevant canonical reader and packet opening, and the SF.0-
SF.3 descriptions. Upstream readings were the selected conventions and
ownership sections of StableReduction and AlgebraicCurves. The parent
AUDIT-10 material and the published red-team coverage summary were inspected
as leads; this was not a fresh exhaustive read of data/library-coverage.json
or every accepted parent audit target. No whole-library absence claim is
made. No canonical declaration is being newly planned on the strength of
that limited screen. An integration worker still needs the exact supplier
nodes, reviewed audit fits, and pinned native signatures.

## 11. Executed validation and compilation status

The reproducible standard-library program below executed **133,830
assertions**, covering all 824 monic quadratic coefficient pairs over
fields of orders 2,3,5,4,8,9,25, for both projective models. It enumerates
actual projective points, checks the maps and their fibers, checks the
unique infinity contribution, computes singular support by partial
derivatives, and verifies the root-parity behavior for prime-field
coefficients in the displayed extensions. It separately checks the
finite-field arithmetic tables used for those computations.

There are 17,914 parametrized-point tests for each relevant construction,
824 complete count tests for each family, and 80 extension-parity tests.
The sample F2/F4/F8 values in Section 8 are direct outputs. These are
finite regressions, not a proof of an arbitrary-field assertion, a
categorical universal property, cohomology, or a nilpotent scheme structure.
The proofs of those assertions are Sections 1-7 with the stated inputs.

Program SHA-256:
`706efec958473c5862fd191bef27e4bc0b58377129986f4c14d76a36664ed196`.
JSON output SHA-256:
`c3d3832501bc4043782d969df4c4ef9fc25cc6a6121ffbe5a492360a343afa7a`.

**Lean was not compiled.** Available memory was about 3 GB, below WORKERS'
20 GB threshold, and no existing pinned build was available. No Lake
project, cache download, library build or language server was started.
The indexed blueprint checker and atlas build were not run locally;
there was no accessible local repository checkout, and the canonical
packet is unchanged. Submission CI is a separate mechanical check, not
an independent mathematical review. No implementation or stage-closure
claim follows from these tests or from that CI.

## 12. Reproduction

Run the following with Python 3. No third-party packages are used.

```python
"""Exact finite-field regressions for one- and two-component quadratic pinches.
Standard library only. These computations do not prove geometric statements.
"""
from collections import Counter
from itertools import product
import json

counts = Counter()

def ck(name, condition):
    if not condition:
        raise AssertionError(name)
    counts[name] += 1

class Field:
    def __init__(self, p, modulus):
        self.p, self.modulus = p, tuple(modulus)
        self.n, self.size = len(modulus)-1, p**(len(modulus)-1)
        self.elements = range(self.size)
        self.digits = [tuple((x // p**i) % p for i in range(self.n)) for x in self.elements]
        self.add_table = [[self.encode([(a+b)%p for a,b in zip(self.digits[x],self.digits[y])]) for y in self.elements] for x in self.elements]
        self.neg_table = [self.encode([(-a)%p for a in self.digits[x]]) for x in self.elements]
        self.mul_table = [[self.multiply(x,y) for y in self.elements] for x in self.elements]
        self.inv_table = {x:next(y for y in self.elements if self.mul(x,y)==1) for x in self.elements if x}
        # The existence of inverses verifies the supplied monic quotients are fields.
        for x in self.elements:
            for y in self.elements:
                ck('field_commutativity', self.mul(x,y)==self.mul(y,x))
                for z in self.elements:
                    ck('field_associativity', self.mul(self.mul(x,y),z)==self.mul(x,self.mul(y,z)))
                    ck('field_distributivity', self.mul(x,self.add(y,z))==self.add(self.mul(x,y),self.mul(x,z)))
    def encode(self, a): return sum(v*self.p**i for i,v in enumerate(a))
    def add(self,x,y): return self.add_table[x][y]
    def neg(self,x): return self.neg_table[x]
    def sub(self,x,y): return self.add(x,self.neg(y))
    def mul(self,x,y): return self.mul_table[x][y]
    def multiply(self,x,y):
        p,n=self.p,self.n
        c=[0]*(2*n-1)
        for i,a in enumerate(self.digits[x]):
            for j,b in enumerate(self.digits[y]): c[i+j]=(c[i+j]+a*b)%p
        for i in range(2*n-2,n-1,-1):
            v=c[i]
            for j in range(n+1): c[i-n+j]=(c[i-n+j]-v*self.modulus[j])%p
        return self.encode(c[:n])
    def power(self,x,n):
        out=1
        for _ in range(n): out=self.mul(out,x)
        return out
    def normalize(self,coords):
        pivot=next(x for x in coords if x)
        return tuple(self.mul(x,self.inv_table[pivot]) for x in coords)
    def p1(self): return [(x,1) for x in self.elements]+[(1,0)]
    def p2(self):
        return [(x,y,1) for x,y in product(self.elements,repeat=2)]+[(x,1,0) for x in self.elements]+[(1,0,0)]

specs=[(2,(0,1)),(3,(0,1)),(5,(0,1)),(2,(1,1,1)),(2,(1,1,0,1)),(3,(1,0,1)),(5,(2,0,1))]
receipts=[]
for p,modulus in specs:
    K=Field(p,modulus); add,mul,sub,pow=K.add,K.mul,K.sub,K.power
    def scale(n,x): return mul(n%p,x)
    inf1=K.normalize((0,1,0)); pinch=K.normalize((0,0,1))
    for a,b in product(K.elements,repeat=2):
        def q(t): return add(add(pow(t,2),mul(a,t)),b)
        roots=[t for t in K.elements if q(t)==0]
        disc=sub(pow(a,2),scale(4,b))
        def cubic1(P):
            u,v,w=P
            return sub(add(add(mul(pow(v,2),w),mul(a,mul(mul(u,v),w))),mul(b,mul(pow(u,2),w))),pow(u,3))
        def grad1(P):
            u,v,w=P
            return (sub(add(mul(a,mul(v,w)),scale(2,mul(b,mul(u,w)))),scale(3,pow(u,2))),
                    add(scale(2,mul(v,w)),mul(a,mul(u,w))),
                    add(add(pow(v,2),mul(a,mul(u,v))),mul(b,pow(u,2))))
        points1={K.normalize(P) for P in K.p2() if cubic1(P)==0}
        images1=[]
        for t,s in K.p1():
            Q=add(add(pow(t,2),mul(a,mul(t,s))),mul(b,pow(s,2)))
            raw=(mul(Q,s),mul(t,Q),pow(s,3))
            ck('cubic1_no_basepoint',any(raw))
            image=K.normalize(raw); images1.append(image)
            ck('cubic1_morphism_equation',cubic1(image)==0)
        ck('cubic1_count',len(points1)==K.size+2-len(roots))
        ck('cubic1_image',set(images1)==points1 if roots else set(images1)==points1-{pinch})
        ck('cubic1_off_pinch_bijection',len([x for x in images1 if x!=pinch])==len(points1-{pinch}) and len(set(images1)-{pinch})==len(points1-{pinch}))
        ck('cubic1_pinch_fiber',images1.count(pinch)==len(roots))
        ck('cubic1_infinity',images1[-1]==inf1 and any(grad1(inf1)))
        ck('cubic1_unique_singularity',{P for P in points1 if not any(grad1(P))}=={pinch})
        # Discriminant of tangent form v^2+a*u*v+b*u^2, including p=2.
        ck('tangent_polar_determinant',sub(scale(4,b),pow(a,2))==K.neg(disc))
        if disc==0: ck('perfect_field_repeated_root',len(roots)==1)
        else: ck('separable_root_number',len(roots) in (0,2))
        # On v !=0 and h(u/v)!=0, infinity chart equals z*h(x)=x^3.
        for P in points1:
            u,v,w=P
            if v:
                x=mul(u,K.inv_table[v]); z=mul(w,K.inv_table[v]); h=add(add(1,mul(a,x)),mul(b,pow(x,2)))
                ck('infinity_chart_relation',mul(z,h)==pow(x,3))
                if h: ck('infinity_chart_inverse',z==mul(pow(x,3),K.inv_table[h]))
        # Second model: line times conic, with identical degree-two gluing algebra.
        def conic(P):
            t,y,w=P
            return sub(mul(y,w),add(add(pow(t,2),mul(a,mul(t,w))),mul(b,pow(w,2))))
        def cubic2(P): return mul(P[1],conic(P))
        def grad2(P):
            t,y,w=P; c=conic(P)
            return (K.neg(mul(y,add(scale(2,t),mul(a,w)))),add(c,mul(y,w)),mul(y,sub(y,add(mul(a,t),scale(2,mul(b,w))))))
        points2={K.normalize(P) for P in K.p2() if cubic2(P)==0}
        images2=[]; line=[]; quad=[]
        for t,s in K.p1():
            Q=add(add(pow(t,2),mul(a,mul(t,s))),mul(b,pow(s,2)))
            L=K.normalize((t,0,s)); C=K.normalize((mul(t,s),Q,pow(s,2)))
            line.append(L);quad.append(C);images2 += [L,C]
            ck('cubic2_component_maps',cubic2(L)==0 and conic(C)==0)
        intersection={K.normalize((t,0,1)) for t in roots}
        ck('cubic2_count',len(points2)==2*K.size+2-len(roots))
        ck('cubic2_image',set(images2)==points2)
        ck('cubic2_intersection',set(line)&set(quad)==intersection)
        ck('cubic2_component_bijections',len(set(line))==K.size+1 and len(set(quad))==K.size+1)
        ck('cubic2_singular_support',{P for P in points2 if not any(grad2(P))}==intersection)
        ck('cubic2_fiber_multiplicities',all(images2.count(P)==(2 if P in intersection else 1) for P in points2))
        if disc==0:
            r=roots[0]
            for z in K.elements: ck('repeated_root_translation',q(add(z,r))==pow(z,2))
        receipts.append({'field':K.size,'a':a,'b':b,'roots':len(roots),'C1':len(points1),'C2':len(points2)})
    # Check base-prime coefficients through extensions, using actual Frobenius/root counts.
    for a,b in product(range(p),repeat=2):
        roots0=sum((t*t+a*t+b)%p==0 for t in range(p))
        rootsK=sum(add(add(pow(t,2),mul(a,t)),b)==0 for t in K.elements)
        expected=roots0 if roots0 else (2 if K.n%2==0 else 0)
        ck('extension_root_parity',rootsK==expected)

out={'assertions':sum(counts.values()),'by_kind':dict(sorted(counts.items())),
     'models_per_family':len(receipts),'field_orders':[p**(len(f)-1) for p,f in specs],
     'F2_examples':[r for r in receipts if r['field'] in (2,4,8) and r['a']<2 and r['b']<2]}
print(json.dumps(out,sort_keys=True,indent=2))
```
