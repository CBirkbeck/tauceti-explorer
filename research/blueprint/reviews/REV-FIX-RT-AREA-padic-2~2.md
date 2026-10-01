# Independent review of FIX-RT-AREA-padic-2~2

Reviewer: Codex, session `codex-J6LwjP`. Date: 2026-10-01. Job: `REV-FIX-RT-AREA-padic-2~2`, issue #5154. Reviewed fix: Claude Code `cc-c2c06b`, commit `53f4c49` (PR #5266), its round-two report, and the applicable round-one edits including C1–C2. I did not write that fix, either preceding fix report, these blueprints, or their preceding reviews.

The local supplier corrections are sound after two repairs made here: make Tate's direct-summand hypothesis explicit, and distinguish the boundary spectral sequence from an ordinary dagger–rigid comparison. **AdicSpacesPartII is accepted for these fixes. Faltings and PerfectoidSpaces--P0 retain needs_changes from their preceding reviews.** Accepting a narrow supplier edit must not promote a packet whose broader review is still incomplete. Earlier review records, including their checked-node ledgers, are preserved in `reviewHistory`.

## Scope and method

Read all 46 original finding records and their verification records. The fix job covers the 36 confirmed high/medium findings, /1–/36. Its applied packet edits concern /5, /17, /20, /21 and /32: six Faltings nodes, three Perfectoid P1 use records, four Adic F1 use records, associated coverage, sources and requests. I compared the original fix diff with the current packet copies. The later `FIX-RT-AREA-padic-1~2` changes in P0 are preserved; this review does not certify them.

For each applied correction I checked the actual statement, hypotheses, supplier, source and existing acceptance examples. No new definition or theorem node was introduced by the fix. The additional saturation hypothesis has a negative example and a corresponding suggested Lean signature change. The Adic correction changes use records and coverage, with a suggested-file explanation; its existing tests already distinguish ordinary cohomology from boundary-supported cohomology.

I checked the repository's reviewed `data/library-coverage.json`: AUDIT-09 records the R28 integral differential and p-divisible-group inputs as absent, with R07.1 as their planned supplier. That file has no layer entries for PerfectoidSpaces or AdicSpacesPartII; it cannot certify their completeness. I read the specific pinned Mathlib declarations needed for the period-ring reuse claim. No blanket statement that all the inherited baseline citations were re-read is intended.

The other findings are **handoffs**, not completed mathematical corrections in these three files. I fetched the current blueprint issue bodies and verified that every assignment in round two's table is present. The issue bodies reproduce original proposed fixes, sometimes without the verifier's qualifications. The qualifications below and the verified report must govern implementation. This is not an independent certification of every theorem or proposed edge in the 2,000-line round-one report.

## Corrections made in this review

### Tate's closure theorem: /5

`R28.3/closure-tower-becomes-l-divisible-only-after-a-shift` invoked Tate Proposition 12 using an unspecified invariant “sublattice.” Tate explicitly requires a direct summand. I made saturation explicit in the statement, hypotheses and proof, added the p.181 source locator, and added the negative example `W = lℤ_l ⊂ ℤ_l`. The suggested `erratum_a_shift` now requires `l • x ∈ W → x ∈ W` in addition to stability and containment in the formal Tate submodule. The application must prove this for its intersection of saturated submodules. The definitions remain proposed supplier interfaces, not implemented constructions.

The shift argument itself agrees with Tate p.182 and the erratum: finite-level coordinate orders stabilize, giving a divisible tail. It does not make the original closure tower divisible or identify the eventual map with a closed immersion over the valuation ring.

The other Faltings edits are right in scope. Proposition 2 is a discriminant formula; the invariant-differential count follows from the formal-group linear term, as the revised proof says. The Hodge–Tate twist is positive on the covariant Tate module. The Tate–Sen character criterion gives finiteness **on inertia**; the global finite-order assertion also uses the separate class-field argument. Raynaud 4.1.1 requires the strictly henselian mixed-characteristic base and `e ≤ l−1`; the application has `e = 1`. The different/invariant-differential identification remains an explicit requested, unread input. Removing the obsolete “no supplier” gap does not establish that comparison.

`R06.1` in the Faltings request is an expressly provisional parent-stage reference. C1 assigns the actual theorem to an early Tate–Sen substage. The consumer change does not authorize a whole-stage `R06.1 → R07.1` edge, which round one diagnosed as cyclic. Once the substage exists, retarget the three R28.2 prerequisites and the request to it. R07.1's supplier implementation belongs to #731, not this review.

### Boundary cohomology: /32

The applied `uses` text in both `F1/dagger-de-rham-complex` and `F1/compact-support-log-complex` identified the whole logarithmic compact-support hypercohomology with rigid cohomology by Grosse-Klönne/HLTT 6.8. That is too strong. The ordinary comparison is for the dagger tube of the special fibre under the smooth quasi-projective hypotheses. HLTT 6.21 instead gives a spectral sequence with rigid cohomology of boundary strata on its E1 page and cuspidal boundary-support cohomology as its abutment.

I corrected both use records, F1's coverage note and the suggested-file explanation. RD.4 supplies the ordinary comparison on strata; RD.5/RD.6 supply the finiteness/weight inputs; AG2.4 constructs its particular boundary spectral sequence and proves the slope comparison. General logarithmic/compact-support comparison variants require their own proofs. Grosse-Klönne Remark 5.2 is not such a complete proof.

The existing test for `(P¹, {0,∞})` computes boundary-supported H0 as zero; ordinary cohomology of the complement has constants. Thus the two complexes cannot be interchanged. The existing rigid-disc counterexample also prevents extending the dagger-tube theorem to an arbitrary completed analytic generic fibre. No duplicate cohomology carrier is added.

### Perfectoid supplier ownership: /17 and /21

The changed P1 use records are correct. P1 supplies surjectivity, primitive kernel generation and nonzerodivisibility. R06.1 checks that Scholze's selected field generator remains primitive after base change and proves the mixed-characteristic rational filtration. AI.0 specializes the kernel theorem to O_C through Q0 and identifies its chosen element. Removing the old tilt use record is appropriate for the deleted downstream generation proof; it does not remove the tilt from the upstream construction of theta.

This does not collapse all relative period rings onto Mathlib's fixed-p constructions. Equal-characteristic divisors, ramified Witt coefficients, integral divisors and nontrivial graded line bundles remain in RF2's scope. A free rank-one description requires the specified generator; a Tate-twist identification requires additional period data.

## Disposition of every finding

“Handed off” means the named unfinished blueprint issue explicitly carries the finding; it does not mean the theorem, dependency edge or source proof is complete. “Accepted locally” concerns only the changed records in the three packets.

| Finding | Verdict and reason |
|---|---|
| /1 | Handed off to #664. BMS does not prove the whole BKF classification: retain the Scholze–Weinstein essential-surjectivity/extension inputs, algebraically closed coefficient field and finite-free scope; do not assert exactness of the inverse. |
| /2 | Handed off to #704. Ordinary de Rham belongs to DD.0; PD de Rham to CR.0, with actual differentiation and qualified base change. No construction is added to these three packets. |
| /3 | Handed off to #664, #697, #757 and #968. Preserve local primitive comparison versus proper global comparison, the corrected cover arguments and derived completion. A named source is not a proof of the missing comparison. |
| /4 | Handed off to #731, #697 and #978. Kummer field-of-norms/étale phi-modules, crystalline lattices and slope inputs remain distinct. Keep coefficient/base-field/weight bounds; cyclotomic PG theory alone does not supply the Kummer tower. |
| /5 | Accepted locally after the saturation repair above. R07.1 requests carry the differential, Hodge–Tate, closure and Raynaud inputs; #731 retains their proof work. Raynaud 4.2's deformation argument is separate from 4.1.1. No general different comparison has been proved here. |
| /6 | Handed off to #978. BS22 9.1 extends beyond smooth formal schemes in its stated derived setting; this does not make every syntomic comparison unrestricted. |
| /7 | Handed off to #708. Bhatt's strict-surjection condition alone does not supply the lci hypothesis needed for the claimed log comparison. Retain the source-error/counterexample distinction. |
| /8 | Handed off to #704. Relative de Rham–Witt allows the source's Z_(p)-base; p-nilpotence belongs to the relevant crystalline comparison, with continuous differentials and qualified base change. |
| /9 | Correct local no-op; broader repair handed to #664. The integral sheaves move from P8 to AI.3. No moved P8 node occurs in the P0 packet's affected records. Do not confuse ordinary Witt sheaves with derived completion. |
| /10 | Handed off to #664. Preserve the actual map from ordinary rational Witt sheaves to rationalized derived completion; do not reverse it without proof or pull the later structural comparison into AI.3. |
| /11 | Handed off to #664. BMS 13.21 needs the later crystalline Frobenius/isogeny input, proper-smooth hypotheses and its coefficient section; merely naming CR.3 is insufficient. |
| /12 | Handed off to #704. Supply DD.3's classical Cartier theorem with its Frobenius twist and lift hypotheses, not a second Cartier constructor. |
| /13 | Handed off to #665. AI.6 must import CP.3's canonical B_dR cohomology for the stated proper semistable comparison. |
| /14 | Handed off to #705. Retain the integral/quasicoherent log-PD setting and finite-level hypotheses; generic coherent-crystal or arbitrary mixed-base assertions are too strong. |
| /15 | Handed off to #664, with DD.1 as common Koszul owner. For cohomological degrees 0 through d the derived-tensor comparison needs its shift by d. AI.1 retains its group-cohomology and décalage applications. |
| /16 | Handed off to #704. R−F and p^r exactness are statements about pro étale sheaves, with R^(s−r); Zariski/étale image agreement is a separate theorem. Do not claim fixed-level injectivity or kernel identities. |
| /17 | Accepted locally for P1→AI.0 specialization; remaining baseline/API work is #664. The pinned declarations have the hypotheses and missing-theorem boundaries described below. |
| /18 | Handed off to #968. The converse to weak admissibility needs the explicit Berger/slope route and coefficient-field scope. The proposed late R06.3 proof must not become an unavailable input to early consumers; its proof interior was not re-audited here. |
| /19 | Handed off to #968. The Berger bridge needs actual Robba/monodromy comparison and the source's corrections; p-adic and prime-to-p Weil–Deligne constructions must not be identified by name. |
| /20 | Accepted locally for Faltings' early-theory request and finite-inertia criterion; stage creation/proof belongs to #968. Apply C1 once. Completed cyclotomic descent is additionally needed for P8's Gamma_k computation. |
| /21 | Accepted locally for the P1 import records. #968 and #985 carry the downstream generator/filtration and fixed-Q_p comparison work. Preserve RF2's all-E/equal-characteristic/integral scope and nontrivial graded lines. |
| /22 | Handed off to #685, #687 and #969. General geometric comparisons remain in R06; modular/Kuga–Sato/Shimura applications use later geometry in R19/AG2. No reversed dependency is justified. |
| /23 | Handed off to #697. Add the actual log-prismatic, integral-classification and Chern suppliers. First Chern classes do not prove higher classes or the projective-bundle formula; scheme-to-adic interfaces also need proof. |
| /24 | Handed off to #978. Arc/arc_t topology and generic-fibre descent are explicit requests to the proposed owner; a paper route or the perfectoid-space v-topology is not a live theorem supplier. |
| /25 | Correct local no-op; #978 owns the repair. No Adic F1 theorem changes: the missing inputs are scheme/adic étale cohomology and the source-qualified Spec/Spa comparison, with derived inverse limits for Z_p. |
| /26 | Handed off to #978. PR.1 imports DD.3's polynomial Cartier calculation with its twist, multiplicative structure and Bockstein, rather than an untwisted direct sum. |
| /27 | Handed off to #978. Keep the Witt p-torsion-freeness hypothesis in early PR.1; the general theorem follows from later PR.3's Frobenius–Lη statement. Do not reverse proof order. |
| /28 | Handed off to #978. Relative twists/Nygaard, absolute Nygaard and syntomic fibres have separate owners and explicit imports. Preserve completed tensor products and the formal-scheme/scheme distinction. |
| /29 | Correct local no-op; #978 owns formal-stack inputs. WCart's quotient involves an affine formal scheme and p-nilpotent test rings, not an ordinary affine quotient; completed QCoh/crystal comparisons remain work. |
| /30 | Handed off to #978, with #731 for the extended Kisin supplier. Retain lisse/derived p-complete descent conditions, the extended-Robba/vector-bundle dictionary and weak-admissibility/slope-zero comparison, with finite-free targets. |
| /31 | Correct local no-op; #964 narrows its repeated carrier construction. F1 already owns dagger carriers. Keep RD's actual imperfect-residue/Cohen coefficients, Frobenius choices and relative/fringe Robba work; scalar Bézout results do not prove every relative case. |
| /32 | Corrected locally as above. #964 owns the source-qualified comparison/finiteness/weight nodes; #686 owns the boundary spectral sequence and slope application. A use record does not create those missing theorem nodes. |
| /33 | Correct local no-op; #964 carries the geometric input and L5 import. The finite-étale-affine-space neighborhood needs a smooth chosen point. Rigid-cohomological descent requires its own theorem, not L5's étale descent. |
| /34 | Handed off to #964. Keep local irregularity at RD.1; place the global index theorem after cohomology exists and retain the independent irregularity–Swan theorem and equal-characteristic conductor input. |
| /35 | Handed off to #708. DD.5 needs Q0's integral perfectoid rings; importing the later André extension theorem would reverse the intended elementary-cover construction. |
| /36 | Handed off to #704 and #708. DD.4 owns the regular/lci derived-versus-classical PD comparison. CR.0 supplies classical envelopes. An announced derived-envelope theory is not automatically constructed or identified with derived de Rham. |
| /37 | Outside round two: confirmed low-severity locator correction. Use BMS 4.24, BS22 4.9 and Bhatt–Lurie §2 at their respective twist owners; no second constructor. |
| /38 | Outside round two; verifier rejected it. A supplied general comparison and its downstream abelian specialization do not establish duplication. No change. |
| /39 | Outside round two: confirmed low-severity deformation interfaces. Preserve the finite-flat/p-divisible local-condition restriction; no claim about unrestricted Galois deformations. |
| /40 | Outside round two: confirmed low-severity Raynaud locator correction. Classification is §1/1.4.1 with (**); §3.4 has strictly henselian hypotheses. It is not the §4 determinant input corrected here. |
| /41 | Outside round two; verifier rejected it. The explicitly cited endpoint subcategories are not contradicted merely by nilpotent/unipotent terminology. No change. |
| /42 | Outside round two: confirmed low-severity library supplier wording. Mathlib carriers do not supply their missing topological/Galois comparison theorems; P1's general tilting input remains relevant. |
| /43 | Outside round two: confirmed low-severity late-P7 lattice inputs. Do not move those dependencies into the early annulus prefix. |
| /44 | Outside round two: confirmed low-severity slope-node placement. Move the slope theorem to RD.1 while retaining its local-monodromy suffix at RD.2 and preserving all unread gaps. |
| /45 | Outside round two: confirmed low-severity AI.0→DD.4 input. Regular-kernel/PD reuse is needed for A_cris; this is not fixed by the P1 use record alone. |
| /46 | Outside round two: confirmed low-severity log-prismatic comparison inputs. Keep the common log-smooth/Cartier-type range and distinguish Kummer-étale from ordinary étale cohomology. |

## Pinned library check

Both checkout heads were verified: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Read the definitions/statements, rather than relying on name matches:

- `PreTilt` in `Mathlib/RingTheory/Perfection.lean:634` is the perfection of `ModP`; it does not by itself supply topological tilting.
- `PreTilt.untilt` in `Perfectoid/Untilt.lean:49` is multiplicative, under the p-adic-completeness and nonunit hypotheses.
- `WittVector.frobeniusEquiv` in `WittVector/Frobenius.lean:286` requires the perfect-ring instance.
- `WittVector.fontaineTheta`, `fontaineTheta_teichmuller` and root-level `surjective_fontaineTheta` in `Perfectoid/FontaineTheta.lean:165,182,195`: p is prime/nonunit, the ring is p-adically complete, and surjectivity additionally requires surjective Frobenius modulo p.
- `fontaineThetaInvertP`, `BDeRhamPlus` and `BDeRham` in `Perfectoid/BDeRham.lean:63,77,90`: localization followed by completion and localization at generators. The file explicitly leaves extended theta, the DVR theorem and principal kernel as TODOs. Its characteristic-p construction is zero. It is not the general ramified-Witt divisor construction.

The new saturation condition uses existing module notation and adds no new baseline claim. Other inherited declarations were checked by the packet checker against the pinned declaration index, not all re-read by this review.

## Public sources independently read

The indicated passages were read, including page images for the scanned formulas and erratum. A downloaded paper is not claimed to have been read in full.

| Source | Passages used |
|---|---|
| [Tate, p-divisible groups](https://www.math.purdue.edu/~tongliu/teaching/598/p-divisible.pdf) | Printed pp.164–165: Proposition 2 and invariant differential calculation; pp.176–182: character theorem, Hodge–Tate corollary, Proposition 12 and its proof. Page images checked at pp.164–165,180–183. |
| [Faltings 1983](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf) | Page images pp.359–360 and 364: count, determinant and Raynaud application. This download has a different hash from the inherited record; I do not claim byte identity. |
| [Faltings 1984 erratum](https://link.springer.com/content/pdf/10.1007/BF01388572.pdf) | Entire p.381, including the two distinct repairs and the tail condition. |
| [Raynaud 1974](https://www.numdam.org/item/10.24033/bsmf.1779.pdf) | Page images pp.271–272 and 279: standing hypotheses, 4.1.1, absolute different. The extra Fitting/invariant-differential proof remains outstanding. |
| [Grosse-Klönne, dagger spaces](https://arxiv.org/pdf/1408.3329v1) | PDF pp.22–24, especially Theorem 5.1 and Remark 5.2. |
| [HLTT](https://arxiv.org/pdf/1411.6717v1) | PDF pp.189–190 and 207–208: 6.8, 6.21, 6.22, 6.24 and their stated proof routes. The original Berthelot/Chiarellotto proofs and HLTT's whole boundary construction were not re-read. |
| [BMS](https://arxiv.org/pdf/1602.03148v3) | pp.22–23, Lemma 3.10 and Remark 3.11, distinguishing principal kernel, regular generator and primitive criterion. |
| [Scholze 2013](https://arxiv.org/pdf/1205.3463v2) | pp.35–36, Definition 6.1, Lemma 6.3 and Corollary 6.4, with the mixed-characteristic perfectoid field setup. |
| [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4) | pp.17–18, Lemmas 3.14/3.16 and proof, for general perfectoid Tate pairs. |

SHA-256, in the same order:

```text
720bf7128d4f048853435b083d18d0d863056c1f991942192a7f00daa7e424aa
f72a869f4a050e6e4a435cc790f4ac2e47b61fcac35d564041b5f43d89c2f87a
e9d9269bf52151e3bc606f3b4f3581ef8bd0c2bafbc9dbdc4864b49a534a9734
05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe
f75311cc7638b225ec79a528d59abdc71f3cf7e3270ff081287c328d60cb071b
66b646fa40ec558b96eeb1c06456051398dbe2021de3d864b4930da001b647f6
285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a
ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959
78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc
```

## Remaining work and file verdicts

- **Faltings: needs_changes.** Follows `REV-FaltingsFinitenessAndIsogenyTheorems`: the reader document still reflects 32 nodes rather than the 56-node reviewed packet. Its owner must synchronize it, including this saturation guard and the revised suppliers. The explicit different comparison and provisional Tate–Sen supplier remain visible proof/ownership obligations, not hidden claims of completion.
- **PerfectoidSpaces--P0: needs_changes.** Follows the partial `REV-PerfectoidSpaces--P0`: most baseline statements and the comprehensive source/dependency/API/test/planet audit were not completed there. These three use-record edits do not finish that review or close its general-base gaps. The previous history and subsequent padic-1 work are preserved.
- **AdicSpacesPartII: accepted after correction.** Follows `REV-AdicSpacesPartII`; the scoped /32 changes now preserve the correct comparison/boundary distinction. Unrelated existing gaps remain. Its reader document and the round-one AG2.4 prose should receive the same E1/abutment correction from their authorized owners. They are not deliverables of #5154.

No atlas, campaign text, link map or restructuring proposal was edited or promoted. No links/proposal file was under review, so their dedicated checkers are not applicable. No upstream Tau Ceti roadmap was changed. No source-error finding about Tate or Faltings is added: making the conventional saturated-sublattice meaning explicit is a planning/signature correction.

## Validation

`check_blueprint.py` with the pinned declaration index: all three packets pass with **0 errors, 0 warnings** (56, 326 and 537 nodes respectively).

The suggested Lean files were **not compiled**: no existing build at both pinned commits was available. No build, cache download, Lake project or language server was started. The Faltings edit is a proposed signature guard; the Adic edit is commentary. No claim of formalisation is made.

`research/blueprint/intake.py check-files` on the six changed deliverables: **6 files, 0 problems**. `git diff --check` passed. Semantic diff inspection found only the intended closure-node, two use-record and coverage changes, the three replacement review objects and preserved histories; no baseline, unrelated node or later padic-1 change was altered.
