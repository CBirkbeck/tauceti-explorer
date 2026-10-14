# Independent review: Endoscopic transfer and unitary trace comparison, ET.4–ET.6

**Verdict: needs_changes. Review finished on 2026-10-14 by Codex (GPT-6), session codex-qDQYFW, issue #395.** The original planning session was Claude claude-d0gQRk, issue #718. This is a completed independent review, not a checkpoint or a claim that the mathematics has been formalised.

The corrected statements are useful, but the plan still has real closure gaps: prohibited upward prerequisites have no current-tier replacements; the full Weil–Deligne factor argument omits monodromy; and several indispensable geometric and primary-source inputs are missing. Those nodes are explicitly `unverifiable`. Mere partial coverage is not the reason for the verdict. The separate ET.6a packet and its later stages have their own review; this report checks their interfaces, not their full contents.

## Counts and scope

The original packet had 66 nodes; the reviewed packet has 69: 45 theorems, 9 definitions, 11 constructions and 4 applications. Every node has a review entry: 1 verified, 36 corrected, 29 unverifiable and 3 added. There are 133 API items, 79 definition/construction tests, 18 planets, 12 gaps and 11 precise requests. All implementation statuses remain `unchecked`.

ET.4, ET.5 and ET.6 are partial, with specific remaining lists. ET.6a, ET.7, ET.7a and ET.7b are `not_read` here and point to the separate packet. None is claimed planned or closed. The 69 nodes are below the target-level budget; no budget exhaustion is claimed. Internal proof steps stay within target nodes, except for three missing key objects/results added below.

## Baseline and ownership

The single baseline citation was opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: `MeasureTheory.Measure.IsHaarMeasure`, module `Mathlib/MeasureTheory/Group/Measure.lean`. It exists and requires finiteness on compact sets, left invariance and positivity on nonempty open sets. Its `provides` field is corrected: it supplies neither quotient/Tamagawa measures nor character integrability nor Weyl integration. Regularity is an additional condition in general, automatic in the second-countable local setting. No baseline entry was removed or added. Tau Ceti is pinned at `f790474821cf4256814db967cb154e7af3d0c369`.

The current TauCetiRoadmap and Tau Ceti library were read, including the nine roadmaps newer than the atlas snapshot. Existing local reciprocity, Weil groups, reductive groups, semisimple-algebra infrastructure and the special Weil–Deligne object are imported rather than replanned. Arithmetic reciprocity is adapted by Art_geo(x)=Art_arith(x⁻¹) in the **abelianized** Weil group; inversion is not advertised as an automorphism of the nonabelian Weil group. The special object belongs to `ArithmeticGaloisRepresentations:R01.2`, not a second ET definition.

The reviewed library audit has no direct ET record. Adjacent audited suppliers were inspected; this is not represented as an ET audit accepting these targets. Supplier statements checked include SR's induction, classification and derivatives, AS's untwisted trace formula, AL's factors, EDC's trace theorem, PEL's representability/properness, abelian-variety Tate/Honda–Tate inputs, and the ET.0/ET.1/ET.3 transfer interfaces. The gaps distinguish what these actually supply from what the ET proof needs. In particular:

- AS.6's untwisted invariant formula is not the missing twisted invariant formula.
- EDC.8's general trace/contraction theorem does not verify the Igusa boundary or correspondence legs.
- PELModuli:M2 gives a smooth algebraic space at good level and good-prime properness; it does not prove projectivity and Drinfeld-level representability.
- AL.3/rs-local-factor has generic inputs. It does not supply arbitrary irreducible segment-pair factors with monodromy.
- SR.5's derivative interface is not the multiplicity-one newvector theorem used in Scholze Corollary 11.5.

ET is tier 14; IG is tier 19; BG is outside the 94-roadmap order. Their upward imports were removed, not replaced by a fictitious proof. WORKERS.md requires the needed B(G), J_b, Newton/decency and finite-level Igusa prefix to be planned **here**, after which higher plans import it. The exact removed edges and future owner repair appear in the handoff.

## Source checking

Locators below refer to the editions in the packet's `sources` and `sourceVersions`, which record URLs and available checksums. Statements and proof routes were compared at their locators; unread underlying primary proofs remain gaps. This table records the decisive checks, not summaries of the papers.

| Source and public version | Decisive locator and review result |
| --- | --- |
| [Caraiani–Scholze noncompact](https://arxiv.org/abs/1909.01898v2), v2 | §§5.3–5.6, pp. 68–76: transfers, twisted comparison, central quotients and semidirect product. |
| [Caraiani–Scholze compact](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), published | §§5.2–5.5, pp. 732–743: group/trace normalizations. Printed page = PDF + 648. |
| [Shin, Counting points](https://math.berkeley.edu/~swshin/IgusaVar.pdf), author copy | Definition 6.1, Lemma 6.4, Definitions 8.1–8.2 and Proposition 8.4/Corollary 8.5, pp. 24–26; §§10–13: negative Frobenius shift, p-adic types, effective triples and Igusa weights. Printed = PDF, correcting the old offset. |
| [Shin, Stable Igusa](https://math.berkeley.edu/~swshin/StableIgusa.pdf), author copy | (1.2), §§5–8, especially Remark 6.4 and (8.7), (8.11): component factor, c-coefficient and both modulus twists. Printed = PDF. |
| [Shin, Stable Galois](https://math.berkeley.edu/~swshin/StableGal.pdf), author copy | §4 before (4.2), p. 21; §§4.2–4.7; §6.2: inverse transpose, canonical intertwiners and residual spectrum. Corollaries 6.5/6.7 do not state the claimed general unitary descent. |
| [Scholze LLC](https://arxiv.org/abs/1010.1540v1), v1 | §§2–14, especially Lemma 3.2(iii), Theorems 10.5–10.7, Corollary 11.5, Theorems 12.1/12.3 and 13.5/13.6, pp. 27–35: integrality, proof order and missing hypotheses. Printed = PDF. |
| [Arthur–Clozel](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Clay scan | Ch. 1 §6, particularly Lemma 6.10; Ch. 3 §§1–6: tempered character identity, supercuspidal dichotomy, lifting and induction at partially split places. Printed = PDF − 16. |
| [Zelevinsky](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), published | §3.5 pp. 182–183, §4.1 p. 184, §6 and §9: derivative order d and Z/L conventions; §9 is not a proof of the later dual algorithm. Printed = PDF + 163. |
| [Tadić](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), published | Theorems 7.1/7.3 pp. 368–370; Definition 7.4 and Theorem 7.5 p. 370: real exponents and the open complementary range. Printed = PDF + 334. |
| [Kottwitz, harmonic analysis](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), Clay volume | pp. 394–396 and §7 pp. 421–423. §7 proves a Lie-algebra Weyl formula; the group statement needs its own Jacobian argument with the rational normalizer quotient. |
| [Labesse](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Numdam | Proposition 2.5.3 p. 61, Theorem 3.3.1 pp. 78–79, Proposition 3.3.2 p. 79, Proposition 4.3.2 p. 102 and Theorem 4.3.4 p. 103: norm, transfer and conditional stabilized comparison. |
| [BCGP](https://arxiv.org/abs/2502.20645v1), v1 | §1.6 p. 8 and §1.8.22 p. 15: remaining weighted input and forward algebraicity of GSp₄ transfer. The ordinary twisted fundamental lemma is a different, proved input. |
| [Liu–Tian–Xiao–Zhang–Zhu](https://par.nsf.gov/servlets/purl/10323568), maintainer-cleared published copy | Proposition C.3.1 p. 363 is for the specified relevant cuspidal cohomological parameter and hermitian signatures, not every generic parameter. Definition D.2.1 and Lemma D.2.2(3) p. 369 check transferable small levels. Read only in place; no file or passage copied. |
| [Atobe–Kondo–Yasuda](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), published 55-page edition | §§2.1–2.6 pp. 6–12; Lemma 2.9 p. 12; Proposition 6.1 p. 28; Lemmas 6.5–6.6 pp. 33–34. Lemma 2.9 is not in the cited older preprint. The retained truncation criterion has degree-one cuspidals. |
| [Newton–Thorne](https://arxiv.org/abs/2212.03595v2), v2 | Lemma 3.6 and proof pp. 17–18: a specified order-p division-algebra type and its Bernstein component, not a formula for every depth-zero representation. |
| [Badulescu](https://imag.umontpellier.fr/~ioan-badulescu/Files/jimj.pdf), author copy | Theorem 2.1 pp. 3–4; §2.1 p. 5; Theorem 3.1 pp. 9–10; Propositions 3.2–3.3 p. 11; Theorem 3.6 pp. 13–15; Q and Proposition 3.9 pp. 15–16; Conjectures 3.10–3.11 p. 17. Q is not an inverse to the Grothendieck map LJ. |
| [KMSW](https://arxiv.org/abs/1409.3731v1), v1 | Theorem* 1.6.1 pp. 79–80 and Theorem* 1.7.1/Remark 1.7.2 pp. 88–89: tempered local packets and unconditional generic pure-inner global scope. Generic global parameters need not be locally tempered; εψ=1 for the generic global parameter is correctly retained. |

**Source issue E2 is confirmed for arXiv:1909.01898v2 §5.5 p. 72.** The displayed transpose-conjugation without inverse reverses products. Inverse transpose gives the required automorphism; Shin §4 before (4.2), p. 21 supplies the comparison. The review records the exact version and does not assert that every later version has the slip. No additional source error is asserted merely from an unsupported blueprint claim or an unproved generalization.

Harris–Taylor is not cleared in the library index, so no other copy was used. Its primary proofs remain explicitly unread. Public Labesse alternatives may resolve some transfer inputs. Other unread primary proofs, including the twisted invariant formula, full classical JL, deformation/nearby-cycle theory, the dual algorithm and explicit level-zero twists, are listed in the packet rather than represented as checked.

## Main mathematical repairs

1. The stable elliptic distribution has its centralizer-component denominator and correct real split-centre quotient. A normalized intertwiner must be the canonical one; an order condition alone does not choose it. Only the derived special unitary group is simply connected. Residual Speh terms are not discarded from the discrete spectral term.
2. Cyclic GL base change is established early, with its tempered identity and Langlands extension distinguished. The supercuspidal image can be the full conjugate-orbit induction. The global formula includes partially split places. Unitary local base change uses the unitary L-embedding and endoscopy. The claimed unrestricted unitary descent is narrowed to Scholze Theorem 10.5's division datum and square-integrable-place hypotheses.
3. Acceptability uses ν=−slope and fr^(−sN). The p-adic classification is unpolarized. Ordinary Shimura triples are distinct from Igusa triples. Haar volume matters for double-coset traces. For basic GL₂ the effective trivial endoscopic group is split GL₂, and c=e_p(J_b)=−1, not 1. Transfer has the initial half-modulus twist, sum over embeddings and final inverse half-modulus twist. The central shift is χ(t)^(−z).
4. The Scholze proof separates early positive rec_un, integrality via Lubin–Tate multiplicity one, the character identity, and later global Galois representations. The omitted unramified-to-Iwahori axiom is restored. The constructive bijectivity proof replaces the incorrect numerical attribution. Potential abelianity and the globalization hypotheses are stated at all required places.
5. Full WD factors require segment-pair formulas and the monodromy conductor; semisimple support alone cannot prove them. St₂ and the trivial representation expose that error. Inner-form parameters use Q's split Langlands quotient, not an inverse of LJ. The general signed irreducibility claim was a conjecture in the cited 2007 source and is removed. Parameter absence is proved using block-size divisibility, not merely LJ=0. The purported general depth-zero formula is restricted to the exact Newton–Thorne case.

## Added targets

All three additions carry `addedBy: REV-EndoscopicTransferAndUnitaryTraceComparison--ET.4`:

- `ET.5/p-adic-type`: the divisor, multiplicity and field-action object from Shin Definitions 8.1–8.2 pp. 24–25, with five API items, four tests (ordinary, real half-slope, product and ramified pullback), and a planet. Existing Tate/Honda–Tate remains imported.
- `ET.6/post-correspondence-global-galois`: Theorems 10.6–10.7 and Corollary 13.2, explicitly after local LLC, with dimension a n, the unramified twist and no monodromy assertion. This removes the circular earlier placement.
- `ET.6/inner-form-langlands-parameter`: Q constructed from JL of ordered essentially square-integrable data, five API items and three tests, including the quaternion trivial representation versus St₂ and the split identity. No inverse-LJ claim remains.

## Per-node correction ledger

Node identifiers omit the common `EndoscopicTransferAndUnitaryTraceComparison:` prefix. `Unverifiable` includes repairs made to that node; it means the named remaining proof/supplier gap was not certified.

| Node | Verdict | Changes and remaining issue |
| --- | --- | --- |
| `ET.4/padic-character-distributions` | unverifiable | Distinguish the rational normalizer quotient from the rational points of the algebraic Weyl group; make the source scope explicit. Remaining: Harish–Chandra/twisted character primary proofs remain open. |
| `ET.4/twisted-characters` | unverifiable | Specify the canonical intertwiner and restrict rational norm injectivity to GL_n. Remaining: The general twisted-character primary input is still not independently established. |
| `ET.4/tamagawa-number-formula` | unverifiable | Only special unitary derived groups are simply connected. Remaining: Tamagawa primary proof remains open. |
| `ET.4/stable-elliptic-distribution` | corrected | API StableEllipticDistribution test StableEllipticDistribution.torus test StableEllipticDistribution.non_elliptic_zero Restore the centralizer-component factor and correct the central quotient and false stability test. |
| `ET.4/elliptic-stabilization` | unverifiable | Use compact support modulo the specified real split centre with compatible central characters. Remaining: Primary elliptic-stabilization proof remains open. |
| `ET.4/base-change-groups` | corrected | The semidirect product is built from the base-change group 𝒢, not its fixed subgroup G. |
| `ET.4/unramified-transfers` | verified | Statement, locator, hypotheses and direct supplier interface checked independently; no in-place repair required. This verdict does not certify unresolved supplier proofs. |
| `ET.4/base-change-transfer-of-functions` | corrected | Added the precise Numdam printed locators after checking the norm and finite-place transfer statements. |
| `ET.4/small-level-transfer` | corrected | Added printed page 369 and Definition D.2.1 to the transferable-level locator. |
| `ET.4/archimedean-lefschetz-functions` | unverifiable | Use compact support modulo the specified real split centre with compatible central characters. test eulerPoincareFunction.trivial_compact test lefschetz_bcMatching.signature_check test twistedLefschetzFunction.wrong_weight Remaining: Twisted Lefschetz primary proof and the signature-dependent packet calculations remain open. |
| `ET.4/twisted-trace-formula` | unverifiable | Use compact support modulo the specified real split centre with compatible central characters. Remaining: The primary twisted invariant formula is not supplied by the untwisted AS.6 node. |
| `ET.4/cuspidal-levi-subsets` | unverifiable |  Remaining: Primary twisted geometric simplification remains open. |
| `ET.4/no-proper-cuspidal-subsets` | unverifiable |  Remaining: Primary twisted geometric simplification remains open. |
| `ET.4/twisted-geometric-side` | unverifiable | Use compact support modulo the specified real split centre with compatible central characters. Remaining: Primary twisted geometric simplification remains open. |
| `ET.4/twisted-spectral-side` | unverifiable | Do not discard the residual discrete spectrum in the full-Levi term. Remaining: Primary spectral simplification and residual coefficients remain open. |
| `ET.4/stable-twisted-identity` | unverifiable | Use compact support modulo the specified real split centre with compatible central characters. Remaining: Depends on the unresolved primary geometric/spectral simplifications. |
| `ET.4/simple-division-algebra-trace-identity` | corrected | Separate the division-place vanishing condition from a claim that the endoscopic set is trivial. |
| `ET.4/local-cyclic-base-change` | corrected | Correct the supercuspidal dichotomy, tempered scope and noncircular Langlands extension. |
| `ET.4/global-cyclic-base-change` | corrected | Expose the missing archimedean supplier for strong lifting; repair printed locators. |
| `ET.4/cyclic-automorphic-induction` | corrected | Include partially split places and replace the unsupported extra trace-formula proof route. |
| `ET.4/unitary-gl-base-change-descent` | unverifiable | Replace unsupported unrestricted base change by the exact division-data descent actually stated in the source. Remaining: Narrowed to Scholze Theorem 10.5; its Harris–Taylor proof and the broader original transfer are still open. |
| `ET.4/unitary-endoscopic-classification` | unverifiable | Read KMSW directly, preserve the correct generic ε=1, and restrict scope and local packet assertions. Remaining: Generic pure-inner scope checked; non-tempered local construction and full stabilization chain remain open. |
| `ET.4/gsp4-gl4-transfer` | unverifiable | Remove an unsupported algebraicity equivalence and pin the symmetric-cube example to the regular cuspidal case. Remaining: Forward algebraicity repaired; the full primary GSp₄ classification chain remains open. |
| `ET.4/acceptance-examples` | corrected | Distinguish U(1) and its similitude torus in the rank-one check. |
| `ET.5/acceptable-test-functions` | unverifiable | Pin ν=−slope and the sign of the acceptable Frobenius shift. Remove illegal upward supplier imports and record the local planning required by WORKERS.md. Remaining: Missing current-tier algebraic/Igusa inputs after removing illegal upward citations. |
| `ET.5/igusa-fixed-point-formula` | unverifiable | Restore the Haar normalization and state the boundary and leg checks the trace theorem needs. Remove illegal upward supplier imports and record the local planning required by WORKERS.md. Remaining: Missing current-tier algebraic/Igusa inputs after removing illegal upward citations. |
| `ET.5/igusa-kottwitz-triples` | unverifiable | test KottwitzTriple.compat_shimura Remove the false rational inner-form identification and distinguish ordinary and σ-conjugacy triples. Remove illegal upward supplier imports and record the local planning required by WORKERS.md. Remaining: Missing current-tier algebraic/Igusa inputs after removing illegal upward citations. |
| `ET.5/p-adic-types` | corrected | Correct the classification to unpolarized B-linear objects and add the missing definition with API and four discriminating tests. |
| `ET.5/fixed-points-and-effective-triples` | unverifiable | Restore acceptable a, the correct quasi-isogeny centralizer and the distinction between point stabilizers and orbital weights. Remove illegal upward supplier imports and record the local planning required by WORKERS.md. Remaining: Missing current-tier algebraic/Igusa inputs after removing illegal upward citations. |
| `ET.5/igusa-counting-formula` | corrected | Do not identify the Igusa indexing set with the ordinary Shimura point-count triples. |
| `ET.5/stabilization-away-from-p` | corrected | Use compact support modulo the specified real split centre with compatible central characters. |
| `ET.5/jb-endoscopic-levi-data` | unverifiable | test JbEndoscopicTriples.gl_basic test JbEndoscopicTriples.ordinary Correct the endoscopic group in the basic division example and restrict the torus maps. Remove illegal upward supplier imports and record the local planning required by WORKERS.md. Remaining: Missing current-tier algebraic/Igusa inputs after removing illegal upward citations. |
| `ET.5/transfer-at-p` | corrected | Restore the actual c_{M_H} formulas, the initial and final modulus twists and the embedding sum. |
| `ET.5/igusa-endoscopic-test-function` | corrected | Use compact support modulo the specified real split centre with compatible central characters. test igusaEndoscopicTestFunction.not_naive Use the general PEL infinity supplier and qualify the nonstandard-transfer test. |
| `ET.5/stable-igusa-trace-formula` | corrected | Extend the stable identity linearly to acceptable functions, as in the source. |
| `ET.5/acceptable-functions-determine` | corrected | Correct the inverse central-character power and group equal eigenvalues in the density argument. |
| `ET.5/unitary-igusa-trace-formula` | unverifiable | Remove illegal upward supplier imports and record the local planning required by WORKERS.md. Remaining: Missing current-tier algebraic/Igusa inputs after removing illegal upward citations. |
| `ET.5/acceptance-examples` | corrected | Replace false c=1, dimension and naive-trace failure examples by exact local checks. |
| `ET.6/cuspidal-segment` | corrected | Correct the published AKY locator. |
| `ET.6/segment-representations` | corrected | API Segment.zelevinskyRep_derivative Correct the derivative order and name its supplier. |
| `ET.6/zelevinsky-classification` | unverifiable | Do not credit the later involution algorithm to Zelevinsky 1980; record the unverified primary proof. Remaining: The primary dual-algorithm proof is not supplied. |
| `ET.6/multisegment-operations` | corrected | test Multisegment.ram_steinberg Correct the Z/L convention in the ram test. |
| `ET.6/ladder-and-constituent-theorems` | corrected | Use the published lemma and make the full-WD dependency explicit. |
| `ET.6/tadic-unitary-dual` | corrected | Specify real exponents and correct Tadić printed pages. |
| `ET.6/segment-wd-parameter` | corrected | Import the existing special object, require normalized σ and twisting, and count d Jordan blocks per segment. |
| `ET.6/llc-characterizing-properties` | corrected | API IsFunctorialExtensionCFT API IsFunctorialExtensionCFT.baseChange test IsFunctorialExtensionCFT.steinberg_ss Restore the missing unramified-to-Iwahori axiom and naturality; distinguish later properties and the existing arithmetic reciprocity convention. |
| `ET.6/drinfeld-level-deformation-spaces` | unverifiable | API DrinfeldLevelCover.galois test DrinfeldLevelCover.not_etale_special Restore semilinear Frobenius, completion along a finite subscheme and the generic-fibre scope of Galois; repair the ramification test. Remaining: Formal comparison and Drinfeld deformation suppliers remain open. |
| `ET.6/scholze-test-functions` | corrected | test scholzePhi_unramified Replace the unsupported spherical-function citation by a direct linearity test and add the trace-theorem locator. |
| `ET.6/norm-maps-and-base-change-identities` | corrected | Define B_r and D_r and distinguish the infinitesimal division-algebra norm from the étale D-group case. |
| `ET.6/test-function-descent` | corrected | Restore Lemma 3.2(iii), integrality on supercuspidals, and the dimension in (ii). |
| `ET.6/comparison-of-two-functions` | corrected | Specify the base of the product and correct the tensor-product test function. |
| `ET.6/division-algebra-shimura-varieties` | unverifiable | test DivisionAlgebraShimuraVariety.split_not_proper Retain all auxiliary-data hypotheses and remove the overgeneral nonproperness claim. Remaining: Existing good-prime algebraic-space/properness suppliers do not prove projective Drinfeld-level representability. |
| `ET.6/drinfeld-level-point-count` | unverifiable | Restore the residue-degree-dependent central translate, tensor-product notation and separate ordinary Shimura coefficients. Remaining: Ordinary Kottwitz weights and the trace application suppliers remain open. |
| `ET.6/global-galois-input` | corrected | Separate early positive rec_un from the later Galois theorem; restore the multiplicity, duals and unramified twist. |
| `ET.6/scholze-local-langlands` | corrected | Distinguish rec_un and normalized σ, and close the omitted integrality step without invoking later conclusions. |
| `ET.6/lubin-tate-comparison` | unverifiable | Correct the acting group and compact induction; remove the circular dependence on the completed character identity. Remaining: The indispensable multiplicity-one newvector supplier remains open. |
| `ET.6/supercuspidal-bijection` | corrected | Restore the critical Iwahori axiom and replace the incorrect numerical proof attribution by the actual constructive induction. |
| `ET.6/non-galois-automorphic-induction` | unverifiable | Restore all-place potential abelianity and all missing hypotheses of Theorems 13.5–13.6. Remaining: Archimedean and algebraic-Hecke-character realization suppliers remain open. |
| `ET.6/l-epsilon-of-pairs` | corrected | Supercuspidal factor identities checked against Scholze Theorem 14.1 and Lemma 14.2 pp. 35–36. Removed the misleading parenthetical suggesting that arbitrary irreducible factors follow from supercuspidal support alone; that extension needs the separate full-WD gap. |
| `ET.6/full-wd-local-langlands` | unverifiable | Expose the missing segment-pair factor and monodromy-conductor proof instead of the false cuspidal-support reduction. Remaining: The full monodromy pair-factor/conductor extension has a genuine proof gap. |
| `ET.6/semisimple-langlands-parameter` | corrected | API innerFormSemisimpleParameter Use the correct irreducible map Q to attach inner-form parameters. |
| `ET.6/local-jacquet-langlands` | unverifiable | Add the primary statement for all GL_r(D), rather than relying only on the D× application. Remaining: The all-r statement is recorded in Badulescu; full classical JL proof remains an imported primary gap. |
| `ET.6/badulescu-langlands-jacquet-map` | corrected | Correct the domain and scope of the transfer statements, kernel, surjectivity and source theorem numbers; remove the unproved signed-irreducibility assertion. |
| `ET.6/inner-form-nontransfer` | corrected | Replace the nonexistent inverse correspondence by the square-integrable block-size obstruction. |
| `ET.6/level-zero-explicit` | unverifiable | Restrict the false general depth-zero formula to the precise cited component assertion; retain the unread primary formula as a gap. Remaining: Only the specific NT component assertion was checked; general BH rectifier formula remains unread. |
| `ET.6/acceptance-examples` | corrected | Specify the real exponent and separate tempered and reducibility endpoints. |
| `ET.5/p-adic-type` | added | Added missing target with primary locator; definition/construction includes API and discriminating tests. Dependent proof gaps remain recorded separately. |
| `ET.6/post-correspondence-global-galois` | added | Added missing target with primary locator; definition/construction includes API and discriminating tests. Dependent proof gaps remain recorded separately. |
| `ET.6/inner-form-langlands-parameter` | added | Added missing target with primary locator; definition/construction includes API and discriminating tests. Dependent proof gaps remain recorded separately. |

The ledger also covers API/test repairs: matrix-domain qualifications, the d copies of a monodromy block, semilinear Frobenius, generic-fibre étaleness/Galois assertions, modulus/sign checks, Z/L conventions and false endpoint examples. Definition/construction tests remain planned mathematical checks; only the numerical Lean signatures are elaborated. Named planets retain the target-level grouping, with six each in ET.4, ET.5 and ET.6.

## Confirmed red-team findings

- **RT-AREA-langlands-1/1**: Early cyclic/unitary inputs remain in ET.4. Review separates ET.6/global-galois-input from ET.6/post-correspondence-global-galois and adds the omitted integral virtual-representation step, breaking the source-order circle. The full-WD factor extension remains a genuine gap; it is not proved by semisimple-support multiplicativity.
- **RT-AREA-langlands-1/2**: The general Fujiwara–Varshavsky theorem is owned by EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula (with EDC.8/frobenius-twist-contracting); ET.5/igusa-fixed-point-formula keeps only the Igusa application (isolation, finiteness, large Frobenius power), and ET.6/drinfeld-level-point-count imports the same EDC.8 node for Scholze §9. Review records the missing Igusa boundary/leg application checks and normalized double-coset coefficient; naming EDC.8 alone is not closure.
- **RT-AREA-langlands-1/5**: Tate and Honda–Tate are imported from the existing F0/F3 nodes. Added ET.5/p-adic-type defines the missing divisor/multiplicity/field-action object. ET.5/p-adic-types classifies unpolarized B-linear objects; polarization enters only the effective-triple proof. Ordinary Shimura weights and Igusa triples are kept distinct.
- **RT-AREA-langlands-1/10**: Kottwitz's formula τ(G) = |π_0(Z(Ĝ)^Γ)|/|ker^1| with the simply connected input and the values for G_n⃗ and 𝒢_n⃗ is ET.4/tamagawa-number-formula; ι(G,H) is defined in ET.4/stable-elliptic-distribution; ET.5 reuses them (ET.5/stable-igusa-trace-formula) rather than proving them again.
- **RT-AREA-langlands-1/13**: ET.5/stabilization-away-from-p states that the route does not invoke the twisted fundamental lemma, which is proved for unit elements (Waldspurger with Ngô) and for spherical functions (Lemaire–Mœglin–Waldspurger), citing ET.3/twisted-fundamental-lemma-and-transfer; the stage text's 'unproved' wording is not repeated.
- **RT-AREA-langlands-1/15**: ET.4/padic-character-distributions (local integrability, local constancy, Weyl integration formula) and ET.4/twisted-characters (Clozel's twisted characters, twisted Weyl formula) are an early prefix feeding ET.4 and ET.6; restructure proposal 2 names the future SR Part II owner question.
- **RT-AREA-padic-1/25**: ET.6 uses only the finite-level deformation spaces with Drinfeld level structure (ET.6/drinfeld-level-deformation-spaces) and not the Scholze–Weinstein classification over O_C; the classification's placement concerns ET.6a and HodgeTateAndCanonicalSubgroups:T2 and is handled by the ET.6a packet's restructure proposal.
- **RT-AREA-geomlanglands/2**: Not an ET.4–ET.6 matter: the comparison of the classical towers with Hecke fibres is owned by ET.6a in the ET.6a packet. ET.6 supplies the finite-level spaces and the normalised correspondence that ET.6a consumes.
- **RT-AREA-geomlanglands/32**: Review found the proposed tier rearrangement did not implement WORKERS.md. Upward BG/IG prerequisites have been removed and the exact algebraic and Igusa prefix to be planned here is a gap. No owner move is claimed complete.

The ET.6a and later interfaces are not certified by this review. The packet gives exact future node references in `coverage.remaining`, rather than promoting those stages on the strength of an interface inspection.

## Reader discrepancies and orchestrator decisions

The reader is not an authorized deliverable of #395. It remains stale. A revision must update [the reader](../readmes/EndoscopicTransferAndUnitaryTraceComparison--ET.4.md) from the corrected statements, proof order, API and tests, especially:

- stable elliptic distribution and central quotients; canonical intertwiner and the correct base-change semidirect group;
- unitary descent/classification scope and residual discrete terms;
- p-adic types, ordinary versus Igusa weights, negative acceptability shift and χ(t)^(−z);
- both modulus twists and c=−1 in the basic GL₂ transfer check;
- the unramified-to-Iwahori axiom, early integrality and late global Galois split;
- Drinfeld-level geometry, full WD factors, Q versus LJ and the restricted level-zero case;
- printed offsets and the published AKY edition; the removed upward dependencies and precise partial coverage.

Decisions needed for the revision, rather than questions holding this review open:

1. Assign the missing algebraic/Igusa prefix to ET at the present tier; after it is planned, repoint BG/IG imports. A proposed future tier rearrangement is not a replacement for these nodes.
2. Resolve exact lower-tier nodes for formal-adic comparison, deformation/Drinfeld levels, projectivity, the correspondence boundary and ordinary Kottwitz weights. Stage-only requests are not proofs.
3. Supply the SR.5 multiplicity-one newvector and AL.3 segment-pair/full-WD factor inputs, with primary locators and conventions. Supply archimedean base change and ℓ-adic Hecke-character realization.
4. Obtain cleared primary-source access where necessary, or use public replacements, and close the remaining trace/classification/dual-algorithm/level-zero proof gaps.
5. Authorize a reader revision as part of the resulting revision job. ET.6a and later ownership edits remain that packet's work; they should use this corrected interface.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/EndoscopicTransferAndUnitaryTraceComparison--ET.4.json` reports **0 errors and 0 warnings**, with 69 nodes, 133 API items, 79 tests and 18 planets. The suggested file is 242 lines, contains real-bodied light definitions and theorem/example `sorry`s, and has no sorry-backed data definition. `lean-check` at the pinned shared environment exits successfully with **27 warnings, all declaration uses of sorry, and no errors**. These checks validate format and elaboration; they do not close the mathematical gaps.

The handoff records the unfinished plan repairs and owner changes. This review's deliverables and verdict are complete; the plan should enter revision, not be accepted or promoted.
