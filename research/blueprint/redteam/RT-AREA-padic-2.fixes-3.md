# RT-AREA-padic-2: round-three fixes

Job `FIX-RT-AREA-padic-2~3`, issue [#5537](https://github.com/CBirkbeck/tauceti-explorer/issues/5537). Worker: **Codex**, session **codex-rtOQ9t**, 2 October 2026. Base: `56d7d96`. This report covers the 36 confirmed high/medium findings `/1`–`/36`, following [REV-FIX-RT-AREA-padic-2~2](../reviews/REV-FIX-RT-AREA-padic-2~2.md). It does not reopen the remaining low-severity findings or rejected findings.

The current packets already contain the reviewer's mathematical repairs. This round completes the outstanding reader synchronization: all **56 Faltings nodes** replace the old 32-node presentation, and the Adic reader distinguishes ordinary dagger-tube comparison from the boundary-stratum spectral sequence. The Perfectoid reader already contains the corrected three supplier-use records and needs no edit for these findings. No packet or suggested declaration was changed merely to repeat a repair already made.

The packet review objects, `reviewHistory`, later `FIX-RT-AREA-padic-1~2` changes, source-issue verdicts, node identifiers, baseline references, APIs, tests, planets, coverage records, gaps and requests are preserved unchanged. **Faltings and PerfectoidSpaces--P0 retain `needs_changes`; AdicSpacesPartII retains acceptance for the scoped fixes.** This worker does not replace an independent review verdict. The broader unfinished Perfectoid review is not completed by these use-record corrections.

## What changed locally

### Faltings: reader synchronization for /5 and /20

[FaltingsFinitenessAndIsogenyTheorems.md](../readmes/FaltingsFinitenessAndIsogenyTheorems.md) now states all 56 packet nodes grouped under their six layers, including the 24 nodes added by the earlier independent blueprint review. It reproduces the current statements, hypotheses, proof outlines, acceptance criteria, APIs, uses, tests, prerequisites, upstream prerequisites and planets. It includes all 55 baseline declarations, 12 gaps, 37 requests and 22 source-issue records, with historical provenance distinguished from this round's limited fresh reading. The old introduction's counts (32 nodes, 25 API items, 27 baseline declarations, 13 gaps, four requests) are replaced by the packet's actual counts: **56, 29, 55, 12, 37**; the 17 test specifications remain.

The six changed supplier nodes from round two and its review are now visible in the reader. In particular:

- Tate Proposition 2 is a **discriminant** formula. The invariant-differential count is obtained from the formal-group linear term: multiplication by `ℓ^n` acts on invariant differentials as `ℓ^n`, giving `(R_i/ℓ^nR_i)^d` and cardinality `ℓ^(n m_i d)`. This remains an R07.1 supplier obligation.
- Tate Proposition 12 requires a Galois-stable **direct summand** of the Tate module. The closure node and suggested `erratum_a_shift` already express this as saturation. The negative example `W = ℓℤ_ℓ ⊂ ℤ_ℓ` is retained. Stabilizing the finite-level coordinate orders gives a divisible **tail**, not divisibility of the original closures or a closed immersion of the resulting integral model.
- The covariant Tate-module Hodge–Tate twist is positive. Tate's local character criterion gives finite **inertia**; the global finite-order conclusion also requires the separate class-field argument over ℚ.
- Raynaud 4.1.1 has the strictly henselian mixed-characteristic standing hypothesis and `e ≤ ℓ−1`. The Faltings application has `e = 1` after strict henselization. Identifying the absolute different with the length of invariant differentials is still a requested, unread proof input; inspecting Définition 8 does not establish it.
- The three R28.2 prerequisites on `PadicHodgeTheory:R06.1` and the associated request are **provisional parent-stage references** to an early Tate–Sen substage. They do not authorize a whole-stage `R06.1 → R07.1` edge, which would recreate the diagnosed cycle. Retarget them only when that early substage exists. The supplier proofs belong to #731 and #968.

The suggested file already has the saturation hypothesis `∀ x, (ℓ : ℤ_[ℓ]) • x ∈ W → x ∈ W`. It was inspected and preserved. The reader is synchronized to the reviewed packet, not a new mathematical certification of every inherited node.

### Adic: ordinary comparison and boundary spectral sequence for /32

[AdicSpacesPartII.md](../readmes/AdicSpacesPartII.md) corrects the ownership overview, F1 comparison/coverage explanation and placement notes. The uses of both `F1/dagger-de-rham-complex` and `F1/compact-support-log-complex` are copied from the current reviewed packet, including the two corrected AG2.4 records and their other six uses.

The comparison supplied by RD.4 is **ordinary** de Rham cohomology of the dagger tube of the special fibre, under the smooth quasi-projective hypotheses of HLTT Lemma 6.8. Grosse-Klönne Theorem 5.1(c) uses the open dagger tube `]Y[` inside the partially proper dagger space attached to `]Ȳ[`, with the formal ambient space smooth along `Y`.

HLTT Lemma 6.21 instead constructs a spectral sequence

`E₁^{i,j} = H^i_rig(∂^(j)Y/K) ⇒ H^(i+j)_{c−∂}(Y/K)`.

AG2.4 owns this boundary construction and its slope comparison. It applies Lemma 6.8 **on strata**, then passes RD.5 finiteness and RD.6 Frobenius weights through the spectral sequence (Corollaries 6.22 and 6.24). Its abutment is not identified directly with a single ordinary rigid cohomology group by Lemma 6.8. Generic logarithmic and compact-support comparison adapters require separate proofs; Grosse-Klönne Remark 5.2 is a sketch, not their complete proof.

The existing `(P¹, {0,∞})` test has boundary-supported `H⁰ = 0`, whereas ordinary cohomology of the complement contains constants. This distinction is now explicit in the reader's acceptance discussion. The existing rigid-disc counterexample also remains: completing a dagger space does not preserve its de Rham cohomology in general. The packet's corrected coverage/use records and the suggested file's E₁/abutment comment were inspected and preserved.

The older round-one report's AG2.4 prose is outside this issue's deliverables. Its authorized owner must use the correction above; it must not treat the old direct-comparison claim as an accepted theorem. #686 carries the AG2.4 application and #964 the RD comparison work.

### Perfectoid: preserve /17 and /21 without promoting its review

The three affected P1 use records already agree between the packet and reader:

- `P1/distinguished-element-criterion` supplies regularity/nonzerodivisibility.
- `P1/fontaine-theta-and-primitive-kernel` supplies theta surjectivity, primitive generation and nonzerodivisibility, imported by R06.1. R06.1 checks its selected field element is primitive, its behavior after base change, and the mixed-characteristic rational filtration.
- AI.0 specializes the primitive-kernel theorem to `O_C` through Q0 and identifies its chosen generator. Mathlib's period-ring file still marks the principal-kernel theorem as a TODO.

Neither this ownership repair nor Mathlib's fixed-prime construction absorbs RF2's all-`E` scope, equal characteristic, ramified Witt coefficients, integral divisors or nontrivial graded line bundles. A chosen generator trivializes a rank-one module; a Tate-twist identification needs additional period data. The comprehensive source/dependency/API/test/planet and baseline audit left unfinished by `REV-PerfectoidSpaces--P0` remains that review's outstanding work. No unrelated P0 changes are certified here.

## Disposition of every confirmed finding

**Retained locally** means the existing packet correction was checked in scope and preserved; the present reader synchronization makes it readable. **Handoff** means the unfinished blueprint issue explicitly carries the finding. A handoff is not a proved theorem, an installed dependency edge, a completed source audit or closure of the owning blueprint. All 16 issue bodies below were fetched on 2 October 2026; every stated assignment is present and all issues remain open.

| Finding | Local action or authorized handoff, with the verifier's qualification |
|---|---|
| /1 | Handoff #664 (AI.2). BMS supplies full faithfulness; essential surjectivity uses the Scholze–Weinstein finite-free equivalence over algebraically closed `C`. Do not call the inverse exact; import Witt isocrystals rather than duplicate them. |
| /2 | Handoff #704 (CR.2). DD0 owns ordinary de Rham foundations; CR0 owns PD algebra and envelopes. Comparison/base change needs its stated hypotheses. |
| /3 | Handoff #664, #697, #757, #968. Separate local `Rν_*A_inf` from the proper global primitive comparison; use corrected covers/completion and keep Scholze 5.1 distinct from BMS 5.1. |
| /4 | Handoff #731, #697, #978. The Kummer tower is not the cyclotomic tower. Preserve the integral crystalline-lattice weight range and annulus/slope hypotheses. |
| /5 | Retained locally in the six Faltings supplier nodes, sources and R07.1 requests; synchronized the whole Faltings reader. #731 retains Tate/Raynaud supplier proofs. Keep the discriminant/differential distinction, saturation, positive twist, finite-inertia/global distinction and Raynaud hypotheses. The different comparison is still requested. Raynaud 4.2's deformation argument is distinct from 4.1.1. |
| /6 | Handoff #978 (PR.4). Bhatt–Scholze 9.1 is the derived comparison for the stated formal setup; it is not unrestricted syntomic degree-zero comparison. |
| /7 | Handoff #708 (DD.6). Correct the printed implication from surjections with lci target to lci morphisms using the regular-sequence formulation. The dual-number-type quotient `Fp[x,y]/(x²,xy,y²)` prevents the overbroad claim. Do not assert an ambiguous filtered-colimit generalization is proved. |
| /8 | Handoff #704 (CR.4). Relative de Rham–Witt uses the `ℤ_(p)` setup; impose the nilpotence/comparison and Tor-independence conditions rather than unrestricted perfectoid base change. |
| /9 | Handoff #664 (AI.3); no affected local node. Ordinary Witt sheaves and derived completion are different inputs. Remove only the true duplication. |
| /10 | Handoff #664 (AI.3). The arrow is ordinary Witt vectors to the completion, not an unproved reverse arrow. Structural completion precedes inverting `p`, theta-adic completion and late P8 sheafification. |
| /11 | Handoff #664 (AI.5). CR3 owns the Frobenius-isogeny child; the later rational comparison at 13.21 uses the specified `k → O/p` section. |
| /12 | Handoff #704 (CR.4). Classical Cartier belongs to DD3. Retain the Frobenius twist, lift and `p`-torsion-free conditions. |
| /13 | Handoff #665 (AI.6). CP3's canonical de Rham period comparison is imported by AI6's proper semistable comparison; do not duplicate the canonical morphism. |
| /14 | Handoff #705 (CR.5). Beilinson's non-fine integral quasi-coherent logarithmic finite-level PD setting is not a theorem for arbitrary mixed-base envelopes. |
| /15 | Handoff #664 (AI.1); the generic Koszul owner is DD1 under #708, as the verifier specifies. Preserve the degree shift `d`; AI1 owns its group-cohomology and `Lη` application. #708's explicit original issue list carries /7, /35, /36; the additional DD1 ownership obligation is recorded here, not claimed as an explicit /15 assignment there. |
| /16 | Handoff #704 (CR.4). Pro-exactness uses `R−F`, `p^r` and `R^(s−r)`; it is not finite-level injectivity. Keep the topologies separate. |
| /17 | Retained locally: P1's theta/primitive-kernel use identifies the AI.0 specialization through Q0. Its reader already matches. Remaining AI.0 baseline/API work is #664; actual pinned hypotheses and TODO boundaries are recorded below. |
| /18 | Handoff #968 (R06.2). Berger's route imports RD slope theory and PG2 annulus coefficients in their common range. Do not substitute an unproved alternative with a cyclic supplier path. |
| /19 | Handoff #968 (R06.3). PG2's Robba inputs and R01.2's Weil–Deligne owner are separate. Use Berger's appendix corrections and distinguish coefficient primes. |
| /20 | Retained locally: Faltings' early Tate–Sen request and three provisional R28.2 references are exposed in the synchronized reader. #968 implements normalized trace bounds and completed cyclotomic descent. Do not add the cyclic whole-stage `R06.1 → R07.1` edge; existing R07.2-to-R28.2 and R07.1-to-R28.5 routes do not prove the missing early theorem. |
| /21 | Retained locally: the two revised Perfectoid supplier-use records are already synchronized; no further local edit. Handoff #968 and #985 preserves R06.1's mixed-characteristic fixed-`ℚ_p` overlap and RF2's all-`E`, equal-characteristic, integral-divisor and graded-line scope. |
| /22 | Handoff #685, #687, #969. R06 owns general comparison theorems; R19/AG2 own their named automorphic applications. Imported general machinery must not be replanned downstream. |
| /23 | Handoff #697. The first-Chern-class comparison is not all higher Chern classes or the projective-bundle formula; expose the formal/adic adapter. |
| /24 | Handoff #978. Arc and `arc_t` descent are explicit requests to the proposed owner. A proposed paper route or perfectoid `v`-descent is not an installed generic-fibre theorem supplier. |
| /25 | Handoff #978; no affected local node. The Spec/Spa statement concerns torsion cohomology, not equivalence of all sites; `ℤ_p` requires a derived inverse limit. |
| /26 | Handoff #978 (PR.1). State the Cartier Frobenius twist and Bockstein compatibility. |
| /27 | Handoff #978. The early `W(A/I)` construction has the `p`-torsion-free restriction; the general construction follows `Lη` in PR3. Do not reverse that dependency. |
| /28 | Handoff #978. Separate relative and absolute Nygaard filtrations and their twists, and keep syntomic ownership explicit. Formal and scheme syntomic sites are different inputs. |
| /29 | Handoff #978; no affected local node. `WCart_0` as a formal quotient in the `p`-nilpotent setting is not an ordinary affine scheme; use completed quasi-coherent categories. |
| /30 | Handoff #978 (PR.7). Lisse `ℤ_p` descent needs completion and finite mod-`p` data. The extended-Robba dictionary/slope-zero theorem is finite free, not every module. |
| /31 | Handoff #964 (RD.0); no affected local node. Preserve imperfect-residue-field/Cohen-ring, Frobenius-lift and relative fringe-Robba work. The scalar Bézout theorem does not settle the relative case. |
| /32 | Retained the corrected Adic packet and suggested comment; synchronized the overview, F1 explanation and two node-use sections in the reader. #964 owns ordinary comparison on tubes; #686 owns AG2.4's boundary spectral sequence. Keep HLTT 6.8 distinct from 6.21, and use 6.22/6.24 for finiteness/weights. Generic log variants need separate proofs. |
| /33 | Handoff #964 (RD.5); no affected local node. The affine-cover point must be smooth; L5's geometric descent is not the rigid-cohomology descent theorem. |
| /34 | Handoff #964 (RD.6). Place the global index formula after RD4 cohomology; RD1 owns local irregularity. Equality of irregularity and Swan conductor is separate, including the equal-characteristic R01.3 input. |
| /35 | Handoff #708 (DD.5). Q0 supplies integral DD5 covers, not the late André theorem. |
| /36 | Handoff #704 and #708. CR0 owns classical PD envelopes; DD4 owns the regular/lci comparison. Announcing derived envelopes does not construct them. |

### Receiving jobs

| Issue | Blueprint job | Findings explicitly carried |
|---|---|---|
| [#664](https://github.com/CBirkbeck/tauceti-explorer/issues/664) | BP-AInfCohomology--AI.0 | /1, /3, /9, /10, /11, /15, /17 |
| [#665](https://github.com/CBirkbeck/tauceti-explorer/issues/665) | BP-AInfCohomology--AI.6 | /13 |
| [#685](https://github.com/CBirkbeck/tauceti-explorer/issues/685) | BP-AutomorphicGaloisRepresentations | /22 |
| [#686](https://github.com/CBirkbeck/tauceti-explorer/issues/686) | BP-AutomorphicGaloisRepresentationsPartII--AG2.0 | /32 (AG2.4 application within that part) |
| [#687](https://github.com/CBirkbeck/tauceti-explorer/issues/687) | BP-AutomorphicGaloisRepresentationsPartII--AG2.6 | /22 |
| [#697](https://github.com/CBirkbeck/tauceti-explorer/issues/697) | BP-CohomologyComparisons | /3, /4, /23 |
| [#704](https://github.com/CBirkbeck/tauceti-explorer/issues/704) | BP-CrystallineCohomology--CR.0 | /2, /8, /12, /16, /36 |
| [#705](https://github.com/CBirkbeck/tauceti-explorer/issues/705) | BP-CrystallineCohomology--CR.5 | /14 |
| [#708](https://github.com/CBirkbeck/tauceti-explorer/issues/708) | BP-DerivedDeRhamCohomology | /7, /35, /36; /15's generic DD1 ownership is additionally qualified above |
| [#731](https://github.com/CBirkbeck/tauceti-explorer/issues/731) | BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory | /4, /5 |
| [#757](https://github.com/CBirkbeck/tauceti-explorer/issues/757) | BP-IgusaVarietiesAndTorsionConcentration | /3 |
| [#964](https://github.com/CBirkbeck/tauceti-explorer/issues/964) | BP-PadicDifferentialEquationsAndRigidCohomology | /31, /32, /33, /34 |
| [#968](https://github.com/CBirkbeck/tauceti-explorer/issues/968) | BP-PadicHodgeTheory--P7 | /3, /18, /19, /20, /21 |
| [#969](https://github.com/CBirkbeck/tauceti-explorer/issues/969) | BP-PadicHodgeTheory--R06.5 | /22 |
| [#978](https://github.com/CBirkbeck/tauceti-explorer/issues/978) | BP-PrismaticCohomology--PR.0 | /4, /6, /24, /25, /26, /27, /28, /29, /30 |
| [#985](https://github.com/CBirkbeck/tauceti-explorer/issues/985) | BP-RelativeFarguesFontaine--RF0 | /21 |

No packets for these unfinished blueprints were written. The earlier report's C1 early Tate–Sen split and C2 comparison separation remain qualified ownership proposals, not edges installed by this fix.

## Pinned-library verification

Read the actual statements using the pinned Git objects, since the shared working checkout heads have advanced:

- `PreTilt` is `Perfection (ModP O p) p`, not by itself topological tilting.
- `PreTilt.untilt` is a multiplicative map with prime/nonunit and `p`-adic-completeness hypotheses.
- `WittVector.frobeniusEquiv` requires `PerfectRing R p` (with the surrounding characteristic/prime setup).
- `WittVector.fontaineTheta` and `fontaineTheta_teichmuller` require the stated prime/nonunit and adic-completeness setup; root-level `surjective_fontaineTheta` additionally assumes Frobenius on `R/pR` surjective.
- `fontaineThetaInvertP`, `BDeRhamPlus`, `BDeRham` localize, complete and localize at kernel generators. Their file explicitly leaves extended theta, the DVR theorem and the principal-kernel theorem as TODOs, and states that its characteristic-`p` construction is zero. It does not supply RF2's general ramified-Witt divisor construction.

The reviewed `data/library-coverage.json` AUDIT-09 entries for all six R28 layers were read. They retain the finite-flat/p-divisible and integral-differential supplier boundary at R07.1 and the overlaps with other owners. There are no corresponding reviewed layer entries for PerfectoidSpaces or AdicSpacesPartII; the audit cannot certify their completeness. Other inherited baseline names were checked by the packet checker against the shared declaration index whose metadata specifies both required pins; they were not all freshly statement-audited.

## Public passages freshly checked

Reading date: **2 October 2026**. Downloads are not full-paper reading claims. The unmodified packet source ledgers remain historical; the hashes here identify only this round's public artifacts.

| Public source | Passages checked and SHA-256 |
|---|---|
| [Tate, p-divisible groups](https://www.math.purdue.edu/~tongliu/teaching/598/p-divisible.pdf) | Page images pp.164–165 (Proposition 2/formal linear term), 176–177 (character criterion), 180–183 (covariant Hodge–Tate corollary, Proposition 12 and tail proof). `720bf7128d4f048853435b083d18d0d863056c1f991942192a7f00daa7e424aa` |
| [Faltings 1983, GDZ](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf) | Page images pp.359–360 and 364, only the local count, determinant and Raynaud application. `f72a869f4a050e6e4a435cc790f4ac2e47b61fcac35d564041b5f43d89c2f87a` differs from the inherited packet hash. |
| [Raynaud 1974](https://www.numdam.org/item/10.24033/bsmf.1779.pdf) | Page images pp.271–272 and 279: section-4 hypotheses, 4.1.1 and absolute different. `05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe` |
| [Grosse-Klönne, dagger spaces](https://arxiv.org/pdf/1408.3329v1) | PDF pp.22–24, Theorem 5.1 and Remark 5.2 with their hypotheses. `f75311cc7638b225ec79a528d59abdc71f3cf7e3270ff081287c328d60cb071b` |
| [HLTT](https://arxiv.org/pdf/1411.6717v1) | PDF pp.189–190 and 207–208: 6.8 including functoriality, 6.21, 6.22, 6.24. `66b646fa40ec558b96eeb1c06456051398dbe2021de3d864b4930da001b647f6` |
| [BMS](https://arxiv.org/pdf/1602.03148v3) | PDF pp.22–23, Lemma 3.10 and Remark 3.11. `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| [Scholze 2013](https://arxiv.org/pdf/1205.3463v2) | PDF pp.35–36, 6.1, 6.3, 6.4 and their mixed-characteristic perfectoid-field setup. `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959` |
| [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4) | PDF pp.17–18, Lemmas 3.14/3.16 and proof for general perfectoid Tate pairs. `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc` |

The [Faltings 1984 erratum endpoint](https://link.springer.com/content/pdf/10.1007/BF01388572.pdf) returned an HTML cookie/access page here. Its page-381 text and the distinction between its two shifts are inherited from the independent round-two review, not freshly reread in this round. Tate's public pp.181–182 independently confirm the direct-summand hypothesis and stabilization argument used by the affected node. The general different/Fitting comparison, Berthelot/Chiarellotto proofs, the whole HLTT boundary construction, Milne and SGA 7 were not reread. The other findings rely on the verified finding records and qualified receiving-job handoffs, not a new independent audit of their whole source literature.

## Validation

- Ran `scripts/check_blueprint.py` on all three packets with the declaration index pinned to Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: **zero errors, zero warnings**.
- Reader/packet synchronization checks cover all 56 distinct Faltings nodes, statements, hypotheses, proof steps, acceptance criteria, API/test/use records and prerequisites; the six layer counts, 29 APIs, 17 tests, 55 baseline references, 12 gaps and 37 requests agree. All eight use records of the affected Adic nodes match the packet. The three Perfectoid use records already matched and were preserved.
- Preservation check: all three packet files and all three suggested Lean files are byte-identical to the claimed base. The old reviews, histories and subsequent p-adic-1 work are untouched. Only the two reader documents and this report changed, within the issue's deliverable paths.
- Verified each assignment in the 16 receiving-issue bodies and the complete `/1`–`/36` disposition ledger; no new blueprint was written for an unfinished receiving job.
- `git diff --check` passed. Existing negative controls remain visible: nonsaturated `ℓℤ_ℓ`, the unshifted closure tower, the boundary-supported `H⁰ = 0` versus constants on the complement, and the dagger/rigid closed-disc distinction.
- **Lean not compiled.** No existing build at both required pins was available: the shared checkout heads differ and the root Tau Ceti/Mathlib build artifacts are absent. The suggested files are unchanged; no Lake project, cache download, build or language server was started.

Independent `REV-FIX-RT-AREA-padic-2~3` should assess the reader corrections and inherited local supplier repairs, while preserving the broader Perfectoid review obligations and the explicit different-comparison and early Tate–Sen requests. A qualified handoff does not close any of those proof obligations.
