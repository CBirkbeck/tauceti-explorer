# BP-ColemanPowerSeries: native norm valuation and ideal topology

Codex — codex-7e92bd. Issue699; claim5860944077 confirmed by exact
bot5860945083. Whole issue read before and after claiming; its body and all
four predecessor output blobs are unchanged at publication. Partial checkpoint;
every node remains unchecked.

## Delivered

194 nodes: 2 definitions, 19 constructions, 137 lemmas, 25 theorems and
11 comparisons. There are106 API items (99 on definitions/constructions),
150 packet tests (71 on those objects), 152 typed examples, 12 planets and
258 baseline declarations. Six gaps, twelve requests, thirteen preserved
source findings and zero closed stages remain.

Eleven new L0 nodes give the norm of a unit times a signed uniformizer power;
the unique integer norm exponent of a nonzero element; integrality exactly
when the norm is at most1; the native valuation-integers certificate; equality
with the native norm valuation ring; the unit, maximal-ideal and reduction
criteria; the norm criterion for maximal-ideal powers; the rational-prime
ideal equality; and the maximal-ideal neighborhood basis. All eleven new
public signatures and ten new examples use proof placeholders.

The existing carriers and norms are retained: K_n is the specified intermediate
field inside PadicAlgCl p, O_n is its native integral closure over ℤ_p,
ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), and q_n=‖ϖ_n‖. Native integral-closure
localization and DVR signed factorization give x=ι(u)(ζ_n−1)^k for x≠0.
The established integral-unit norm gives ‖x‖=q_n^k. Since 0<q_n<1, norm≤1
forces k≥0, proving the converse integral bound without assuming a canonical
local-field structure or completeness of the ambient algebraic closure.

The native Valuation.Integers certificate makes its existing unit and
divisibility API applicable to the actual O_n. Thus units have exactly norm1,
the maximal ideal and reduction kernel have norm<1, and m_n^r is exactly
the closed ball of radius q_n^r, including r=0. Native geometric-radius metric
balls give the neighborhood basis. The preceding unit-factor equation gives
(p)=m_n^(d_n). The normalized valuation and intrinsic ramification invariants
remain with LocalFieldsRamification; this checkpoint supplies their concrete
cyclotomic input and narrows that request.

## Source and input provenance

The full issue, protocols, preceding handoff and reviewed AUDIT24 L0 were read.
Accepted RS16, all five audit rows, atlas/links and the LocalFieldsRamification
and Multiquadratic model documents retain their continuous-reading provenance
from the preceding Coleman checkpoints. The owner’s finite-extension,
normalized-valuation and ramification scope was freshly read in full for the
relevant sections. No generic local-field object is duplicated.

The hash-verified Rodrigues Jacinto–Williams publication was freshly read at
complete printed161–164/PDF62–65, including the proof of Lemma10.1:
[published source](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf),
SHA25678d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6.
The eleven norm-valuation and topology comparisons and their dyadic extension
are worker deductions. The source assumes p odd. All thirteen inherited
findings are preserved, and no new finding or independent verdict is added.

Fourteen applicable native declarations were read with their ambient hypotheses;
twelve are new baseline records and two were already cited. The complete
Valuation.Integers API, integral-closure fraction-field theorem, DVR signed
factorization, norm valuation and geometric metric basis were inspected. In
particular, no separate generic divisibility or unit theorem is planned.

Current open-PR searches found the relevant
[certificate rename proposal](https://github.com/leanprover-community/mathlib4/pull/43250)
and [norm/valuative-topology adapter](https://github.com/leanprover-community/mathlib4/pull/40309).
Their titles, bodies and the rename’s file scope were inspected. The first
proposes Valuation.IsIntegers for the existing predicate; the suggested file
uses Valuation.Integers, the name actually at the pin. The second informs the
owner’s general interface. Neither is treated as a pinned declaration.
Indexed Zulip searches found no specific substitute for these cyclotomic
comparisons; search coverage is not exhaustive.

The actual PMIA supplier is now304 nodes; its intervening additions were
authored and checked in this continuous session. Its suggested-source SHA256
is ad64bfe94d36581684ae9a29fa5b76dad2dd154b24fb55b420274f6585e45432.
The full Dirichlet224→247 delta was read:23 new nodes, all224 old nodes
unchanged, and its request unchanged. There is no new reverse Coleman edge.
The source registry7600→7616 adds7ClassicalAdicEtale,2Dirichlet,
3ExponentialSums and4HigherLocalFields findings, each read in the intervening
checkpoints. Owner/file/id comparison preserves all7600 previous records.

At publication main1412e4956da98b1afe4af5ff80c252bb84d709db all53 captured
input blobs and all four predecessor output blobs are unchanged from the
starting main6babeebf9f4f9421f5069c49ed254bf547ac2acf. The issue body is
unchanged. Only the four authorized deliverables are submitted.

## Validation

The complete changed194-node suggested file compiles at the pinned baseline
with Lean4.34.0-rc2: zero errors and407 warnings, all and only expected proof
placeholders. The actual current PMIA304 suggested supplier was freshly
compiled first: zero errors and644 placeholder warnings. A second Coleman
run corrected one ideal-to-set coercion annotation and used that same freshly
built supplier only after verifying both its source and artifact hashes.
No stale proposed supplier artifact was used.

The source audit covers2846 byte-verified Mathlib modules,3 already built
pinned TauCeti modules and the actual PMIA supplier. No native library was
built and no Lake project was created. Suggested-file SHA256:
8b93ed66f15e815d1eb489869205311716d6be2ba79b62b237316c70cfe1d8dc.
Audit SHA256:
d08223d94ec4895f42d1f01fc3566f43e163fc58f5a353cfeeebdd3d8adc4ee8.
The own compiler has ended; no own language server or watcher remains.

Exact rational coefficient-lattice checks cover p=2,3,5,7 at seven cyclotomic
levels and four coefficient precisions. They pass2240 multiplication/division
inverse identities,1120 integrality comparisons,10240 ideal-power membership
comparisons,1120 prime-ideal comparisons,461 reduction comparisons,
256 boundary checks and28 unit-factor checks. Membership in powers is tested
by actual repeated division by X in ℚ[X]/E_n against coefficient-weight
thresholds. These finite samples verify conventions and boundaries; they do
not prove analytic norms, completeness or general theorems.

The indexed blueprint checker, four-file intake, filename-correct errata wrapper
and whitespace checks pass. All183 preceding whole nodes,246 baseline
records,13 source findings and previous suggested bytes are preserved. Only
the third supplier request is narrowed; the other11 are unchanged. New
signature/test reader parity passes. The reachable graph has265 nodes,
1142 acyclic edges,320 native leaves and no unresolved stage leaves. This is
a dependency audit, not a claim of mathematical implementation or full closure.

Retained scratch evidence: inputs.json, input-delta.json, WORKLIST.md,
issue-before.json, issue-claimed.json, issue-publication.json, claim.json,
claim-bot.json, comments-after.json, predecessor-packet.json,
predecessor-reader.md, predecessor-suggested.lean, predecessor-handoff.md,
dirichlet-delta.json, source-registry-delta.json, baseline-read.json,
new-nodes.json, append.lean, extend.py, write-reader.py, compile.py, verify.py,
guard.py, lean-source-audit.json, suggested-compile.log,
PadicMeasuresIwasawaAlgebras-compile.log, supplier-compile.json,
lattice-tests.py, lattice-tests.json, verification.json, checks.json,
publication-guard.json, submission.json, intake-pr.json and the four final
files in handoff-evidence. The source PDF retains its preceding provenance.
One persistent clone and one own Lean process at a time were used.

## Resume

Construct continuous relative norm transitions on the actual integral units
and prove the arithmetic norm/evaluation square for seriesEvaluation. Use the
current integral/unit/norm criteria when restricting the field norm. Combine
this with the owner’s named local-field comparison and interpret (p)=m_n^d,
residue field ZMod p and degree d in its normalized valuation and intrinsic
ramification conventions.

Build the full and principal norm-compatible inverse limits, continuity,
closedness/compactness, G-action, Tate-module inclusion and norm-compatible
Teichmüller splitting. Verify principal-unit pro-p hypotheses before importing
the ℤ_p-module construction; full units are not a ℤ_p-module. For L1, establish
interpolation uniqueness and compact successive approximation using the actual
finite-level evaluation and arithmetic norm compatibility. Continue the exact
L2–L4 packet boundaries, including the actual Coleman composite, its kernel
and cokernel, and the cyclotomic-unit quotient. General unramified or semilocal
coefficient variants need explicit Frobenius and norm data. No stage is closed.
