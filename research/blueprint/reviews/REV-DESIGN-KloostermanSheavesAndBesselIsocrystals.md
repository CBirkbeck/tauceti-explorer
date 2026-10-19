# Independent review: Kloosterman sheaves and Bessel F-isocrystals

Job: `REV-DESIGN-KloostermanSheavesAndBesselIsocrystals` · issue #3557. Reviewer: Codex, session `codex-3FmCz4`, independent of designer session `codex-plXSes`. Date: 2026-10-19.

**Verdict: accepted after corrections, as a complete target-level planning pass.** All 54 nodes have individual verdicts in the packet: 28 verified and 26 corrected. This accepts the statements, dependencies and explicit proof boundaries. It does not certify a completed proof or remove the twelve recorded gaps. All twelve layers remain `planned`, none `closed`, and every implementation status remains `unchecked`.

| Item | Reviewed result |
| --- | --- |
| Nodes | 54: five definitions, eleven constructions, 33 theorems, five comparisons |
| Definition/construction APIs | 64 named items, four per object; 16 added |
| Discriminatory tests | 49, each with a protocol `kind`; one added |
| Planets | 49; maximum six in a layer; no new planets |
| Baseline citations | Four confirmed; none removed or replaced |
| Nodes added or deleted | Zero |
| Source findings | Sixteen inherited entries checked, E9 narrowed; three added; all nineteen have individual confirmed verdicts |
| Remaining contracts | Twelve gaps and fifteen supplier requests; no invented supplier stage |

The roadmap definition, packet, reader and suggested signatures were checked together. The reader contains every node statement, proof step, acceptance condition, API statement and test statement. The stage descriptions and convention dictionary agree with the corrected packet.

## Corrections made in place

1. **Full Frobenius iteration in KB.10.** The construction first defines a squaring multiplier at p=2. Over F_q with q=2^s, use
   `f_{F,q}(x)=∏_{i=0}^{s−1} f_F(x^{2^i})=F(x)/F(x^q)`.
   The maximal-slope quotient multiplier is `q^n/f_{F,q}`, and likewise for G. Iterating the series-ratio identity gives `h f_{G,q}=f_{F,q}h(x^q)`. Updated the Dwork-line API, series-ratio proof, quotient statement/Checks, G10, E15, roadmap description, reader and Lean convention. Added the q=4 geometric-series test and an elaborated polynomial example distinguishing the two factors.
2. **Horizontal equation in KB.10/maximal-quotient-bridge.** With η=F′/F and quotient connection d+ηdx, the equation is `c′+η(x)c=q x^{q−1}cη(x^q)`. The previous δ-form omitted the corresponding factors of x. The source-to-column convention repair and global identification of this line with the maximal quotient remain G5/G10. Checking horizontality alone does not close those gaps.
3. **Direct suppliers and prime scope.** KB.0 now imports the all-prime RD.2 Dwork example and takes its dual. The previously cited RD.1 example explicitly assumes p odd. KB.3 directly cites RD.4/algebraic-rigid-specialization-maps and RD.4/specialization-forget-supports-square. These require a smooth proper compactification and an overconvergent coefficient; they provide directed maps and a support square, not unconditional isomorphisms. The relative Hecke-family extension remains requested.
4. **Existing Tannakian and Euler-characteristic nodes.** KB.6/generated-groups imports MC.6/neutral-tannaka-reconstruction and RD.6/coefficient-category-is-neutral-tannakian. The latter already supplies the overconvergent category with Frobenius forgotten and the constant-subobject/invariant criterion. The retained-Frobenius category still needs its own fiber-functor verification. KB.6/rigidity-local now explicitly imports RD.6/grothendieck-ogg-shafarevich-formula; RD.5 supplies finiteness, duality and localization rather than that formula by itself.
5. **Existing Taylor transport and irreducibility.** KB.10/characteristic-two-comparison directly imports RD.3/taylor-comparison-of-pullbacks and KB.6/global-monodromy. Removed the implication that generic Taylor transport must be planned afresh. Its Frobenius square, the global/log slope filtration, the minimal-slope theorem and the Bessel quotient identification still require the specified application checks.
6. **Precise congruences and locators.** Wrote the signed congruence using the explicit quotient `R_i(a,n+m2^s)−u(i,s,m)R_i(a,n)`. Corrected the clean-datum HNY locator to Lemma 2.3 and Definition 2.4, pp. 256–257. Replaced the character-variant citation to a purported Definition 2.10 by Remark 2.5 and Definition 2.6, p. 257, and Definition 2.11, p. 260.
7. **API and tests.** Added the API item at the actual use of each of the sixteen objects: coefficient iteration, functional extensionality, level-model base change, clean-object morphism extensionality, intertwiner composition, Kummer exponents modulo integers, dual connections, oper-parameter extensionality, coefficient extension, log tensor/dual compatibility, tensor invariants, matrix base change, quadric constant extension, Gauss-sum extension, Dwork shift and Frobenius iteration. Classified all tests as computation, degenerate, compatibility, characterisation or non-example. Added no replacement group, coefficient category or generic scalar Kloosterman carrier.
8. **Source-issue precision.** E9 now confirms the principal-exponent misprint alone. The deliberately SL-only statement of XZ Theorem 4.5.2(ii) is not described as an error; central pushout remains a legitimate further target. Added the FG D-type index correction (E17), its duplicated local-invariant label (E18), and the XZ raw-hypergeometric trace sign in the toric-slope proof (E19). Added the relevant Checks/proof steps. The sign in E19 has valuation zero and does not change the slope argument.

## Sources and mathematical boundaries

I read the public versions at the node locators, including the hypotheses and nearby proofs needed to distinguish a theorem from a missing argument. The packet preserves the six PDF hashes and pagination conventions. All statements and finding descriptions here are in our own words.

- [Xu–Zhu, arXiv:1910.13391v2](https://arxiv.org/pdf/1910.13391v2): coefficient and normalization conventions, §§1.1–1.3, pp. 2–9; rank-one and logarithmic conventions, §2.1 and §2.9, pp. 9–11, 23–24; every cited target in §§4–5 and Appendix A, pp. 37–69. The quasi-minuscule exactness, tensor comparison, gauge dictionary and quotient Frobenius steps are not certified merely because the target theorem is stated there. Their repairs remain explicit.
- [Heinloth–Ngô–Yun, published author PDF](https://math.mit.edu/~zyun/Kloosterman_published.pdf): root-depth and big-cell geometry, §§1.2–1.4, printed pp. 250–255; clean objects, tame variant and eigenobject/monodromy statements, printed pp. 256–263. The source's prime restrictions are not used as an all-prime theorem.
- [Frenkel–Gross, arXiv:0901.2163v3](https://arxiv.org/pdf/0901.2163v3): connection and principal grading, §§5–6, pp. 8–14; Theorem 1, p. 16; Proposition 8 and Corollaries 9–10, pp. 27–28; Proposition 11 and its preceding boundary sequence, p. 29. Direct visual inspection confirmed the two new typographical findings in this version.
- [Zhu, arXiv:1603.05796v2](https://arxiv.org/pdf/1603.05796v2): Theorem 8 and Corollary 9, pp. 8–10, and Lemmas 18–21, pp. 20–23. The flatness/nonzero localization conditions and central-torus descent are not inferred from Satake alone; G3 retains those contracts.
- [Miyatani, arXiv:1607.04852v2](https://arxiv.org/pdf/1607.04852v2): Main theorem, pp. 2–3; Theorem 3.2.5, p. 23; Proposition 3.3.3, p. 26; Theorem 4.1.3 and the trace discussion, pp. 27–29. Rational/nonresonant parameters, support-to-ordinary convolution and cohomological normalizations remain explicit.
- [Gross–Reeder, author preprint dated 1 March 2010](https://people.math.harvard.edu/~gross/preprints/AdjointGamma5.pdf): Proposition 5.6 and §6 opening, pp. 34–35. The simple-wild conclusion requires a discrete Weil parameter, vanishing adjoint inertia invariants, minimal Swan and p prime to the Weyl-group order. Bare inertia data do not supply it.

The title/correction/erratum searches and available author/arXiv metadata did not identify a separate published erratum for these findings. This is a limited search result, not a claim that no correction exists. Findings concern the exact versions read. The algebraic/cohomological source leaves grouped by G1–G12 are not silently certified through XZ's bibliography; the packet names the outstanding inputs. No uncleared book copy was used.

## Baseline and ownership

All four baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and provide the advertised input with the required hypotheses:

| Declaration | Confirmed scope |
| --- | --- |
| `AddChar` | Additive monoid source and multiplicative monoid target; preserves zero as one and addition as multiplication. The character called `0` is constant one. |
| `AddChar.sum_eq_ite` | Finite additive group, commutative domain semiring target and decidable character equality; the full sum is cardinality for the trivial character and zero otherwise. Complex-valued use satisfies these hypotheses. |
| `FiniteField.algebraMap_trace_eq_sum_pow` | Field extension with finite upper field; algebra-mapped trace is the finrank-indexed sum of Frobenius powers. Finite lower field follows from its embedding. |
| `Matrix.trace` | Square matrix on a finite index type over an additive commutative monoid; sum of the diagonal entries. |

No baseline citation was removed, renamed or weakened. The Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`; none of the four entries is falsely attributed to it.

I checked the reviewed library audit, actual supplier packet statements, current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti library `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. ReductiveGroups and AdicSpaces supplied density and interface comparisons; the newer OrthogonalSpinGroups and LocalGaloisGroups documents/signatures supplied ownership checks. ReductiveGroupsPartII was also searched for the requested structural extensions. Existing comodules, highest-weight machinery, classical/Spin carriers and local ramification are imported. A point-valued Witt-vector isocrystal is not a curve coefficient category. No upstream file was changed.

The scalar KM owner supplies its own all-rank objects; the missing all-rank/all-prime ordinarity theorem stays in that direction. GS supplies equal-characteristic geometry; its common-DVR extension remains G1. BG1 supplies rational Newton orbits and representation detection, without suppressing the extra Kottwitz condition on B(H). FF.1 supplies Gauss norms and Hasse–Davenport with its extension sign. RD supplies the exact categories/comparison maps listed above. None is treated as a blanket supplier for all arithmetic D-module operations. Pending generic hypergeometric and global minimal-slope directions are proposals, not fabricated existing stages.

The layer order has no cycle: generic ordinarity and nonexceptional monodromy precede the characteristic-two comparison; the latter then supplies even-A monodromy and the characteristic-two raw identities. Central Frobenius uniqueness uses generated monodromy and is placed in KB.7. The 54 nodes realize all stated stage targets at the configured target granularity. No proof-only auxiliary lemma nodes are needed in this review.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/KloostermanSheavesAndBesselIsocrystals.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/KloostermanSheavesAndBesselIsocrystals.lean`: **exit 0**, exactly four `declaration uses sorry` warnings and no other warnings. Three light real-bodied definitions, four theorem signatures and six proved examples; no sorry-filled data definition. The new q=4 example elaborates. This checks signatures, not the four theorem proofs.
- Reader/packet consistency: every target, proof step, acceptance condition, API statement and test statement present; every request text present; corrected metadata/conventions agree.
- Independent exact finite-field calculations: Carlitz and the U₂/U₃ identities at every nonzero point of F₂, F₄ and F₈ passed. These distinguish the raw `−Q` constant without claiming an all-field proof.
- 960 exact rational checks of the alternating signed congruences for ranks 3, 5 and 7 passed; the exceptional coefficient ratio is 1/27. These are checks of the proposed hypotheses, not a proof of their universally quantified form.
- Formal-series calculations through degree 37 for q=2,4,8 checked the iterated product, corrected quotient horizontal equation and h-Frobenius identity. Those checks do not replace the G10 analytic continuation and slope identification.
- `git diff --check`: clean.

## Questions for the orchestrator and follow-up

No question blocks accepting this planning pass. Resolve the four recorded ownership proposals before packaging dependent extensions: the scalar KM owner and its ordinarity extension, relative/arithmetic coefficients, global/log minimal slopes, and the shared hypergeometric route. Generic oper localization and group-classification contracts also remain G3/G7. Fulfil G1–G12 rather than interpreting an accepted review as mathematical closure. In particular, G4, G5, G7 and G10 remain substantive proof repairs. The handoff lists the precise resumption points. This review does not open or claim those follow-up jobs.
