# BP-AInfCohomology--AI.6 handoff

Issue #665; agent Codex; session **codex-KvLAhK**. The bot confirmed the claim in [comment 6022141897](https://github.com/CBirkbeck/tauceti-explorer/issues/665#issuecomment-6022141897). Work is on branch **codex-KvLAhK-665-ainf-semistable**. This is the complete target-level planning pass for AI.6 and AI.7, submitted for independent review. It is not a checkpoint. No second issue was claimed.

## Delivered and coverage

The deliverables are the [packet](../packets/AInfCohomology--AI.6.json), [reader](../readmes/AInfCohomology--AI.6.md), [suggested file](../suggested/AInfCohomology--AI.6.lean), and this handoff. No application, atlas, queue, reserved-ID, upstream-roadmap or other-job file was changed.

There are **55 nodes: 3 definitions, 15 constructions, 35 theorems and 2 applications**, with **58 API items, 55 unit tests, 12 planets** (six in each stage), **15 baseline declarations, 17 supplier requests and 5 gaps**. AI.6 has 38 nodes; AI.7 has 17. All implementation statuses remain unchecked.

Both **AInfCohomology:AI.6** and **AInfCohomology:AI.7** are **planned**, and neither is closed. Every stated target has a declaration with hypotheses, proof/construction steps, direct prerequisites, source locators and acceptance requirements. Definitions/constructions have consumer uses, at least three API items and at least three discriminating tests. Chains terminate in the pinned baseline, an exact supplier node, an explicit supplier-stage request or a recorded gap. Packet status is **complete**, as the issue requires after every stage is planned or closed.

The accepted RS-01 restructuring is retained: AI.6 owns the CK semistable extension and its actual comparisons; AI.7 owns the smooth cohomological Breuil–Kisin functor and cross-theory agreement. Neither stage is dropped. The seven integrated AI.1 node IDs are imported without duplication. Exact PR.0/PR.1/PR.3/PR.6, EnhancedDerivedSheaves:E1/E4 and R07.4 coefficient-ring nodes are also imported. Generic décalage, completion, period rings, log crystalline sites, relative spectra and representation classification are not replanned here.

## What a follow-up must close

1. **G-GAGA:** supply CK Theorem 4.12's formal GAGA over a height-one valuation ring V, complete for a nonzero nonunit a, for proper finitely presented V-schemes, including locally free algebraization. The proposed owner is **AdicSpaces, Part II: Formal GAGA over valuation rings**. CK's deduction and references were read; the cited Fujiwara–Kato book proof was not read. This extends the upstream elementary geometry rather than replacing an existing layer.
2. **G-CURVE:** CR.5 must supply the explicit logarithmic Čech/normalization/trace calculation for the completed conic Proj O_K[X,Y,Z]/(XY−πZ²), including H_logdR=(O_K,0,O_K) and the compatible degree-two Tate-twist generator. The node specifies its expected consequences and the allowed comparison with a smooth P¹ model. The calculation is a requirement, not a certified imported theorem. This genus-zero example has zero H¹ and zero monodromy.
3. **G-MAPS:** RT.6 and PR.3 must supply the relative trace/prismatic equivalence with actual Hodge–Tate structure maps, PD/Koszul generator maps and faithful-flat descent compatibility. PR.6's corrected mathematical contracts are used as planning inputs; its overall needs_changes review and deficient proposed Lean carriers do not provide a certified implementation. BS22 §18 only supplies uniqueness over a perfect prism once η is checked. It does not prove every comparison square merely from an equivalence of functors.
4. **G-LEAN-GEOMETRY:** replace the 51 explicitly omitted geometric node signatures, their API signatures and tests with signatures using the actual supplier types. Every omitted name and mathematical specification is inventoried in the suggested file. There are no arbitrary formal-scheme carriers, assumed comparison structures or proposition-valued stand-ins.
5. **G-LEAN-CONTINUATIONS:** complete the chart universal property through the continuous-ring API, extend the polynomial logarithmic derivations to the (p,μ)-complete étale/PD lifts, and state the actual O_K/A_inf θ-squares and Eisenstein-ideal maps. The algebraic components are concrete; these continuations require the supplier types.

The packet's 17 requests give exact consumer-node lists. They cover **AI.0**, **AI.0:period-comparison**, **AI.1**, **AI.2**, **AI.3**, **AI.4**, **AI.5**, **CP.3**, **CR.0**, **CR.5**, **CR.5:log-algebra**, **CR.6**, **EnhancedDerivedSheaves:E1**, **R07.4**, **PerfectoidSpaces:P3**, **PR.3** and **RT.6**. In particular:

- CP.3 supplies the canonical B_dR⁺ deformation/crystalline object of an arbitrary smooth proper analytic generic fibre. Its existing good-reduction-only node does not cover the CK semistable comparison target.
- AI.2 supplies equivariant Fargues classification and its invariant θ-lattice with the specified continuous G_K action; no arbitrary torsion BKF classification is assumed.
- AI.5 supplies the generic Tor/freeness/rank and normalized valuation-length algebra, including CK §§7.10–7.11.
- R07.4 supplies the broad finitely presented cohomological Breuil–Kisin category and p-inverted freeness. Its finite-free Kisin-module node is insufficient for torsion cohomology.
- EnhancedDerivedSheaves:E1 supplies faithful-flat descent and detection for algebra maps and coherent diagrams within its coefficient-change interface.
- RT.6 supplies BMS2 §11's relative sphere[z] spectra, the even QRS unfolding, Bott-inverted cyclotomic extension, Segal input and filtered map; PR.3 supplies the nonperfect Breuil–Kisin specialization of the trace/prismatic bridge.

## Conventions requiring review

The CK integral root tower is not asserted flat. The closed-node p=2 root test has special-fibre length three and generic rank two. Monomial indices have signed torus exponents, and a zero-branch witness does not make a duplicate index. All-coordinates log exactification precedes the ordinary PD construction; its completed envelope can have p-torsion. Finite PD base change requires m≥p, whereas the exponential derivation argument requires m≥p². Degree-j logarithmic Frobenius is p^jφ.

θ and θ̃ remain distinct. The θ̃ image of a lifted chart variable is its chosen p-th root in R_∞, not its original coordinate in R. Hodge–Tate reduction is along θ̃; its Bockstein supplies the differential in the θ de Rham comparison.

For 𝔖=W(k₀)[[u]], φ_𝔖 is Witt Frobenius on coefficients and u↦u^p. The normalized A_inf map f has u↦[π^♭]^p and Witt Frobenius on coefficients; f(E) generates (ξ̃). The de Rham map θ_𝔖=θ̃_𝔖∘φ_𝔖 has u↦π^p. The crystalline map is φ_W∘constantCoeff. Prismatic base change to the ξ̃ prism identifies with φ_A^*Δ for the ξ prism, hence AΩ. The twisted trace complex uses the map g with u↦[π^♭]; the degree-two Bott class b is distinguished from this coefficient u. BMS2's descent inverts b. Its Nygaard filtration does not functorially descend, although the canonical φ^*D≃Lη_E D factorization exists.

Perfectness of the total complex is not freeness of its cohomology. Degreewise comparisons retain adjacent-degree ξ/Tor₁ terms. The model-independent lattice theorem requires log de Rham freeness in **both i and i+1**. The valuation length in the log de Rham torsion inequality is normalized by v(p)=1. Uniformizer/root transport is constructed after extension through the common AΩ object; descent of a morphism requires its Čech datum.

## Verification

`python3 scripts/check_blueprint.py research/blueprint/packets/AInfCohomology--AI.6.json` reports **0 errors and 0 warnings**, with both stages planned. The supplied baseline declaration index was used. The actual source also contains the generated order-dual Finset minimum declaration; Finset.max′ is the directly indexed baseline citation. Inline source issues and version records pass the source-issue validation used by the blueprint checker. The standalone errata-job wrapper is not applicable to a blueprint packet.

`lean-check research/blueprint/suggested/AInfCohomology--AI.6.lean` completed with **exit code 0** and **only the 28 standard proof-placeholder warnings**. It used the existing shared build at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, with **leanprover/lean4:v4.34.0-rc2**. Available memory exceeded 20 GB before compilation. No language server, Lake build, update, cache download or private project was started. The suggested file imports individual Mathlib modules and has no Tau Ceti imports, so no unpinned Tau Ceti module was used.

Compilation checks the four actual algebraic prototypes (chart, exponent indices, polynomial logarithmic derivations, power-series normalization), their algebraic API/test signatures, and the auxiliary monodromy/scalar tests. **It does not check the 51 omitted geometric signatures or any geometric comparison proof.** All 55 declaration names, 58 API names and 55 test names occur in the inventory; comment presence is distinguished from an elaborated declaration.

The dependency audit used the checkout's atlas graph with **1,962 stages and 3,458 existing stage edges**. It checked the packet's **32 cross-stage direct-prerequisite/link edges**, including **22 new edges**. None introduces a cycle. The confirmed CP.3→AI.6 link is present, and there is no AI.7 back edge into AI.0–AI.6. CP.4 and CP.5 consume AI.6. No claim is made about unrelated packets' unintegrated edges.

Mathlib declarations were read at the pinned commit. Tau Ceti searches used the pinned **f790474821cf4256814db967cb154e7af3d0c369** source. The reviewed library-coverage file has no AInfCohomology entry; unreviewed AUDIT-35 was a search lead only. Existing ordinary derived categories, divided powers/algebras, Witt vectors, polynomials and ordinary adic completion are accurately separated from the missing enhanced/geometric constructions.

## Sources read and missing

All readings were on **2026-10-06**. The packet preserves URLs, editions, hashes, locator excerpts and source versions; the reader lists the passage-level boundaries.

- **CK:** arXiv:1710.06145v3, 4 October 2018; §§1.5–1.7, 2.1–2.3; §§3.1–3.3, 3.14–3.25, 3.30–3.35; §§4.1–4.6, 4.11–4.21; §§5.1–5.7, 5.9–5.34, 5.38–5.44; §§6.5–6.8; §§7.1–7.12, 8.1–8.8, 9.1–9.6. The proof passages for the owned targets were read, including all-coordinates exactification and the arithmetic lattice theorem.
- **BMS1:** published PMIHES 128 (2018), 219–397, DOI 10.1007/s10240-019-00102-z; §4.4, pp.280–283, including Lemma 4.30, **Proposition** 4.32 and Corollary 4.33 with proofs. Other foundations and §13 are imported through the supplier contracts; this handoff does not claim those complete proofs were read.
- **BMS2:** published PMIHES 129 (2019), 199–310, DOI 10.1007/s10240-019-00106-9; Theorem 1.2, Remarks 1.3–1.4, and all of §11, pp.298–308, including its proofs and Remarks 11.16–11.17.
- **BS22:** arXiv:1905.08229v4, 12 January 2022; §18 with proof, pp.122–123; Theorem 1.8 and Examples 1.3(3), 1.9(2)–(3), pp.2–6, including the crystalline Frobenius pullback. §17's corrected comparison contracts were checked through PR.6. The complete §15 relative bridge proof is required from RT.6/PR.3 under G-MAPS.

Missing proof inputs are the cited Fujiwara–Kato formal GAGA proof, the explicit CR.5 conic calculation and the fully compatible relative trace/prismatic supplier map. They are named gaps rather than unacknowledged source claims.

The two sourceIssues record the BMS1 automorphism/endomorphism misprint and the BMS2 missing relative-base symbol. Both are against published text, with correction searches and neither affecting a stated result. No unverified preprint wording is attributed to the published article.

## Submission and resume

The PR body identifies this as a complete planning pass, with **Refs #665**, the agent/session, checks and the precise compilation boundary. Automatic swarm submission and intake decide integration; workers do not merge, close the issue or change labels. The mathematical planning work ends at this submission. Independent review can use the register, named omissions, source locators and five gap records without any scratch files. Follow-up begins from the five closure tasks above and the exact supplier requests, rather than expanding the stage's scope.
