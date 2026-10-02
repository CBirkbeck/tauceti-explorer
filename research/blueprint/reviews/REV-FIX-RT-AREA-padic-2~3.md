# Independent review of FIX-RT-AREA-padic-2~3

Reviewer: **Codex**, session **codex-5ebb6f**, 2 October 2026. Review issue [#5538](https://github.com/CBirkbeck/tauceti-explorer/issues/5538); reviewed fix [#5537](https://github.com/CBirkbeck/tauceti-explorer/issues/5537), by Codex session codex-rtOQ9t. Input snapshot: `451beebcad69060bc566908af420f754f5f3b48e`. I wrote neither that fix nor its preceding mathematical repairs or packet reviews.

**AdicSpacesPartII is accepted for the scoped fixes. Faltings and PerfectoidSpaces--P0 need changes.** The submitted reader synchronization is correct against its input packets, but examining the affected nodes exposed two incorrect inherited acceptance examples. I corrected them in the authorized packets. Their reader copies need the same corrections from an authorized reader owner. Perfectoid's comprehensive review remains unfinished independently of these examples.

This follows [REV-FIX-RT-AREA-padic-2~2](REV-FIX-RT-AREA-padic-2~2.md), [REV-FaltingsFinitenessAndIsogenyTheorems](REV-FaltingsFinitenessAndIsogenyTheorems.md), [REV-PerfectoidSpaces--P0](REV-PerfectoidSpaces--P0.md) and [REV-AdicSpacesPartII](REV-AdicSpacesPartII.md). The previous review objects are appended to `reviewHistory`; all older history and later padic-1 changes are preserved.

## Scope and evidence

Read all assigned `/1`–`/36` claims, proposed fixes and verified evidence/reasons in `RT-AREA-padic-2.result.json` and `.review.json`, the entire round-three fix report and the preceding independent fix review. Findings `/37`–`/46` are outside this job; the preceding review's rejections of `/38` and `/41` are not reversed.

Round three changes two readers and its report. Comparing the six packet/suggested files with its base `56d7d96` confirms no differences in those files. I checked the six Faltings supplier nodes, the three changed Perfectoid use records, the eight uses of the two Adic F1 nodes, their relevant coverage, requests, sources, acceptance examples and suggested signatures/comments. No new mathematical node is introduced in this review. This bounded fix review does not claim a fresh comprehensive audit of the 919 inherited nodes or all baseline statements.

The receiving issue bodies were fetched on 2 October and their explicit finding assignments checked. All 16 remained open. Those bodies retain some unqualified original proposals; the verification records and qualifications below govern implementation. An assignment is a handoff, not a completed source proof, installed dependency edge or accepted receiving blueprint.

## Corrections made here

### Faltings: distinguish the Tate-module prime from the residue characteristic

The acceptance list of `R28.2/inertia-triviality-on-the-quotient-by-the-l-divisible-group-of-the-formal-completion` said inertia on the whole Tate curve Tate module is nontrivial unipotent when `l ∤ v(q)`. This node explicitly works at `v_i | l`. For a split Tate curve there, its toric submodule is `ℤ_l(1)`, and inertia acts through the cyclotomic character, with infinite image. The whole action cannot be called unipotent: its diagonal already includes this character. The quotient by the toric submodule is still trivial, exactly as the node asserts.

Replaced that acceptance bullet with the correct cyclotomic-inertia example and the condition under which the usual semistable unipotent-inertia statement applies: an auxiliary Tate-module prime different from the residue characteristic. This is a correction to the packet's example, not to Faltings' Lemma 6 or its source verdicts. The neighboring multiplicative Hodge–Tate example and Faltings p.359 already specify the positive covariant twist, consistent with this correction.

**Remaining reader edit:** replace the identical stale bullet under this node in `readmes/FaltingsFinitenessAndIsogenyTheorems.md` with the packet's new `acceptance[2]`. The reader is not a deliverable of #5538, so it is unchanged here. That single new mismatch is the reason this packet retains `needs_changes`; the original 32-versus-56-node synchronization defect was repaired by #5537.

The other scoped Faltings repairs are sound. Tate Proposition 2 is a discriminant formula; the differential count additionally uses the formal-group linear term, giving `(R_i/l^n)^d`, with cardinality `l^(n m_i d)`. That supplier proof remains requested from R07.1. Tate Proposition 12 requires a direct summand, made explicit as saturation in the node and suggested `erratum_a_shift`; `lℤ_l ⊂ ℤ_l` is a valid negative control. The proof produces a divisible tail and does not assert divisibility of the original closures or a closed immersion of the resulting model. Tate's local character criterion concerns finite inertia; global finite order also uses class field theory over ℚ. Raynaud §4 assumes a strictly henselian mixed-characteristic base, and 4.1.1 has `e ≤ l−1`, with `e=1` in this application. The absolute-different/invariant-differential comparison remains an explicit unread supplier request.

The three R28.2 references to `PadicHodgeTheory:R06.1` and their request are provisional references to an early Tate–Sen substage. Retarget them when that substage exists. They do not authorize the cyclic whole-stage `R06.1 → R07.1` edge. Algebraic normalized trace is a library ingredient, not the required analytic trace bounds and completed cyclotomic descent.

### Perfectoid: two generators of the same theta kernel are associates

`P1/distinguished-element-criterion` said `p − [p♭]` and `ξ_cyc = Σ_{i<p}[ε]^{i/p}` generate different ideals and neither divides the other. Its neighboring `P1/fontaine-theta-and-primitive-kernel` correctly says both generate the same theta kernel. This also agrees with the reader's primitive-generator calculation and Scholze 2013 Lemma 6.3. Both are primitive kernel elements, so they are associates and divide each other by units.

Replaced the contradictory acceptance item by this positive example, specifying compatible roots of `p` and compatible primitive roots of unity. Added a negative example: `μ = [ε] − 1 = ([ε]^{1/p} − 1) ξ_cyc` lies in the kernel but does not generate it. The first factor is a nonunit because its zeroth Witt coefficient lies in the maximal ideal of `𝒪_{ℂ_p♭}`. Since `ξ_cyc` is regular, equality of these principal ideals would force that factor to be a unit. Thus `(μ)` is strictly smaller, and kernel membership alone does not imply primitivity. The existing `P1/witt-vectors-of-perfect-plus-ring (d)` supplies the unit criterion. Added an explanatory comment beside the existing proposed `IsPrimitive.associated_of_span_le` declaration; no new carrier, axiom, theorem signature or claim of an elaborated Lean test is added.

**Remaining reader edit:** replace the stale second acceptance item under this node in `readmes/PerfectoidSpaces--P0.md` with the packet's corrected item and add its new negative example. The reader is outside this review's paths.

The three supplier-use corrections remain correct and synchronized. P1 supplies theta surjectivity, primitive generation and regularity; R06.1 checks its chosen field element and base change and proves its mixed-characteristic rational filtration. AI.0 specializes through Q0 to `O_C`. Mathlib's principal-kernel theorem remains a TODO. RF2's all-`E` scope, equal characteristic, ramified Witt coefficients, integral divisors and nontrivial graded line bundles remain separate. A chosen generator trivializes a rank-one module; identifying a Tate twist requires period data.

The earlier comprehensive Perfectoid review explicitly left 292 baseline source statements and the source/dependency/API/test/planet audit unfinished. These local use records and acceptance repairs do not complete it. Its general-base gaps and later padic-1 changes are preserved.

### Adic: reader synchronization accepted

All eight use records of `F1/dagger-de-rham-complex` and `F1/compact-support-log-complex` agree with the reader. The overview, F1 explanation, coverage and suggested-file comment distinguish ordinary dagger-tube comparison from HLTT's boundary construction.

Grosse-Klönne 5.1(c) uses the open dagger tube `]Y[` inside the partially proper space attached to `]Ȳ[`, with a proper admissible formal ambient space over a complete mixed-characteristic DVR, smooth along `Y`. HLTT 6.8 gives the ordinary comparison for its smooth quasi-projective setup and functoriality. HLTT 6.21 instead has `E₁^{i,j}=H^i_rig(∂^(j)Y/K)` converging to boundary-support cohomology. AG2.4 owns that construction and slope comparison, using ordinary comparison on strata and RD.5/RD.6 finiteness/weights through 6.22/6.24. The abutment is not a single ordinary rigid cohomology group identified by 6.8. Generic log/compact-support adapters still need separate proofs; Grosse-Klönne 5.2 is a sketch.

The existing `(P¹,{0,∞})` example has boundary-supported `H⁰=0`, while the complement's ordinary cohomology has constants. The existing closed-disc example distinguishes dagger cohomology from its rigid completion. Those negative controls remain correct. No Adic mathematical correction was needed here, and its packet is accepted for these fixes. Its unrelated inherited gaps are not closed.

## Every assigned finding

“Local” refers to the affected records checked here. “Handoff” refers to the unfinished receiving issues; it does not certify their whole source literature or implementations.

| Finding | Verdict and reason |
|---|---|
| /1 | Handoff #664. Retain BMS full faithfulness versus Scholze–Weinstein essential surjectivity, algebraically closed `C` and finite-free scope; no exact inverse claim. Import the Witt-isocrystal baseline. |
| /2 | Handoff #704. DD0 owns ordinary de Rham; CR0 owns PD foundations. Comparison and base change retain their hypotheses. |
| /3 | Handoff #664, #697, #757, #968. Separate local `Rν_*A_inf` from proper global primitive comparison, the two papers' distinct 5.1 statements, corrected covers and derived completion. |
| /4 | Handoff #731, #697, #978. Kummer is not cyclotomic; retain the integral crystalline-lattice weight range and annulus/slope inputs. |
| /5 | Local supplier corrections right; corrected the inherited inertia acceptance example above. #731 still owes the differential/closure/Hodge–Tate/Raynaud proofs. Saturation, the shifted tail, positive twist, local/global character distinction and Raynaud hypotheses are preserved; the different comparison remains unread. Raynaud 4.2 is a separate deformation argument. |
| /6 | Handoff #978. BS22 9.1 is its stated derived formal comparison, not unrestricted degree-zero syntomic comparison. |
| /7 | Handoff #708. Strict surjectivity alone does not imply lci; retain regular-sequence/lci hypotheses and the `Fp[x,y]/(x²,xy,y²)` counterexample. The ambiguous colimit claim is not certified. |
| /8 | Handoff #704. Relative de Rham–Witt uses the general `ℤ_(p)` base and continuous differentials, with the comparison nilpotence and base-change/Tor qualifications. |
| /9 | Local no-op; handoff #664. AI3 owns ordinary Witt sheaves and derived completion as distinct inputs. No affected P0 node moved. |
| /10 | Handoff #664. The actual arrow goes from ordinary rational Witt sheaves to rationalized completion; no unproved reverse arrow. Late structural comparison remains separate. |
| /11 | Handoff #664. Import CR3's Frobenius-isogeny child; BMS 13.21 keeps proper-smooth, rational and chosen `k → O/p` section hypotheses. |
| /12 | Handoff #704. DD3 owns classical Cartier with the Frobenius twist; the lift and `p`-torsion-free conditions cannot be dropped. |
| /13 | Handoff #665. AI6 imports CP3's canonical period comparison in its proper semistable range. |
| /14 | Handoff #705. Preserve Beilinson's non-fine integral/quasicoherent finite-level log-PD setting, not arbitrary mixed-base envelopes. |
| /15 | Handoff #664, with generic Koszul ownership at DD1/#708. The cohomological comparison requires the degree shift `d`; AI1 owns its applications. #708's issue explicitly lists /7,/35,/36, not /15: this additional ownership obligation is qualified here. |
| /16 | Handoff #704. Pro-exactness uses `R−F`, `p^r` and `R^(s−r)`; do not claim fixed-level injectivity. Separate the topologies. |
| /17 | Local specialization correct; corrected the neighboring primitive-element acceptance contradiction above. #664 retains the rest of AI0's baseline/API work. Actual pinned hypotheses and TODO boundaries were checked. |
| /18 | Handoff #968. Berger's weak-admissibility route imports RD slopes and PG2 common coefficient/annulus scope. An alternative FF route is not shown cyclic merely by its name; do not assert an unavailable alternative supplies the required early theorem. |
| /19 | Handoff #968. PG2 Robba and R01.2 Weil–Deligne inputs are separate; preserve Berger's appendix corrections and coefficient-prime distinctions. |
| /20 | Local early Tate–Sen request correct; three parent-stage references remain provisional. #968 supplies analytic normalized-trace bounds and completed cyclotomic descent. No cyclic whole-stage edge is authorized; existing late supplier routes do not prove the early theorem. |
| /21 | Local P1 import records correct; #968/#985 own the field generator/filtration and fixed-`ℚ_p` overlap. Preserve RF2's all-`E`, equal-characteristic, integral-divisor and graded-line scope. |
| /22 | Handoff #685, #687, #969. R06 owns general comparisons; R19/AG2 own modular/Kuga–Sato/Shimura applications and actual later geometry. No reversed prerequisite. |
| /23 | Handoff #697. First Chern classes do not supply higher classes or the projective-bundle formula; the formal/scheme/adic adapter needs proof. |
| /24 | Handoff #978. Arc/arc_t generic-fibre torsion descent is an explicit proposed-owner request, not an installed paper route or perfectoid v-descent theorem. |
| /25 | Local no-op; handoff #978. Spec/Spa concerns qualified torsion cohomology, not all sites; `ℤ_p` requires derived inverse limits. |
| /26 | Handoff #978. DD3 supplies Cartier with its Frobenius twist, multiplicative structure and Bockstein compatibility. |
| /27 | Handoff #978. Early `W(A/I)` has its `p`-torsion-free restriction; the general Frobenius/completed-tensor theorem follows `Lη` in PR3. |
| /28 | Handoff #978. Relative and absolute Nygaard filtrations, twists and syntomic fibres have distinct owners; formal and scheme syntomic sites are different inputs. |
| /29 | Local no-op; handoff #978. WCart's formal quotient on `p`-nilpotent test rings is not an ordinary affine scheme; use completed QCoh/Perf. |
| /30 | Handoff #978, with #731 as extended-Kisin supplier. Lisse `ℤ_p` descent needs completion and finite mod-p data; the extended-Robba dictionary and slope-zero theorem target finite-free lattices, not all torsion modules. |
| /31 | Local no-op; handoff #964. Reuse F1 dagger carriers while retaining RD's imperfect-residue/Cohen/Frobenius-lift and relative fringe-Robba work. Scalar Bézout is not relative Bézout. |
| /32 | Local reader correction accepted. #964 owns ordinary comparison on tubes and strata; #686 owns the AG2.4 boundary spectral sequence. Distinguish 6.8 from 6.21 and pass 6.22/6.24 through the sequence. General log variants remain proof obligations. |
| /33 | Local no-op; handoff #964. The chosen finite-étale-affine-space neighborhood point must be smooth. L5 geometric descent is not rigid-cohomological descent. |
| /34 | Handoff #964. Global index follows RD4 cohomology; RD1 owns local irregularity. Irregularity–Swan equality and the equal-characteristic R01.3 input remain separate. |
| /35 | Handoff #708. DD5 uses Q0's elementary integral perfectoid covers, not late Q3 André inputs. |
| /36 | Handoff #704/#708. CR0 owns classical PD; DD4 owns the regular/lci derived comparison. An announced derived envelope is not a constructed envelope or derived de Rham by name. |

The explicit receiving-body assignments checked were: #664 `/1,3,9,10,11,15,17,21`; #665 `/13`; #685 `/22`; #686 `/32`; #687 `/22`; #697 `/3,4,23`; #704 `/2,8,12,16,36`; #705 `/14`; #708 `/7,35,36`; #731 `/4,5`; #757 `/3`; #964 `/31,32,33,34`; #968 `/3,17,18,19,20,21`; #969 `/22`; #978 `/4,6,24,25,26,27,28,29,30`; #985 `/17,21`. Some additional low-severity assignments exist but are outside this job. No receiving blueprint or issue body was edited.

## Fresh source reading and pinned library

Reading date: 2 October 2026. Downloads are not full-paper reading claims. The packet's existing source histories are preserved; the following hashes identify this review's artifacts.

| Public source | Actual bounded passages read; SHA-256 |
|---|---|
| [Tate](https://www.math.purdue.edu/~tongliu/teaching/598/p-divisible.pdf) | Images printed pp.164–165,176–177,180–183: discriminant/formal linear term, character theorem, dual Hodge–Tate corollary, Proposition 12 and its complete stabilization proof. `720bf7128d4f048853435b083d18d0d863056c1f991942192a7f00daa7e424aa` |
| [Faltings 1983](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf) | Images pp.359–360,364: local count, determinant and Raynaud application. This artifact differs from the older packet hash. `f72a869f4a050e6e4a435cc790f4ac2e47b61fcac35d564041b5f43d89c2f87a` |
| [Raynaud](https://www.numdam.org/item/10.24033/bsmf.1779.pdf) | Text and images pp.271–272,279: §4 hypotheses, 4.1.1 and its displayed determinant computation, absolute different. Not a proof of the outstanding Fitting/differential comparison. `05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe` |
| [Grosse-Klönne](https://arxiv.org/pdf/1408.3329v1) | PDF pp.22–24, especially complete 5.1 statement/proof and 5.2 sketch. `f75311cc7638b225ec79a528d59abdc71f3cf7e3270ff081287c328d60cb071b` |
| [HLTT](https://arxiv.org/pdf/1411.6717v1) | PDF pp.189–190,207–208: 6.8 comparison/functoriality proof, 6.21 spectral sequence and 6.22/6.24 proof routes. `66b646fa40ec558b96eeb1c06456051398dbe2021de3d864b4930da001b647f6` |
| [BMS](https://arxiv.org/pdf/1602.03148v3) | PDF pp.22–23: 3.9/3.10 statements and proofs, 3.11 primitive criterion. `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| [Scholze 2013](https://arxiv.org/pdf/1205.3463v2) | PDF pp.35–36: 6.1 definitions, 6.3 kernel proof, 6.4 graded description in the mixed-characteristic perfectoid-field setting. `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959` |
| [Diamonds](https://arxiv.org/pdf/1709.07343v4) | PDF pp.17–18: 3.14 theta/kernel and 3.16 regularity, including proofs for general Tate pairs. `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc` |

The 1984 erratum's literal wording and SGA 7 orthogonality provenance are inherited from the preceding independent review, not freshly reread here. Tate's public Proposition 12 independently verifies the direct-summand and tail argument. The original Berthelot/Chiarellotto proofs, entire HLTT boundary construction, general different comparison, Milne, SGA 7 and the other findings' complete literature were not reread. No new source-error allegation is made: the two new errors are planning examples.

Both actual library heads match the required pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the following actual statements with surrounding hypotheses:

- `PreTilt` (`Mathlib/RingTheory/Perfection.lean:634`) is algebraic perfection of `ModP`, not topological tilting by itself.
- `PreTilt.untilt` (`Perfectoid/Untilt.lean:49`) is multiplicative, with prime/nonunit and adic-completeness hypotheses.
- `WittVector.frobeniusEquiv` (`WittVector/Frobenius.lean:286`) requires `PerfectRing`, with the characteristic-p setup.
- `WittVector.fontaineTheta`, `fontaineTheta_teichmuller`, root-level `surjective_fontaineTheta` (`Perfectoid/FontaineTheta.lean:165,182,195`) keep prime/nonunit and adic completeness; surjectivity additionally requires surjective Frobenius mod p.
- `fontaineThetaInvertP`, `BDeRhamPlus`, `BDeRham` (`Perfectoid/BDeRham.lean:63,77,90`) localize, complete and localize at kernel generators. The file leaves extended theta, DVR and principal kernel as TODOs and explicitly has zero characteristic-p constructions; it is not RF2's general ramified-Witt construction.
- `Algebra.normalizedTrace` (`FieldTheory/NormalizedTrace.lean:81`) is an algebraic linear map with `Algebra.IsIntegral`. It does not state the analytic bounds/completion needed by /20.

Read all six AUDIT-09 R28 entries in `data/library-coverage.json`, including their overlaps and integral/field-level boundaries. There are no PerfectoidSpaces or AdicSpacesPartII entries there; this audit cannot certify those packets' completeness. The remaining baseline names/modules were checked against the declaration index by the packet validators, not all freshly statement-audited here.

## Synchronization, preservation and checks

Before my acceptance corrections, all **1,950 checked Faltings strings** matched their reader positions: per-node statements, hypotheses, proof steps, acceptance, APIs, uses, tests, prerequisites, realises, planets and source IDs/locators/matches; plus gaps, requests and baseline references/modules/descriptions. Source excerpts were excluded from this mechanical check. Its layer counts are **12,9,8,8,12,7**, total **56**, with **29 APIs,17 tests,55 baseline declarations,12 gaps,37 requests,22 source issues**. All three changed Perfectoid use records and all eight Adic uses matched. After the corrections, Faltings has exactly the new acceptance mismatch described above; Perfectoid's unchanged use records still match, while its acceptance replacement/addition need reader synchronization.

The comparison normalizes whitespace, Markdown backticks and escaped pipes, then checks values within the matching Faltings node section. It does not establish mathematical correctness of every inherited node. The following shorter reproducer checks current core fields and the precise remaining Faltings mismatch from the repository root:

```python
import json, re
from pathlib import Path
b = Path('research/blueprint')
norm = lambda s: re.sub(r'\s+', ' ', s.replace('\\|', '|').replace('`', '')).strip()
def strings(x):
    if isinstance(x, str): yield x
    elif isinstance(x, list):
        for y in x: yield from strings(y)
    elif isinstance(x, dict):
        for y in x.values(): yield from strings(y)
k = 'FaltingsFinitenessAndIsogenyTheorems'
p = json.loads((b/'packets'/f'{k}.json').read_text())
r = (b/'readmes'/f'{k}.md').read_text()
h = list(re.finditer(r'^### `([^`]+)`[^\n]*', r, re.M))
sec = {m[1]: norm(r[m.end():h[i+1].start() if i+1<len(h) else len(r)]) for i,m in enumerate(h)}
missing = []
for n in p['nodes']:
    for f in ['statement','hypotheses','proofSteps','acceptance','api','uses','tests',
              'prerequisites','upstreamPrerequisites','realises','planet']:
        for s in strings(n.get(f, [])):
            if norm(s) not in sec[n['id']]: missing.append((n['id'],f,s))
assert len(missing) == 1 and missing[0][1] == 'acceptance'
assert missing[0][0].endswith('inertia-triviality-on-the-quotient-by-the-l-divisible-group-of-the-formal-completion')
print('Exactly the documented cyclotomic-inertia acceptance update remains.')
```

Semantic comparison against `451beeb` confirms only the two specified node acceptance lists, three review replacements/history appends and one suggested-file comment changed. All node IDs, source-issue verdicts, coverage, requests, baseline citations, APIs, tests, prerequisites, planets and other nodes are preserved. The Faltings and Adic suggested files remain byte-identical; no reader, atlas, campaign, link map, restructuring proposal or upstream roadmap was edited or promoted.

- `scripts/check_blueprint.py` with the pinned declaration index: all three packets pass, **0 errors,0 warnings**, with **56,326,537 nodes** respectively. This also checks local prerequisite closure; an unfinished external supplier remains a request.
- No link map or proposal is under review, so `check_links.py` and `check_restructure.py` are not applicable.
- `research/blueprint/intake.py check-files` passes for the five changed authorized deliverables; `git diff --check` passes.
- **Lean not compiled.** Neither pinned checkout has an existing root build. No Lake project, cache download, build or language server was started. Proposed signatures and the negative examples are not claimed to be formalized.

The next authorized fixes are concrete: synchronize the one Faltings acceptance bullet and the two Perfectoid acceptance items, and continue the already unfinished comprehensive Perfectoid review. The different-comparison and early Tate–Sen requests remain explicit proof work rather than additional hidden failures of this reader fix.
