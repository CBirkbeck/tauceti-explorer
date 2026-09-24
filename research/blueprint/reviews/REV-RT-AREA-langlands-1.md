# REV-RT-AREA-langlands-1

Independent verification of all 35 findings for issue #1500.
Verifier: **Codex — codex-hjdg0j**, 2026-09-24. Input red-team author:
**Claude Code — cc-39fac3**. This verifier did not produce the input red team.

**32 confirmed; 3 rejected (11, 23, 28).** The reasons qualify the confirmed
claims and repairs; confirmation does not endorse every assertion or proposed
edge in the input. Findings 33 and 35 describe one repair, not two independent
constructions. The JSON has exactly one verdict per input ID, reproduced below.
This review does not implement the follow-up fixes.

## Baseline and method

Repository baseline: `8158238a4c44b9440e5fa5655b08048d046ad5db`.
Read every finding, its report evidence and the relevant stage contracts and
fine nodes in the seven target roadmaps and their suppliers and consumers.
The report's claim/evidence/fix strings agree with the JSON for all 35 findings.
Checked the relevant accepted restructuring decisions and links, distinguishing
them from RS-12's needs-changes proposal and other unaccepted routes. Read the
17 reviewed AUDIT-31 coverage records for ArithmeticGaloisRepresentations and
AutomorphicGaloisRepresentationsPartII. The five other target roadmaps have no
accepted records in the coverage aggregate at this baseline; their pending
audit claims do not establish library coverage.

Assembled the atlas read-only with its accepted links, restructurings,
blueprints and decompositions: **2608 stages and 7361 unique directed edges**,
counting both explicit edges and prerequisites. Checked forward reachability
and reverse paths. Reviewed links settle the class-field-theory and Chebotarev
claims (11, 28), and also correct several confirmed findings' asserted missing
paths. Finding 23 is rejected by the actual source construction: the toroidal
Hodge–Tate map is the minimal map composed with the projection. A stronger
arbitrary-datum Levi-torsor theorem is not required for that construction.

Pinned libraries: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the positive declarations
listed below and checked their files against the pinned Git blob hashes.
Targeted full-tree searches for the named comparison, trace, isogeny,
congruence and representation-recognition theorems distinguish those gaps from
unrelated name matches. Negative searches are bounded evidence, not proof of
nonexistence under every conceivable name. The audited algebraic power
constructors do not supply joint continuity or tensor induction; the
Frobenius-prime-set definition does not prove Chebotarev density.

This is an evidence-based verification of the findings, not a complete new
blueprint or a re-certification of every paper extraction, audit or source proof.
No mathematical formalization or Lean compilation is claimed.

## Requirements for the combined repair

- Keep early raw geometry independent of late automorphic identifications.
  Factor cyclic base change and local character theory before ET.6; retain
  the proof order inside Scholze's LLC construction. A whole late character
  Part II is not an early supplier.
- Extend one general contracting-correspondence theorem, even though EDC.8
  already reaches AG2.1a. Preserve Varshavsky's open/support/properness and
  large-Frobenius hypotheses. A graph edge cannot replace the missing scope.
- Construct one finite-field Tate/Honda–Tate producer and the precise
  compact-unitary Igusa instance. Keep Shin's ramified extension and the global
  Weil-equivariant Mantovan formula distinct from general PEL moduli or a
  similarly named local-shtuka functor.
- Split the early Tate-module input from the later conductor comparison export.
  Preserve the wild conductor and Ogg–Saito proof obligations, rather than
  adding reciprocal whole-stage dependencies.
- State the actual automorphy lifting and torsion-determinant endpoints.
  Preserve the different ordinary/Fontaine–Laffaille support conclusions,
  image conditions, nilpotence bounds and conditional branches. The shared
  determinant factor theorem must stay independent of the TC geometry that
  consumes it. Use the earlier polarized AG2.3 package where that is sufficient.
- Hilbert ordinary canonical-subgroup towers and full unitary central-leaf
  torsors are different interfaces. Replace the Hilbert justification of IG
  handoffs; retain a matching unitary justification where a consumer also
  contains a unitary application.
- Import Bun_G and the classical Beilinson–Drinfeld geometry from GlobalShtukas,
  not the unrelated similarly abbreviated GeometricSatake stages. Prefer the
  needed geometric prefix over an unnecessary full Satake import.
- Keep source status precise: the spherical twisted fundamental lemma is
  established; an unrestricted twisted weighted theorem is a different input.
  Apply Kottwitz–Shelstad's corrected pairings and normalizations, not a
  universal minus-sign rule. The July 2026 coefficient-prime compatibility
  preprint adds the stated semisimplification and monodromy-bound conclusions,
  not full monodromy equality at every place.
- Reconcile GSp4 routing around one proposed owner while keeping generic GL4
  and polarization-sign inputs at their existing owners. The higher-codimension
  congruence-module route is rejected/revise and cannot be activated as an
  accepted supplier. A revised route must share its codimension-zero core.
- Reuse existing compatible-system, power-representation, Hecke-involution
  and determinant constructors. Preserve topology, descent, duality and source
  hypotheses in the applications. The finite-residue-field reconstruction
  bridge in 33/35 is implemented once under IHG.1.

## Pinned declaration checks

- [TauCeti/RepresentationTheory/ExteriorPower.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ExteriorPower.lean): lines 12–85.
- [TauCeti/RepresentationTheory/SymmetricPower.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/SymmetricPower.lean): lines 12–75.
- [TauCeti/RepresentationTheory/Tensor/Power.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Tensor/Power.lean): lines 30–54, 80–121.
- [TauCeti/NumberTheory/HeckeRing/Commutativity.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Commutativity.lean): lines 38–100, 116–186.
- [TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean): lines 61–105.

## Decisions

### RT-AREA-langlands-1/1 — confirmed (high)

Confirmed the missing early automorphic inputs, with a correction to the absolute ownership claim. Scholze 1010.1540v1 pp. 25–28 (§10) explicitly uses the Harris–Taylor VI unitary base-change results; pp. 31–32 (§12) uses Arthur–Clozel Lemma 6.10, Theorem 6.2 and Proposition 6.7; pp. 35–36 (§14) uses the non-Galois induction/highly ramified twisting argument. ET.6 does not expose these prerequisites and its later ET.7a cannot supply them. GL2AutomorphicRepresentationsAndTransfer:R17.4 already plans cyclic/solvable base change, and R17.5/ModularityLiftingAndApplications:ML.5 also mention induction; thus ET.7a is not literally the only atlas owner. Factor the general early input once, specialize it in R17.4, and retain ET.7a's residual-spectrum and cohomological comparison work. The proposed AS.6/ET.3/ET.4 → early base-change prefix → ET.6, ET.7a, R17.4 passes the assembled graph check. Preserve Scholze's proof order: Theorem 10.6 is invoked only after parts (a),(b) of Theorem 1.2, not as an unconditional input to their proof; retain the distinction in §14 between supercuspidal-support L factors and general Weil–Deligne normalization. The source invocations establish this dependency defect, not a completed extraction of the cited books.

### RT-AREA-langlands-1/2 — confirmed (high)

Confirmed the missing stronger theorem, but rejected the asserted absence of every EDC.8 ancestor path. In the assembled atlas EDC.8 → WeilConjectures:WC.3 → WeightsInEtaleCohomology:R34.5 → AG2.1a already exists. EDC.8's statement nevertheless explicitly leaves the contracting-boundary/Fujiwara strengthening in ET.5. Scholze 1010.1540v1 §9, pp. 23–24 invokes Varshavsky Theorem 2.3.2 at the early raw geometric trace step. Varshavsky math/0505564v2 pp. 19–21 states/proves the requisite large-Frobenius-power formula: properness of c1 over the open, quasi-finiteness of c2 there, locally invariant complement, constructible finite-Tor-dimension coefficients supported on the open, and q^n larger than the ramification bound matter. Promote that general theorem into EDC.8 or a single early successor; keep the Igusa-specific properness, isolation and contraction checks in ET.5. With EDC.8 as owner the AG2.1a dependency already exists transitively and ET.5 directly imports it; a direct AG2.1a edge is optional documentation. This repairs missing mathematical scope without claiming that ordinary point-counting already proves the stronger theorem.

### RT-AREA-langlands-1/3 — confirmed (high)

Confirmed. Shin StableGal pp. 8–11 define the Ext/colimit Mantovan functor (2.1), including the cohomological signs, dimension twist and finiteness requirements, and compute the essentially square-integrable/Jacquet–Langlands cases in Proposition 2.2. Pages 32–34, especially Proposition 5.2, give the global product formula as a Grothendieck-group identity with Weil action. No assembled stage names Mantovan, and ET.6a explicitly ends at the supercuspidal realization. The HKW22 candidate local-shtuka route does not supply this global Weil-equivariant formula merely by its analogous functor name or elliptic trace theorem. Add a single local Mantovan/computation producer (extending ET.6a or an early shared prefix) and import it into AG2.1b, where the global geometric product formula belongs. ET.6a → AG2.1b is acyclic; do not feed the late comparison back into raw AG2.1a. Shin's ramified extension on p. 33 is specific to his signature and p split in E, using Drinfeld level models in place of the unramified deformation theory, not an unrestricted ramified-PEL theorem. Retain all Tate/parabolic/Jacquet–Langlands normalizations and the Grothendieck-group, rather than individual-degree, conclusion.

### RT-AREA-langlands-1/4 — confirmed (high)

Confirmed the mismatch of geometric instances. The Igusa README and IG.0–IG.1 fix the split U(n,n) CSnc setup with unramified local data, whereas AG2.1b imports them for Shin's compact unitary datum. Shin StableGal pp. 30, 32–34 specify the signature-(1,n−1) compact setting, p split in E and its particular ramified extension; Theorem 6.1 on pp. 43–44 computes that Igusa cohomology with its own group and normalization data. PELModuli:M4's general moduli framework does not itself supply the missing compatible central-leaf/Igusa geometry. Broaden the shared basic definitions to explicitly supported type-A PEL data and construct the compact instance with its precise hypotheses, then keep the CSnc perfectoid/boundary stages specialized. Alternatively use one compact prefix with compatibility maps, not a second independent definition of Igusa varieties. The repair must not promise that a good-reduction-only generalization covers Shin's ramified case, or assert arbitrary ramified PEL product formulas. Keep the corresponding characteristic-zero comparison distinct from CSnc's ET.7b application.

### RT-AREA-langlands-1/5 — confirmed (high)

Confirmed the missing finite-field isogeny/classification producer, not an absence of the broad abelian/Dieudonné prerequisites. Scholze 1003.2451v2 §4 p. 11 explicitly imports Kottwitz's isogeny-class triples and their crystalline realization. Kottwitz 1992 printed pp. 374, 376–377 (scanned PDF pp. 3,5–6, inspected as images) describes the Honda–Tate dependence and the virtual c-polarized objects needed to recover triples satisfying the alpha condition. Shin IgusaVar §8 pp. 24–25 uses the p-adic-type version to classify objects with endomorphism structure; his introduction p. 2 identifies its effectivity role. The unrelated Honda search hits in Ado/Iwasawa and polynomial Galois material do not supply this theory. Keep one finite-field Tate/Honda–Tate producer after A6, V5 and R07.2; specialize its polarized/endowed and virtual variants for AG2.1a and ET.5. The union of these candidate edges is acyclic. A6, V5 and DWP.1 already reach AG2.1a, so bare extra edges from those existing stages would not create the missing theorem. CM.5 is unsuitable as an upstream supplier: AG2.1a already reaches it through ET.6, GL2 transfer, R19.3 and CM.4. Do not substitute Faltings over number fields or assert a general Langlands–Rapoport theorem; retain the exact PEL, unramified-model and effectiveness hypotheses. The primary invocations verify the gap, while extraction of Tate/Honda and Kottwitz's proof remains explicit work for that producer.

### RT-AREA-langlands-1/6 — confirmed (high)

Confirmed the undecomposed Ogg/Saito comparison and owner ambiguity, with two graph corrections. Upstream EllipticCurves Layer 4 plans the algorithmic exponent and explicitly leaves the all-prime ramification comparison to a separate project; StableReduction Layers 4–5 provide regular-model/intersection theory, and R11.2 provides the component comparison. R01.3 and accepted RS-25 own the general conductor comparison, while RS-06 names R01.6's exported conductor/Euler interface. The assembled graph already has EC Layer 4 → R01.3, contrary to the raw-graph absence claim, but lacks the stated regular-model/R11.2/R01.6 inputs. Liu's public Ogg–Saito notes pp. 1–5 give the exact reduction: for the henselian algebraically closed residue-field setup, -Art(X/S)=m-1+f and the elliptic discriminant equals -Art; their §3 identifies the separate Saito determinant-of-cohomology theorem. Unver math/0006043v1 p. 1 supplies a number-field arithmetic-surface version, not by itself every DVR version. Plan the needed general theorem and the strict-henselian/descent comparisons with exact hypotheses, then derive the elliptic formula including (0,2). Correct the proposed edge direction: R01.6 → R01.3 means the comparison consumes the Tate module; it does not mean R01.6 imports R01.3. Separate the early Tate-module producer from the later exported comparison, otherwise requiring both directions creates a cycle. Retain one comparison proof owner and all wild terms; silently discarding characteristic 2 would violate the target. The candidate early-input edges tested are acyclic.

### RT-AREA-langlands-1/7 — confirmed (high)

Confirmed the missing lifting-theorem assembly. PA.1/2 supply local compatibility, PA.3/4 arithmetic patching, PA.5 only preservation of a checklist under base change, and ML.2 names final potential automorphy without supplying the intervening lifting statements. Add a dedicated PA endpoint (or a precisely separated early lifting prefix of ML.2) importing those arithmetic branches and the matching local/global deformation problems. For this roadmap the concrete statements should be ACC+ Theorems 6.1.1–6.1.2 (published PDF pp. 133–134), with proofs through the Fontaine–Laffaille support/lifting result 6.5.4–6.5.5 (pp. 165–168) and ordinary 6.6.2 (pp. 178–179), followed by the specified soluble-base-change reductions. Do not require a polarization uniformly: these are the nonpolarized CM/totally-real lifting statements. Keep enormous image, decomposed genericity, the scalar outside G_F(zeta_p), p>n² versus p>n, crystalline/ordinary and weight hypotheses separate. CG Theorem 5.16 (pp. 87–88) is an arbitrary-rank but conditional theorem assuming Conjecture B, with its own fixed determinant/weight conditions; it cannot alone certify the ACC+ endpoint. The ordinary proof expressly does not give the same full-support theorem as the Fontaine–Laffaille case. The candidate PA.6 → ML.2 plus branch imports is jointly acyclic, and does not license a blanket R=T or all-local-properties conclusion.

### RT-AREA-langlands-1/8 — confirmed (high)

Confirmed the mismatched Hilbert ordinary-tower supplier. RS-14's actual links forward IG.1 to the listed consumers, but IG.1 fixes the split-unitary full p-divisible-group central-leaf torsor; this is not the Katz/Hida torsor for the dual canonical subgroup. T5 explicitly constructs the latter and its ordinary inverse tower. BHW 1902.03985v4 §3.4 p. 14 and §6–7 p. 28 distinguish these objects and supply the Hilbert analogue with its formal model and modified integral lattice. Route the Hilbert ordinary inputs through T5, extending the formal-model/CM-point comparisons with precise requests where its present analytic statement does not yet suffice. All seven candidate T5 handoffs are absent and jointly acyclic. Qualify the removal instruction: L5/L5w also contain a GU(2,2) congruence argument, and an IG edge justified by a matching unitary use may remain; replace its Hilbert justification rather than blindly delete every such edge. KU-hilberteisenstein is an aggregation checkpoint, so its imported interfaces must agree with L3/I.3 instead of creating another tower owner. Neither good-reduction Hilbert ordinary geometry nor the broader repair in finding 4 identifies the two distinct torsors without a comparison theorem.

### RT-AREA-langlands-1/9 — confirmed (high)

Confirmed the missing instantiated endpoint. TC.4 expressly stops at reusable comparison infrastructure, IHG.5 is an input-parametrized schema, and IG.6's lower-rank torsion systems require an actual theorem. Scholze 1306.2070v2 V.3.1 (p. 91) gives the interior-cohomology determinant with J^{4(d+1)}=0; V.4.1 (pp. 100–102) then gives full cohomology with N depending only on [F:Q] and n. Its proof uses the GL_n Borel–Serre boundary, lower-rank induction, the square-zero kernel of the map to interior/boundary image algebras, and determinant descent. None is supplied just by TC.3's symplectic/unitary Levi extraction. Add a TC terminal stage with those explicit statements and proof nodes, importing ALS.4 and IHG.4/5, followed by IG.6 and PA.0. The combined candidate graph is acyclic. Preserve finite-free algebraic coefficients, level descent via Hochschild–Serre, uniformity in i/m and the exact branch/ramification hypotheses of V.4.6; neither this theorem nor Remark V.4.5 establishes every conjectural local property. CC.8 should point to the actual TC producer, with IHG supplying its algebra, rather than leave a circular promise between the two roadmaps.

### RT-AREA-langlands-1/10 — confirmed (medium)

Confirmed the omitted proof contract for the coefficients, with a qualification to the AA.2 description. AA.2 excludes computing every Tamagawa number, not every possible computation; it supplies the measure, while ET.4 currently only names Tamagawa/kernel coefficients. Shin StableIgusa §1.2 display (1.2), PDF p. 4 (also inspected as an image), invokes Kottwitz's formula; §5.1 p. 15 uses it to change the counting coefficient, and §7 p. 26 defines iota(G,H) from Tamagawa numbers and the outer-automorphism factor. Thus include the required source-qualified formula and its simply connected input as explicit ET.4 obligations for the groups, endoscopic groups and centralizers actually used, with ET.0's cohomology and AA.2's measure conventions. Do not turn the statement into an arbitrary-group or all-global-fields formula by omitting hypotheses, component factors or the specific ker^1 convention. ET.5 should reuse that computation, not prove it again. Keeping this within the already named ET.4 scope requires no new owner or speculative AA → ET → AA loop. The dependency use has been checked in Shin; this verification does not claim to have extracted the full 1988 Kottwitz proof or the simply connected Tamagawa theorem.

### RT-AREA-langlands-1/11 — rejected (medium)

Rejected as stated against the assembled, reviewed atlas. The accepted ClassFieldTheory link packet (CFT-L85/L86/L87) already adds edges from upstream Layers 0, 6 and 11 directly to ET.0. Their reasons explicitly cover the Tate–Nakayama tensor theorem, local fundamental classes and global class formation/product formula, while retaining torus-complex and archimedean comparison obligations in ET.0. The review is accepted and these are live reviewed_link edges, not unaccepted proposals. Reading only raw data/atlas.json omitted them. The upstream statements also explicitly import Layer 3 internally; adding a direct Layer 3 edge would be optional fine-grained bookkeeping, not an absent class-field-theory supplier. R02.4/D7 contains genuine further global/derived duality, but the finding does not isolate an ET.0 theorem needing that entire later package beyond the already imported class formations and ET.0's stated torus-complex constructions. Do not force the blanket extra duality edge without a precise consuming declaration. Retain those explicit future comparison obligations; this verdict does not assert that the tori theory is formalized.

### RT-AREA-langlands-1/12 — confirmed (medium)

Confirmed the ownership handoff left open by accepted RS-22. This concerns GlobalShtukasAndFunctionFieldLanglands:GS.0/GS.1, not GeometricSatakeAndFusion's different Fargues–Fontaine/mixed-characteristic geometry. GS.0 constructs global Bun_G and its torsor-class-qualified adelic description; GS.1 constructs the classical Beilinson–Drinfeld Grassmannian. ET.2b should import the matching objects and retain its Higgs, Hitchin, regular-centralizer/Picard and affine-Springer constructions. RS-22.md explicitly records this unresolved cross-family boundary, so its empty internal owners list is not evidence of an erroneous merger decision. Add GS.0 and the geometric prefix of GS.1 with model, characteristic and coefficient comparisons, plus FA.2's adelic input to ET.3; GS.0 already imports FA.6 for the group quotient. The full GS.1 → ET.2b edge is acyclic but unnecessarily imports its later Satake theorem: prefer a prefix and a precise request rather than an unlinked prose assertion that the Grassmannian is a fibre. Assembled reachability confirms the current interfaces are absent. No changes to upstream objects or duplicate Bun_G construction are warranted.

### RT-AREA-langlands-1/13 — confirmed (medium)

Confirmed the misleading literature-status wording, with a narrower repair. Ngô PMIHES 111 §1.12.7, p. 25 explicitly records Waldspurger's implication from ordinary and nonstandard fundamental lemmas to the twisted lemma, under the stated characteristic regime and its reduction machinery. Lemaire–Mœglin–Waldspurger 1506.03383v1 abstract states the established unit-element theorem and its extension to all elements of the spherical Hecke algebra. Thus ET.5 should say its chosen route avoids invoking that theorem, rather than characterize the spherical twisted theorem as unproved. This does not establish an unrestricted weighted/twisted theorem with every coefficient, group and characteristic hypothesis erased. ET.3 already says not to smuggle a general twisted/weighted theorem into the ordinary one; that caution is sound, not a denial that the spherical theorem exists. Preserve its explicit nonstandard target. If a consumer needs the twisted spherical result, add the source-qualified reduction and coefficient/normalization contract; do not drop the nonstandard theorem solely because no present edge names its consumer.

### RT-AREA-langlands-1/14 — confirmed (medium)

Confirmed the missing explicit correction and normalization comparison, not proof that an implemented factor already has the error. Kottwitz–Shelstad 1201.5658v1 §2.2 defines the twisted splitting invariant; §3.5 (pp. 9–10) compares the replacement of Delta_I, and §§4–5 (pp. 10–13) explain the inconsistent Langlands pairing/chi-data normalization in the old twisted construction. Cite the correction in ET.1, expose the corrected factors and carry the selected reciprocity/Whittaker conventions into ET.4 and ET.6/ET.7a. Correct the suggested test: Delta-prime versus Delta_D is not generally multiplication by a universal sign; the source uses inverse chi-data, inverse pairings and the corresponding contragredient normalization. For the nonreduced restricted-root modification one can test Proposition 3.5.2's product of quadratic characters evaluated at 2 in its characteristic-zero scope, with a transpose-inverse odd-dimensional GL example; cyclic base change does not exhibit that particular nonreduced-root modification. Tests must check the actual factor identities and independence of chi-data, not simply assert the two factors differ by minus one. Sections 5.4–5.5, pp.14–15, explicitly propagate the inverse-pairing corrections into stabilization and retain epsilon_L(V,psi), not its inverse, in both Whittaker-normalized variants.

### RT-AREA-langlands-1/15 — confirmed (medium)

Confirmed the absent early p-adic character supplier. SR.3 covers admissibility and Bernstein theory, not the required representability/local constancy and integrability of character distributions; ET.1's archimedean character theory is a different input. Scholze 1010.1540v1 p. 31 (§12) integrates the twisted character as a function, and ET.6's Jacquet–Langlands identity also needs the regular-elliptic theory. The HKW22 extraction's proposed SmoothRepresentationsCharactersPartII is a routing candidate, not a live stage supplying these results; extend its early character prefix to include the twisted theory and the required Weyl integration statements. SR.3, ET.1 and RG2.0 → early character prefix → ET.4/ET.6 is acyclic. Do not import the entire proposed Part II upstream: its broader imports include SR.6, whose current statement is explicitly late excursion-dependent finiteness. The early prefix must be separated from that late mathematics. This finding establishes the missing contract; detailed Harish-Chandra/Clozel proof extraction remains the supplier's work.

### RT-AREA-langlands-1/16 — confirmed (medium)

Confirmed as a new source/target omission, not as a false statement about what HLTT itself proves. I verified the public arXiv record and read 2607.11763v1 Theorem 1.2.1 and Corollary 1.2.2, pp. 5–6: for cuspidal regular algebraic GL_n over a CM field, the coefficient-prime restriction is de Rham with the stated labelled weights, its WD semisimplification matches rec^T, and its Frobenius-semisimplification satisfies the specified monodromy partial-order bound. The theorem does not assert full equality of monodromy or unconditional crystalline behavior at every place. AG2.6's existing sentence correctly limits the old construction, but no target incorporates this later theorem. Route the July 2026 v1 preprint for extraction and a source-qualified successor to AG2, keeping its preprint status and proof obligations; update AG2.7's package only for the actual new conclusions. The p. 6 proof overview explicitly replaces generic torsion vanishing by quantitative Hecke annihilation and uses Koshikawa's local-Shimura/Mantovan route. Its later pseudodeformation/degree-shifting proofs still need full decomposition. Do not treat this source addition as a proof that the old partial packet had already read it or as an unrestricted local–global equality.

### RT-AREA-langlands-1/17 — confirmed (medium)

Confirmed the missing supplier. R01.1 has no prerequisites despite requiring characteristic-p Brauer–Nesbitt; IHG.1 already owns determinant reconstruction. The accepted AUDIT-31 explicitly distinguishes characteristic-zero finite-group character recognition from this result, and fresh searches of both pinned trees found no Brauer–Nesbitt declaration. Chenevier v2 Theorem 2.12 (p. 28) gives uniqueness of a semisimple representation from its determinant over an algebraically closed field. Add IHG.1→R01.1, which has no reverse path, and explicitly export the finite-residue-field version: base extension from a perfect finite field preserves semisimplicity, compare characteristic polynomials over the algebraic closure, then use Noether–Deuring/isomorphism descent. Deligne–Serre Lemme 6.13 (printed p.523, PDF p.18) separately confirms the finite-field realizability argument and its trivial-Brauer-group input. Neither result licenses trace-only recognition in small characteristic or descent over arbitrary infinite fields. The finite-field descent and continuity proofs still need nodes; an edge alone does not prove them.

### RT-AREA-langlands-1/18 — confirmed (medium)

Confirmed the insufficient characteristic-zero input. AG2.2 explicitly retains Shin-regularity, while AG2.3 removes that restriction by its stated constructions. Scholze 1306.2070v2 V.1.4 and footnote 2, p. 81, explicitly need regular, non-Shin-regular and not necessarily finite-slope representations. The AG2.2 → TC.4 edge from RS-24 does not supply that scope, and TC.3 has no AG2 input despite its arithmetic realization clause. Add the AG2.3 polarized package to TC.3 and use it in TC.4 (the latter is then transitively connected). Do not indiscriminately import the whole AG2.7 export: it includes AG2.4's nonselfdual construction, whose factor-separation algebra must stay independent of TC geometry under finding 26. Clarify AG2.7's consumer wording to name the earlier polarized subpackage actually used. The AG2.3 edges and the independent shared-algebra split pass a joint acyclicity test. Retain the source's conjugate-dual/twist and Frobenius conventions, rather than infer the required theorem from generic good-prime existence.

### RT-AREA-langlands-1/19 — confirmed (medium)

Confirmed a conflict between accepted paper routes, not two completed implementations. CG20 source route 11 and Pilloni20 source route 15, both accepted by their independent reviews, explicitly instruct AG2 to add a GSp4 branch. BCGP21 accepted Part-II route 4 assigns the same existence, symplectic-valuedness, local/p-adic comparisons and normalization items to GSp4LocalLanglandsAndGaloisRepresentations; its brief's scope and Layer 8 explicitly name the CG/Pilloni/Sorensen statements to be repointed. Reconcile those routing records around that single proposed GSp4 owner and carry the different multiplier, weight and reciprocity dictionaries with the items. It imports GL4 construction/crystalline/purity inputs from AG2 and Gan–Takeda/transfer from ML.4; it does not construct those generic theories again. Preserve the generic Bellaïche–Chenevier sign result with its general representation owner and preserve BCGP21 source route 16's generic Weil–Deligne purity material at AG2.5. Do not move all AG2.0/2/5/6 items merely because the consumer is GSp4, or describe the accepted design route as an already existing live proof stage. This verdict checks the routing overlap; it does not re-certify the complete source extractions or their recorded errata.

### RT-AREA-langlands-1/20 — confirmed (medium)

Confirmed the duplicate carrier boundary. Read AG2.6 and R24.5:operations: both construct actual representations at coefficient places with common Frobenius polynomials and separate local predicates; the latter is explicitly the generic system interface before the two-dimensional existence theorem. AUDIT-31 records the same overlap, and RS-12 remains needs_changes, so its proposal is not a live repair. Add R24.5:operations→AG2.6 (no reverse path) and have AG2.6 instantiate that carrier with its constructed automorphic representations. Keep its embedding-independence proof and source-qualified Hodge, purity and local-monodromy properties; a common carrier does not prove those. Do not import the late R24.5 two-dimensional existence theorem or collapse weak/almost-strict/strict predicates.

### RT-AREA-langlands-1/21 — confirmed (medium)

Confirmed the duplicated auxiliary-set task and missing PA handoff, with the supplier hierarchy and theorem variants made precise. Accepted RS-08 leaves the shared Chebotarev prime-selection machinery in R04.5, imported by G7, and specifically retains ACC+ Proposition 6.2.33 and its diamond-group/presentation count in G7 for G8's variable-determinant problem. Read that layer decision, not only its abbreviated owner list. ACC+ p. 151 assumes enormous image, F=F+F0 and zeta_p not in F, uses distinct eigenvalues and g=qn−n²[F+:Q]. CG Proposition 8.5, p. 114, instead uses big image, a selected one-dimensional generalized eigenspace and a different fixed-determinant variable count; they are not literally one theorem with interchangeable hypotheses. PA.4 should import the branch it uses through G7/R04.5, supplying any missing source-qualified variant to that owner, and retain its finite-level arithmetic complexes, uniform bounds and specialization checks. G7 → PA.4 is absent and acyclic, also jointly with the PA.3 imports. Do not re-prove prime selection in PA or substitute adequacy for the actual source image condition.

### RT-AREA-langlands-1/22 — confirmed (medium)

Confirmed missing arithmetic deformation-ring inputs to PA.3. The descriptions of L7/L8, R08.2 and G7/G8 distinguish ordinary flags from determinant-ordinary conditions, retain away-p monodromy and construct the actual global deformation problems. P9 supplies a general algebraic support/patching theorem and cannot construct those arithmetic data. ACC+ pp. 166–167 explicitly defines S_chi and the local conditions and then proves the map R_Schi to the geometric Hecke algebra modulo a bounded nilpotent ideal; pp. 164–165 compares the two patched systems and their residual ring actions. Add the matching local/global supplier contracts to PA.3, separately for the chosen determinant/polarized and ordinary/Fontaine–Laffaille branches. The proposed five PA.3 imports are absent and jointly acyclic; some become transitive through G7/G8 and should not be mistaken for five independent new constructions. Do not automatically add L7 → P9: P9 explicitly says arithmetic verification belongs to PA and its theorem is parameterized by local ring/component data. Correct L7's exporter prose to route that application through PA.3, preserving P9's general algebraic owner boundary. If a separate arithmetic P9 example is retained, give that example its own dependency rather than burden the general theorem.

### RT-AREA-langlands-1/23 — rejected (medium)

Rejected the claimed missing supplier. Caraiani–Scholze, Noncompact.pdf §§2.6–2.7, pp. 30–33, explicitly defines the toroidal Hodge–Tate map by precomposition of the minimal map with the toroidal-to-minimal projection (Theorem 2.7.1, p. 32). Its stronger toroidal perfectoid representability is explicitly not needed for that paper; the inverse-limit diamond suffices. IG.3 already imports the minimal/open period-map route S3/S4 and IG.2, and C5 → IG.2 → IG.3 supplies the ambient compactification geometry; IG.2 retains the proper toroidal-to-minimal comparison. Thus the toroidal map in this fixed PEL scope is not an independent general-datum theorem missing because S6 has no outgoing edge. S6 additionally supplies the arbitrary-datum map and canonical Levi-torsor pullback via Boxer–Pilloni; these stronger assertions are not the IG.3 requirement quoted in the finding. Spell out the composition and level/action compatibilities when extracting IG.3 and retain the separate minimal-map descent comparison identified by CSnc; adding S6 is an optional alternate route, not the necessary fix asserted here. The nontrivial fibre/Stein/primitive-comparison theorems remain explicitly planned in IG.3 and are not proved by composition alone.

### RT-AREA-langlands-1/24 — confirmed (medium)

Confirmed the incomplete branch attribution, with an essential exception. Scholze 1306.2070v2 Remark V.4.6, p. 104, makes all §V.4 results unconditional via this route when F is CM containing an imaginary quadratic field and S is pulled back from rational primes containing p and every prime ramifying in F/Q. A generic CM label is not those hypotheses; write them in TC.3/TC.4 and the new terminal theorem, with the exact unitary-similitude transfer supplier. The same remark's final paragraph separately extends Corollary V.4.2, the characteristic-zero cuspidal representation result, to general totally real/CM fields by patching under the rational-set condition. Do not mislabel that special extension as the full integral torsion theorem, or as only a residual theorem. The current literature check is also explicit: arXiv 2410.13504v3 (latest, 24 July 2026), pp. 5 and 15, removes the stated local-intertwining/classification gaps but retains the twisted weighted fundamental-lemma dependency. It distinguishes this from already proved unweighted versions. Thus expose the exact remaining classification hypothesis when using that route; do not repeat a blanket claim that the old in-preparation local results remain unproved or infer that all CM torsion cases are now unconditional.

### RT-AREA-langlands-1/25 — confirmed (medium)

Confirmed the repeated generic interpolation/reconstruction wording and the missing IHG.4 interface, but the input overstates the IHG.1 dependency gap. In the assembled graph IHG.1 already reaches R19.6 via R01.5→R19.1→R19.2→R19.3→R19.4→R19.5; no such path exists from IHG.4. The actual R19.6 contract still says to construct the law and prove representability, while accepted RS-24 assigns the generic steps to IHG.4 and IHG.1 and RS-12 is unaccepted. Add IHG.4→R19.6 and explicitly reuse IHG.1 (a direct documentation edge is optional), keeping the geometric Hecke instance, congruence/integrality bounds, continuity, specialization and deformation-map conditions. Chenevier v2 Theorem 2.22(i), p. 34, uses a henselian base, Cayley–Hamilton quotient and split absolutely irreducible residual determinant; the raw group algebra is not asserted to be a matrix algebra. Preserve those hypotheses and the finite-field splitness bridge in findings 33/35.

### RT-AREA-langlands-1/26 — confirmed (medium)

Confirmed the common algebraic ownership issue, but the proposed reuse needs an explicit hypothesis comparison. IHG.4 and accepted RS-24 own generic continuous finite-quotient interpolation and coefficient/limit compatibility. AG2.4 should establish its HLTT congruence data and apply that theorem instead of reconstructing it. Scholze 1306.2070v2 p. 92 identifies the HLTT twisting idea; Lemma V.3.8 and its proof on pp. 97–100 provide a genuinely geometric-input-free factor theorem over a commutative ring from a determinant on R[G][V^{±1}] and specified Laurent-variable factorizations for every g and integer k. Pointwise factorization alone does not meet those hypotheses. Separate that abstract algebra from TC.3's TC.2-dependent arithmetic boundary realization, put it under the common IHG algebra or an independent TC substage, and feed both TC.3 and AG2.4. Prove how the HLTT character family, congruence limits and coefficient conventions instantiate it; do not assert this automatically from the shared idea. Keep auxiliary-CM descent, geometry and construction of the comparison data in AG2.4. IHG.4 → AG2.4 and the IHG.0/1/4/5 → independent factor prefix → AG2.4/TC.3 candidate pass the union test with finding 18; importing whole TC.3 would destroy this separation.

### RT-AREA-langlands-1/27 — confirmed (medium)

Confirmed the missing generic congruence-module contract. L0 explicitly imports it from IHG, but IHG.1 currently supplies reducibility/extension modules without this construction; R20.1, PadicFamilies:L1 and I.5 require concrete congruence modules. IKM 2206.08212v3 pp. 2–4 distinguishes the classical finite-flat setting from the higher-codimension Ext-cokernel definition. Its Proposition 2.10, pp. 16–17, makes the codimension-zero comparison a surjection in general and an isomorphism under depth≥1; an arbitrary torsion module cannot be given the direct-sum formula without its hypotheses. For the finite-flat augmented algebra also state the congruence ideal lambda(ann_A ker lambda) and its module comparison under the appropriate generic-point/separability conditions. Choose one foundational owner and expose the codimension-zero API to all four consumers. A viable minimal repair is an IHG.1 extension with a coordinated later handoff, but do not activate a duplicate: PAPER-IYENGAR-KHARE-MANNING-24's CongruenceModulesHigherCodimension route is currently rejected/revise, specifically for unresolved generic duality/Tate ownership and source closure. It is a proposal, not an accepted supplier. If that route is revised, reconcile the common c=0 construction and comparison rather than retain parallel definitions. IHG.1 already directly reaches L0 and transitively R20.1; only the additional PadicFamilies:L1 and I.5 edges are graph-new in that option, and the full set is acyclic. Consumers retain arithmetic localization, saturation, periods and Selmer-class proofs.

### RT-AREA-langlands-1/28 — rejected (low)

Rejected against the assembled reviewed atlas. The accepted Chebotarev link packet already has the direct Layer 10 → ET.3 interface, with the exact generic split-prime argument and finite-exceptional-set scope; ET.3 → ET.4 → ET.6 makes Layer 10 an ancestor of ET.6 as well. The claim that the upstream roadmap has no consumers results from inspecting raw atlas arrays without reviewed links. Layer 10 explicitly supplies infinitude of every Frobenius class and invariance under finite symmetric difference, so its statement covers the qualitative prime choice; Scholze 1010.1540v1 §10 pp. 27–28 indeed uses Chebotarev for the representation comparison, but a further direct edge would document existing reachability. The pinned NumberField.Chebotarev.frobeniusPrimeSet definition was read and hash-checked at f790474: it packages unramified Frobenius prime sets, not a density theorem. Thus retain the upstream planned theorem as supplier, rather than citing the preparatory definition as a completed proof, and do not add duplicate graph edges.

### RT-AREA-langlands-1/29 — confirmed (low)

Confirmed the low-severity rescoping, not a missing edge. EC Layer 2 explicitly supplies the prime-to-characteristic elliptic Tate module, its profinite continuous representation, rank two, pairing and cyclotomic determinant. The accepted EC link packet already connects it directly to R01.6 and records this overlap. R01.6 still says to construct/prove these without limiting that wording to its new general abelian-variety and arithmetic comparison work; neither RS-06 nor RS-17 rewrites this stage contract to settle the elliptic specialization. Import the elliptic results, construct only the missing general extension, and prove compatibility with the existing carrier. Keep the genuinely new arithmetic/oddness, good-reduction, scheme-isogeny and Euler interfaces, while respecting RS-17's separate upstream ownership of the finite-level abelian torsion/H1 trace foundation. Do not move general abelian-variety mathematics into the fixed elliptic roadmap or add a duplicate EC→R01.6 edge. Fresh pinned searches find only unrelated Saito-name matches, not a TateModule declaration furnishing the planned result.

### RT-AREA-langlands-1/30 — confirmed (low)

Confirmed narrowly as an ownership-wording correction. AG2.0 already imports AF.4, so there is no missing prerequisite. However its instruction to prove rationality and finite fields of definition in cohomological cases repeats AF.4's named theorem; the accepted AUDIT-31 records the same duplication and the RS-12 proposal has not been accepted. Change that instruction to applying AF.4's source-qualified theorem to the AG2 data. Retain the multiplier/coefficient embeddings, Frobenius/Satake/half-twist normalization dictionary and the distinction between field of rationality and field of realization; realization requires the actual descent obstruction to vanish. This does not remove the theorem or assign its proof to a second owner.

### RT-AREA-langlands-1/31 — confirmed (low)

Confirmed as a baseline/API correction, not as a claim that the arithmetic target is already built. At Tau Ceti f790474 I read Representation.exteriorPower (ExteriorPower.lean:50), Representation.symmetricPower (SymmetricPower.lean:47) and Representation.tensorPower (Tensor/Power.lean:100), including their ambient hypotheses and action formulas; each inspected file matches its pinned blob hash. These are algebraic representations of a monoid, with commutative-ring coefficients for exterior powers and commutative-semiring coefficients for symmetric/tensor powers. AUDIT-31 already correctly marks the combined target partial. G7 should cite and reuse these constructors and prove the required continuous finite-projective specializations, coefficient comparisons and characteristic-polynomial identities. Tensor induction and restriction of scalars remain separate obligations; tensorPower is not tensor induction. Preserve the genuine arithmetic work and do not promote the layer's coverage to built.

### RT-AREA-langlands-1/32 — confirmed (low)

Confirmed that the target can be closed by the elementary proof, with a correction to how the old gap is described. I read the exact node and Serre 1987 §3.3, printed p.198, including its page image: Serre gives the prime-field direct-sum argument under det(rho)=chi. For any finite field k of odd characteristic and an odd two-dimensional k-irreducible rho, suppose a stable line exists over k-bar. If unique, its Galois conjugates equal it, so it descends to a k-line, contradiction. If two distinct stable lines exist, rho splits; each is stable under complex conjugation and must be one of its two distinct ±1 eigenspaces, both defined over k, again contradiction. This proves the broader stage target without the unnecessary prime-field restriction. Record this argument as the new proof and preserve the separate characteristic-two failure and all bad-dihedral obligations. The original packet honestly marked a passage unread/incomplete; this verification supplies the bridge, rather than establishing that its historical reading report was false.

### RT-AREA-langlands-1/33 — confirmed (low)

Confirmed the available repair; this is the same mathematical issue as finding 35 and needs one shared producer node. Chenevier v2 Definition-Proposition 2.18 (pp. 32–33) identifies an absolutely irreducible residual determinant with a central simple algebra of rank d². Over a finite residue field that algebra is split by the triviality of the Brauer group (finite-division-algebra/Wedderburn theorem). Definition 2.19 and Theorem 2.22(i), pp. 33–34, then apply over a henselian local A after passing to the Cayley–Hamilton quotient. I checked the printed theorem visually: splitness and absolute irreducibility are hypotheses on the RESIDUAL determinant, not an assumption that the desired A-representation already exists. The proof lifts matrix units and uses the rank-one corner determinants. Scholze v2 p. 104 explicitly uses 2.22(i) for the localized Hecke algebra. Add this theorem and the finite-field splitness argument at IHG.1, link its export to the R01.5 application, and remove only the now-resolved residue-field bridge gap. Keep continuity, completion and arithmetic specialization obligations explicit. The old node accurately said these later sections had not been read; it did not assert that the source could never supply a bridge.

### RT-AREA-langlands-1/34 — confirmed (low)

Confirmed only as an explicit reuse/baseline correction, not a missing supplier edge or a claim that the complete cohomological duality is already built. SR.1's opposite-involution construction already reaches IG.5 through SR.2→ET.6. At Tau Ceti f790474 I read HeckeAntiInvolution, ofAmbient, onHeckeCoset and its involutivity (Commutativity.lean:79,135,165,179) with their hypotheses and checked the pinned blob. Instantiate the ambient inversion only for a Hecke datum whose submonoid is preserved by inversion; an arbitrary positive monoid need not satisfy that condition. This supplies the double-coset carrier/action, while SR.1 supplies its Hecke-algebra comparison. IG.5 retains the actual global Hecke/dual-ideal realization, integral lattice and duality theorem, cyclotomic twist and residual-polynomial conversion. Merely identifying inversion on double cosets does not prove all those identities or a measure-normalized algebra anti-involution automatically.

### RT-AREA-langlands-1/35 — confirmed (low)

Confirmed with the same qualified repair as finding 33; do not implement a second copy. I independently read Chenevier v2 pp. 32–35 and the actual R01.5 node. Theorem 2.22(i) requires a Cayley–Hamilton determinant over henselian local A whose residual determinant is split and absolutely irreducible. Use the Cayley–Hamilton quotient of the group algebra; Definition-Proposition 2.18 and the trivial Brauer group of the finite residue field establish residual splitness. The theorem produces the matrix-algebra realization; a separate argument supplies the required continuous group representation in the arithmetic setting. IHG.1 is the generic owner and already reaches R01.5. Replace the application’s algebraically-closed-residue-field restriction by this exact theorem and its proved splitness bridge, and update its coverage/gap record. Preserve other unread determinant/descent obligations. Calling the old limited source-reading statement false overstates the defect; the valid finding is that this specific gap can now be discharged from the same source.

## Public sources and inspection limits

Sources accessed 2026-09-24. Pages below are **physical PDF pages starting at
1**, not necessarily the journal's printed pagination. These are the passages
consulted, not claims to have read the complete papers. Hashes identify the
downloaded versions. The decisions give the theorem/section locators and the
mathematical scope supported by those passages.

| Source | Physical PDF pages consulted | SHA-256 |
| --- | --- | --- |
| [Chenevier](https://arxiv.org/pdf/0809.0415v2) | 28, 32, 33, 34, 35 | `f3c0e0d86e803301c617d3023d425752e30da46673ed5af932647eb284286953` |
| [SchTorsion](https://arxiv.org/pdf/1306.2070v2) | 81, 91, 92, 97, 98, 99, 100, 101, 102, 103, 104 | `e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285` |
| [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf) | 20 | `8048919db24dcb972435aaaa2a74d1168d0fe533af3aa26c6c809b12ddaee038` |
| [DS](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) | 17, 18 | `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc` |
| [ACHTW](https://arxiv.org/pdf/2607.11763v1) | 5, 6 | `a5a56b7917c387b24f717e31714675d2de183505250bbd3a3fae21bd1fa424bb` |
| [SchLLC](https://arxiv.org/pdf/1010.1540v1) | 23, 24, 25, 26, 27, 28, 31, 32, 35, 36 | `06201ae7708dd7f1dcaef13301b213c74b257844ad0541e0d4e2626346cd1c3b` |
| [ShinGal](https://math.berkeley.edu/~swshin/StableGal.pdf) | 4, 8, 9, 10, 11, 30, 32, 33, 34, 43, 44 | `93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b` |
| [Varshavsky](https://arxiv.org/pdf/math/0505564v2) | 19, 20, 21 | `8b4cb7ee9b1726cc998fc4d952a2542576e85ebe21e70b0f5c9f31c4682b8ac6` |
| [LMW](https://arxiv.org/pdf/1506.03383v1) | 1 | `c8dfeb18cb77fe97f46d735149bb1d3061d739431bbd00129571ed463c4d88fa` |
| [KS](https://arxiv.org/pdf/1201.5658v1) | 1, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15 | `eaa0a8ab1e182e0297dd9b4e46c296fa370060a5f0c2d90136b4d925700a0904` |
| [Ngo](https://www.numdam.org/article/PMIHES_2010__111__1_0.pdf) | 25 | `63ca68fc7eb1cc3797faeec044869838da310248be7332c47a1fd19ffc809309` |
| [CSnc](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf) | 30, 31, 32, 33 | `b0e813515e0ab6f5348e8bd2b32e6010a90295eb77e71f333b7870ccb735f535` |
| [KottPoints](https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf) | 2, 3, 5, 6 | `ae2f2f148d791b6cc1d79d360868182c9abd2e0e5954d5c96df2d94b98570d2b` |
| [ShinIgusa](https://math.berkeley.edu/~swshin/IgusaVar.pdf) | 2, 24, 25 | `022defdc0ebd913cdfd96d6c37b0f583dc9dc73716c23d1577c18035ff74eff8` |
| [SchLK](https://arxiv.org/pdf/1003.2451v2) | 11 | `0ac9fe8c8145e3d58f2cec19d3d026c1c77d8a05530225135bedffb04fcdd877` |
| [ShinStable](https://math.berkeley.edu/~swshin/StableIgusa.pdf) | 2, 3, 4, 15, 16, 26 | `e74cbbe4463f003b8ae2eb10636744c7ae032d25a566f8b441004c7f14e2faf0` |
| [LiuOgg](https://www.math.u-bordeaux.fr/~qliu/Notes/Ogg-Saito.pdf) | 1, 2, 3, 4, 5 | `8cd58b04172946baf16b13ac8e4f58276782cc2b16ff5581d478535b21ebad4e` |
| [Unver](https://arxiv.org/pdf/math/0006043v1) | 1 | `7bc4fc9d02a731521426b78f355f83f0c54fdf3db6168d469e7a40e20a53df81` |
| [AGIKMS](https://arxiv.org/pdf/2410.13504v3) | 5, 15 | `7aef44234d64dd4ba0099989d20ad945b4d692287da4d29cff289862b2945b23` |
| [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | 133, 134, 151, 164, 165, 166, 167, 168, 178, 179 | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |
| [CG](https://www.math.uchicago.edu/~fcale/papers/CG.pdf) | 87, 88, 114 | `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5` |
| [BHW](https://arxiv.org/pdf/1902.03985v4) | 14, 28 | `8ee48970dc500f60a6409cca0e6d9feeb693071da00a8b37174776717b708dac` |
| [IKM](https://arxiv.org/pdf/2206.08212v3) | 2, 3, 4, 13, 14, 16, 17 | `8f061724a1800af6319492108835f4db0fd640b93750c213fd1bb313bb8c9d7b` |

Kottwitz's scanned pp. 2, 3, 5 and 6 were inspected as images; these correspond
to printed pp. 373, 374, 376 and 377. Serre's p. 20, Chenevier's p. 34 and the
coefficient formula on ShinStable p. 4 were also checked visually. The Liu
Ogg–Saito note was read in full. The public version records were checked for
ACHTW v1 and AGIKMS v3, including the latter's July 2026 revision; the verdicts
do not infer publication or removal of all conditional hypotheses from a new
version number.

The original Arthur–Clozel/Harris–Taylor base-change proofs, general
Harish-Chandra theory, the 1988 Kottwitz Tamagawa proof and its simply connected
input, and the full Tate/Honda–Tate/Kottwitz classification proofs remain
undecomposed here. Their explicit invocation establishes the dependency, not
completion of the importing blueprint. Likewise, the detailed new ACHTW proof
and Varma's published §8 are not independently extracted by this review.
The GSp4 verdict checks the actual route conflict and scoped briefs, not every
source item or erratum in those papers. The old determinant packets' candid
unread/partial records are preserved; supplying the missing bridge now does not
make their historical reading statements false.

## Joint dependency check

Tested the following **70 graph-new candidate edges together**, adding them to
the 2608-stage assembled baseline. For every new edge, searched the augmented
graph for a return path from its target to its source. **No new edge lies on a
cycle.** This is not a claim that the whole pre-existing graph is acyclic.

This table includes optional direct documentation edges where an indirect
dependency already exists. The decisions, not the table alone, determine which
edges should actually be added. Rejected findings' suggested additions are not
part of this repair union. IDs beginning `proposal:` are provisional vertices,
not claims that a live roadmap already supplies their theorem.

The full GS.1 edge tests the conservative supplier; a geometric prefix is
preferred in implementation. R01.6 → R01.3 tests the early Tate-module input:
the later exported conductor comparison must be split as explained in finding
6 before adding a converse application. The graph check does not complete
those splits, theorem statements, new requests or fine-node closure checks.

| Supplier | Consumer |
| --- | --- |
| `AbelianSchemesAndArithmeticModuli:A6` | `proposal:finite-field-isogeny` |
| `ArithmeticGaloisRepresentations:R01.6` | `ArithmeticGaloisRepresentations:R01.3` |
| `ArithmeticLocallySymmetricSpaces:ALS.4` | `proposal:TC.5` |
| `AutomorphicGaloisRepresentationsPartII:AG2.3` | `TorsionCohomologyInfrastructure:TC.3` |
| `AutomorphicGaloisRepresentationsPartII:AG2.3` | `TorsionCohomologyInfrastructure:TC.4` |
| `AutomorphicSpectralTheory:AS.6` | `proposal:early-base-change` |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.1` | `proposal:early-padic-characters` |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.3` | `proposal:early-base-change` |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.4` | `proposal:early-base-change` |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.6a` | `AutomorphicGaloisRepresentationsPartII:AG2.1b` |
| `EtaleDualityAndPerverseSheaves:EDC.8` | `AutomorphicGaloisRepresentationsPartII:AG2.1a` |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` | `proposal:finite-field-isogeny` |
| `FunctionFieldArithmetic:FA.2` | `EndoscopicTransferAndUnitaryTraceComparison:ET.3` |
| `GlobalGaloisDeformations:G7` | `PotentialAutomorphyInfrastructure:PA.3` |
| `GlobalGaloisDeformations:G7` | `PotentialAutomorphyInfrastructure:PA.4` |
| `GlobalGaloisDeformations:G7` | `proposal:PA.6` |
| `GlobalGaloisDeformations:G8` | `PotentialAutomorphyInfrastructure:PA.3` |
| `GlobalGaloisDeformations:G8` | `proposal:PA.6` |
| `GlobalShtukasAndFunctionFieldLanglands:GS.0` | `EndoscopicTransferAndUnitaryTraceComparison:ET.2b` |
| `GlobalShtukasAndFunctionFieldLanglands:GS.1` | `EndoscopicTransferAndUnitaryTraceComparison:ET.2b` |
| `HodgeTateAndCanonicalSubgroups:T5` | `AutomorphicCongruences:L5` |
| `HodgeTateAndCanonicalSubgroups:T5` | `AutomorphicCongruences:L5w` |
| `HodgeTateAndCanonicalSubgroups:T5` | `AutomorphicPadicLFunctions:KU-hilberteisenstein` |
| `HodgeTateAndCanonicalSubgroups:T5` | `AutomorphicPadicLFunctions:L3` |
| `HodgeTateAndCanonicalSubgroups:T5` | `AutomorphicPadicLFunctions:L3h` |
| `HodgeTateAndCanonicalSubgroups:T5` | `IntegralIwasawaTheory:I.3` |
| `HodgeTateAndCanonicalSubgroups:T5` | `PadicFamilies:L5` |
| `IntegralHeckeAndGaloisDeterminants:IHG.0` | `proposal:determinant-factor-algebra` |
| `IntegralHeckeAndGaloisDeterminants:IHG.1` | `ArithmeticGaloisRepresentations:R01.1` |
| `IntegralHeckeAndGaloisDeterminants:IHG.1` | `AutomorphicGaloisRepresentations:R19.6` |
| `IntegralHeckeAndGaloisDeterminants:IHG.1` | `IntegralIwasawaTheory:I.5` |
| `IntegralHeckeAndGaloisDeterminants:IHG.1` | `PadicFamilies:L1` |
| `IntegralHeckeAndGaloisDeterminants:IHG.1` | `SerreWeightAndLevelOptimisation:R20.1` |
| `IntegralHeckeAndGaloisDeterminants:IHG.1` | `proposal:determinant-factor-algebra` |
| `IntegralHeckeAndGaloisDeterminants:IHG.4` | `AutomorphicGaloisRepresentations:R19.6` |
| `IntegralHeckeAndGaloisDeterminants:IHG.4` | `AutomorphicGaloisRepresentationsPartII:AG2.4` |
| `IntegralHeckeAndGaloisDeterminants:IHG.4` | `proposal:TC.5` |
| `IntegralHeckeAndGaloisDeterminants:IHG.4` | `proposal:determinant-factor-algebra` |
| `IntegralHeckeAndGaloisDeterminants:IHG.5` | `proposal:TC.5` |
| `IntegralHeckeAndGaloisDeterminants:IHG.5` | `proposal:determinant-factor-algebra` |
| `LocalGaloisDeformationRings:L7` | `PotentialAutomorphyInfrastructure:PA.3` |
| `LocalGaloisDeformationRings:L7` | `proposal:PA.6` |
| `LocalGaloisDeformationRings:L8` | `PotentialAutomorphyInfrastructure:PA.3` |
| `LocalGaloisDeformationRings:L8` | `proposal:PA.6` |
| `LocalGaloisDeformationRings:R08.2` | `PotentialAutomorphyInfrastructure:PA.3` |
| `NeronModelsAndSemistableAbelianVarieties:R11.2` | `ArithmeticGaloisRepresentations:R01.3` |
| `PotentialAutomorphyInfrastructure:PA.1` | `proposal:PA.6` |
| `PotentialAutomorphyInfrastructure:PA.2` | `proposal:PA.6` |
| `PotentialAutomorphyInfrastructure:PA.3` | `proposal:PA.6` |
| `PotentialAutomorphyInfrastructure:PA.4` | `proposal:PA.6` |
| `PotentialModularityAndCompatibleSystems:R24.5:operations` | `AutomorphicGaloisRepresentationsPartII:AG2.6` |
| `ReductiveGroupsPartII:RG2.0` | `proposal:early-padic-characters` |
| `ShimuraVarieties:V5` | `proposal:finite-field-isogeny` |
| `SmoothRepresentationsOfLocalGroups:SR.1` | `IgusaVarietiesAndTorsionConcentration:IG.5` |
| `SmoothRepresentationsOfLocalGroups:SR.3` | `proposal:early-padic-characters` |
| `TorsionCohomologyInfrastructure:TC.4` | `proposal:TC.5` |
| `proposal:PA.6` | `ModularityAndLanglandsExtensions:ML.2` |
| `proposal:TC.5` | `IgusaVarietiesAndTorsionConcentration:IG.6` |
| `proposal:TC.5` | `PotentialAutomorphyInfrastructure:PA.0` |
| `proposal:determinant-factor-algebra` | `AutomorphicGaloisRepresentationsPartII:AG2.4` |
| `proposal:determinant-factor-algebra` | `TorsionCohomologyInfrastructure:TC.3` |
| `proposal:early-base-change` | `EndoscopicTransferAndUnitaryTraceComparison:ET.6` |
| `proposal:early-base-change` | `EndoscopicTransferAndUnitaryTraceComparison:ET.7a` |
| `proposal:early-base-change` | `GL2AutomorphicRepresentationsAndTransfer:R17.4` |
| `proposal:early-padic-characters` | `EndoscopicTransferAndUnitaryTraceComparison:ET.4` |
| `proposal:early-padic-characters` | `EndoscopicTransferAndUnitaryTraceComparison:ET.6` |
| `proposal:finite-field-isogeny` | `AutomorphicGaloisRepresentationsPartII:AG2.1a` |
| `proposal:finite-field-isogeny` | `EndoscopicTransferAndUnitaryTraceComparison:ET.5` |
| `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces` | `ArithmeticGaloisRepresentations:R01.3` |
| `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models` | `ArithmeticGaloisRepresentations:R01.3` |

## Validation and handoff

All 35 input IDs have exactly one verdict, with no omitted or invented findings.
Only the prescribed review JSON and this report are deliverables. The follow-up
fix should implement the confirmed findings with the qualifications above;
33/35 share one producer. It must preserve the three rejected findings' existing
interfaces and recheck the actual rewritten graph.

Run `scripts/check_redteam.py` and `intake.py check-files` for these two files;
record their actual results in the PR. Before publication, compare all tracked
evidence-file hashes and the graph input file set with current main. No Lean
file is required or changed, so Lean compilation is not applicable.
