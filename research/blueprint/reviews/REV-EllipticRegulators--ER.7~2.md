# Independent review of EllipticRegulators ER.7, revision 2

**Verdict: accepted.** Job `REV-EllipticRegulators--ER.7~2`, issue #7043; Codex, session `codex-WCEM3h`, 2026-10-08. This session wrote neither blueprint round. The packet is a complete target-level planning pass, with ER.7 **planned**, zero stages closed and every declaration still `unchecked`. Acceptance does not discharge its six recorded proof gaps or implement its geometric carriers.

## Counts and changes

| Item | Result |
| --- | --- |
| Fresh nodes | 16 checked: 15 verified, 1 corrected, 0 added, 0 unverifiable |
| Baseline declarations | All 12 confirmed at the pins; 0 removed or replaced |
| Definition/construction API | 26 items across four objects |
| Unit tests | 16, four per object |
| Planets | Two new; assembly retains six in total |
| Supplier requests / gaps | 13 / 6, retained explicitly |
| Source findings | E24 confirmed; E25 added and confirmed |
| Reader synchronization | All fresh statements, hypotheses, proof steps, acceptance sentences, API names and test names matched |

The elliptic image prototype's acceptance sentence now says that a **zero Q-linear push map** has zero image. The previous phrase about constant algebraic maps blurred this algebraic test with a constant geometric map, whose relative dimension would change the grading of proper pushforward. The elliptic theorem separately requires a nonconstant finite proper parametrization. No definition, API signature or test changed.

E25 adds a corrected local-polynomial case list to the ModularForms Part II request and inherited Merel proof note, with the same change in the reader and a suggested-file comment. Source records distinguish the two inspected public Merel texts from the uncollated published chapter. E24's independent verdict now names this review. Baseline/source checking records and the top-level review object were refreshed. The obsolete upstream note saying the reader was outside the review's scope was removed; its history remains in the first review report. No atlas data, supplier roadmap or inherited declaration was edited.

## Revision requirements

Every correction requested by [the first review](REV-EllipticRegulators--ER.7.md) is present in the definitive reader and agrees with the packet:

| Required correction | Verification |
| --- | --- |
| Period quotient and Rankin–Selberg owner | SS 2.3, author p.7, places the L-value quotient in c⁺(π)L′(π̌,0)·Qbar. The regulator integral retains 2πi in SS 1.3.2 and 5.2, pp.6,16. The global convolution request names AL.3. |
| Siegel proof routes | §1 pp.5–13 uses power-kernel Poisson summation with beta/contour estimates; §3 pp.21–28 uses Abel limiting, Liouville and product expansions; §5 pp.41–47 separately uses the Gaussian Mellin/Poisson route. The one-dimensional Mathlib theorem is only a baseline ingredient. |
| Good-prime integrality | The boundary of a horizontally unramified compact class lies in weight-one K₁ of the **proper smooth fibre**, whose global units are finite-field units and vanish rationally. No assertion that the open fibre's K₁ is zero remains. |
| General arithmetic-model independence | SchemeKTheoryOperations S.2 transfer/Cartan/base change and S.6 projectors are used with the requested R13.6 common regular mixed-characteristic model. Elliptic-only E.6 does not supply this general-curve result. Total K/G transfer precedes projection to generic weight two. |
| Compact regulator covariance | DS (1.3)(1),(6), p.2, and (2.6)–(2.8), pp.6–8, provide proper shifts, cycle-map compatibility and invariant rational descent. The fresh compact theorem does not depend on the inherited function-field assertion it repairs. The stronger arbitrary-function-field extension remains G2. |
| Reader supplier lists and scope | Precise early L1/M.8 interfaces, graph/weight dependencies, mixed-characteristic domination and local analytic adapters agree. No whole late L1/M.8 edge or noncancelling arbitrary trace is silently assumed. |

## Sources and node checks

The public source URLs, editions, SHA-256 values and exact reading boundaries are recorded in the packet and reader. I read the entire 21-page SS author copy, all three cited Siegel proof routes, the complete Merel appendix pp.143–155, DS's proper covariance/descent and cycle-map passages, Brunault's introductory theorem hypotheses pp.215–218, and Shimura's public page images pp.211–214. I independently rendered both SS residue formulas and both Merel local case lists. The published SS copy was collated at E24, not read completely in this session. Brunault chapter 3 and the underlying 1976 Shimura proofs retain their inherited provenance and are not claimed newly read. The NYU Merel manuscript was read only at §§2.3–2.4, its own pp.283–285.

The Cambridge SS and DS downloads had a certificate-validation failure. Their byte hashes matched the previously recorded source hashes exactly before they were used; the source identity check is explicit, without claiming a successful TLS validation. All mathematical text in the deliverables is in our own words, with locators.

The packet's `review.checked` records a separate decision for every fresh node. The decisive checks were:

| Node suffix | Source locator and check |
| --- | --- |
| `fixed-level-beilinson-subspace` | SS 1.1.1, p.3: span all pairs before compact restriction; comap's empty-span test needs injectivity. |
| `beilinson-subspace` | SS 1.1.1–1.1.3, p.3, and 1.2.9, p.5: common level refinement, actual component degrees and rational degree inversion give the directed transfer union. |
| `cuspidal-hecke-separation` | SS 3.4.0, p.11: the boundary bound p−1 exceeds the cuspidal bound 2√p at p≥7. Finite cusp torsion follows from the disjoint spectra. |
| `constant-symbol-regulator-correction` | SS 1.3.0–1.3.1, p.5, and 3.5.3, p.11: at a full level with rational cusps, principal cusp units and Weil reciprocity cancel the boundary within the unit span. The compact regulator of the constant correction vanishes. The unread general Bloch lemma is avoided. |
| `regulator-period-inclusion` | SS 1.3.2(i), 2.3, 4.5.3, 5.1.0–5.2, pp.6–7,14–16: integral normalization and period algebraicity have distinct 2πi conventions; all named analytic adapters remain supplier obligations. |
| `regulator-nonvanishing-after-level-change` | SS 1.3.2(ii), 4.5.4, §6, pp.6,14,17; Shimura Theorems 1–2 and remark, pp.212–214: an unrestricted even auxiliary twist can avoid both exceptional characters and have nonzero values under every coefficient embedding. Local test vectors require finer level. |
| `isotypic-regulator-image` | SS 1.2.6–1.2.9, p.5: irreducibility in the level tower supplies the entire dual oldvector multiplicity space. |
| `beilinson-rational-structure` | SS 1.1.2(i), 1.2.4–1.2.9, pp.3–5: rational structure is asserted for the regulator image, without full-K₂ rank or injectivity. |
| `beilinson-determinant-formula` | SS 1.1.2(ii), 1.2.2–1.2.6, pp.3–5: disconnected genera are summed; changing a leading coefficient to a derivative contributes only a rational factorial. |
| `ordinary-unit-reduction` | SS 7.2.3–7.2.4, p.19: ac(u)^v(p)/ac(p)^v(u) retains the ramification exponent and is independent of the uniformizer. |
| `supersingular-orders-of-modular-units` | SS 7.1.1 and 7.2.5, pp.18–19: the cuspidal sp(1) quotient and Eisenstein separation imply componentwise equal orders. A generic dual-graph assertion is insufficient. |
| `full-level-modular-symbol-integrality` | SS 7.3.0–7.3.2, pp.19–20: two coprime level factors ≥3, proper-fibre units, normalized components and the codimension-two localization square are retained. |
| `integral-beilinson-subspace` | SS 1.1.2(iii), 7.3.2 and 7.4, pp.3,19–20: regular-model graph transfer and target weight projection give integrality. SS's counterexample prevents an integral Manin–Drinfeld shortcut. |
| `elliptic-beilinson-subspace` | Consumer image definition from SS 1.1.2 and 1.2.9, pp.3,5: proper image requires neither injectivity of norm nor independence of parametrization. Acceptance wording corrected as above. |
| `elliptic-regulator-adjointness` | DS (1.3)(1),(6), p.2, and (2.6)–(2.8), pp.6–8: codimension-zero proper covariance pairs against pulled-back forms; descent uses invariant classes and division by degree. An arbitrary orbit sum can be zero. |
| `modular-elliptic-regulator-line` | SS 1.1.2 and 1.2.6–1.2.9, pp.3,5, with R29.5/R29.6: exact conductor and all bad factors, a nonzero rational differential scalar, integral graph transfer and the functional equation give the nonzero rational Betti line. No optimality assumption is introduced. |

## Baseline at the pins

All twelve actual declaration statements were opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed or replaced.

| Declaration | Convention or hypothesis checked |
| --- | --- |
| `Function.Periodic.qParam` | exp(2πiz/h), with real h and complex z; analytic limiting assertions need their separate positive-width hypotheses. |
| `Function.Periodic.norm_qParam` | exp(−2π Im(z)/h), with the same coordinate convention. |
| `ModularForm.eta` | Exponential prefactor times the q-product; no Kronecker limit theorem supplied. |
| `DirichletCharacter.IsPrimitive` | Conductor equals level; no conductor-existence or nonvanishing theorem implied. |
| `DirichletCharacter.LFunction` | Complex character, nonzero level; agreement with the Dirichlet series uses Re(s)>1. |
| `Submodule.comap` | Semilinear inverse image; no surjectivity assumed. |
| `Submodule.map` | Semilinear image with surjective scalar homomorphism; rational linear maps meet that condition. |
| `Submodule.span_image` | Span/image compatibility with the same scalar-surjectivity condition. |
| `Submodule.mem_iSup_of_directed` | Nonempty index and directed family are indispensable. |
| `Real.tsum_eq_tsum_fourier` | Continuity, locally uniform norm-summability of shifts on compact sets and summable Fourier integrals; Gaussian and power-kernel estimates are additional work. |
| `HeckeRing.GL2.Newform` | Normalized new `EigenformAwayFromLevel`, nonzero level; no missing bad-prime theorem follows. |
| `UpperHalfPlane.peterssonInner` | Conjugates its first argument and integrates invariant hyperbolic volume without congruence-index division. Merel's first-linear normalized pairing reverses the arguments and divides by the index. |

The reviewed ER.7 audit and pinned target-specific searches supply no existing modular K₂, Beilinson-subspace, Siegel-unit, Manin–Drinfeld or Kronecker-limit declaration to duplicate. General submodule operations are used from Mathlib. The two Tau Ceti references were checked from pinned source; they are not imports in the Mathlib-only suggested-file elaboration.

## Closure, ownership, API and planets

I read the 31 distinct external direct prerequisites, including their matching node statements or stage descriptions, and the 25 referenced inherited ER.7 node statements. Exact statements establish existing interfaces where present. An extension beyond a supplier's current statement stays a precise request and a named gap, rather than being treated as already supplied.

The main supplier boundaries are modular cusps/cyclotomic components (R12.3), Siegel-unit products and cusp-unit realization (Kato L0), Hecke/Jacobian adjointness (R12.5), differential/motive and special-fibre data (R14.6 and R13.5), common regular arithmetic models (R13.6), total K/G operations and Adams projectors (S.2/S.6), local Whittaker vectors (R16.2), global Hecke multiplicities (R16.4), convolution normalization (R16.5 with AL.3), period algebraicity/all-conjugate nonvanishing (PS.1), and the existing upstream modular-symbol carrier with a precise ModularForms Part II Merel adapter. None of these requests asserts that a missing adapter is already proved.

The confirmed RT-AREA-ktheory-2/6 ownership correction is preserved: ER.7 consumes Kato L0 and its early L1 pair-symbol interface. It does not replan modular units or their generic modular K₂ symbols, and it does not import the whole late L1 stage. The regulator normalization similarly requests an early M.8 prefix without claiming a cyclic whole-stage dependency has been resolved. The four fresh objects are ER.7-specific subspace/image constructions and the ramified reduction adapter.

At target granularity, the stage's explicit character symbols, conditional original-level formulas, regulator/Rankin–Selberg input, level-transfer nonvanishing, three parts of SS 1.1.2, arithmetic integrality and elliptic parametrization/descent have named nodes or explicit requests/gaps. No non-routine theorem is passed off as a routine step. No added node is needed.

The 26 API items cover membership, monotonicity/extensionality, directed transfer, map/span and composition compatibility, and multiplicative reduction identities. The sixteen tests detect span-before-compactness mistakes, missing injectivity, empty/zero transfer and rational degree-inversion mistakes, kernel loss under projection, and loss of the ramification exponent or base-multiple cancellation. The suggested file defines genuine operations on supplied modules and homomorphisms, rather than dummy geometric carriers. Missing scheme K₂/Deligne/modular-unit instantiations and the twelve remaining geometric theorem signatures are stated as missing. Two new planets, **Beilinson subspace** and **Integral Beilinson subspace**, are key objects; the assembly instruction removes the two supplier-owned planets and retains six in total.

G1–G6 remain honest obligations: early pair/cusp interfaces; early regulator normalization and stronger function-field covariance; composite-level Merel normalization and analytic E15/E16/E17 error location; certified X₁(11) sign; a primitive even twist at exactly the original modulus; and the analytic, special-fibre, period and mixed-characteristic supplier proofs. The general elliptic existence argument uses unrestricted auxiliary conductor and does not rely on G4 or G5. A complete planning pass with these recorded gaps is permitted by the issue and protocol; marking ER.7 closed would be inaccurate.

## Source findings

**E24 confirmed.** SS 3.1.8 prints an inverse cusp width in the author copy p.9 and published scan p.286. With q_w=exp(2πiz/w), log|q_w|=−2πy/w and Eφ asymptotic to −2πyφ, the logarithmic coefficient is wφ. Applying 2∂ gives residue wφ. Width two and φ=1 give two instead of one half. SS 3.5.0–3.5.1, p.11, corroborate this with div(u)=ord(u)/w and η_div(u)=dlog(u). The independent page-image and correction-search records are in the packet.

**E25 added and confirmed.** In [Merel's appendix](https://arxiv.org/pdf/math/0602186v1), §2.c p.147, let r=v_p(m/mω)>0. The defining polynomial is

R_p(X)=(conjugate(a_p)p^(1−k/2)X)^(r−1)(conjugate(a_p)p^(1−k/2)X−conjugate(ω(p))).

At a_p=0 it gives −conjugate(ω(p)) for r=1 and zero for r>1. The explanatory cases are swapped. For unramified ω with ω(p)=1, substitution gives −1 and zero, so this is directly testable. The subsequent exceptional case uses the corrected value. The [public later author manuscript](https://math.nyu.edu/~tschinke/.manin/final/merel/merel.pdf), §2.3 own printed p.284, repeats the typo; both pages were rendered and inspected. Its own pagination is distinct from the published chapter. The version of record was not collated, so the finding is scoped to the two inspected texts. The arXiv version history, Merel's research page and exact-title errata/corrigendum searches supplied no correction. This corrects a proof case list; it does not reject Theorem A or locate the separate E15/E16 analytic discrepancy.

## Checks and orchestrator questions

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.7.json`: **0 errors, 0 warnings**.
- Shared source-finding validation (`source_issues.check_issues` and `check_errata.versions_checked`): no errors.
- Packet/reader comparison: no missing fresh statement, hypothesis, proof step, acceptance item, API name or test name; all thirteen supplier requests and inherited proof notes agree.
- `lean-check research/blueprint/suggested/EllipticRegulators--ER.7.lean`: **exit 0**, 42 warnings, all for `sorry`; no other warnings or errors. This checks the prototypes and test signatures at pinned Mathlib, not geometric implementation or the separately source-checked Tau Ceti imports.
- Deliverable completion and changed-file scope checked; `git diff --check` clean.

**Questions for the orchestrator: none.** The current acceptance replaces the prior `needs_changes` verdict. Assembly should preserve the explicit supplier obligations, the two source corrections and the distinction between complete planning and proof closure. No manual promotion is part of this review.
