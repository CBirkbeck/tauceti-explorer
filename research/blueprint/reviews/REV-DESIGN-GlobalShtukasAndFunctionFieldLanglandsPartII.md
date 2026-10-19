# Independent review: Global shtukas and Langlands over function fields, Part II

Review job: REV-DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII, issue #3541. Reviewer: Codex, session codex-5iU04P, 19 October 2026. The design was written by a different agent/session (Claude, claude-iPRLEs, design issue #3381).

## Verdict and counts

**Accepted as a partial plan after corrections.** All 49 nodes are justified in their corrected scope: 46 corrected and 3 verified unchanged. No node was added or removed. There are 12 definitions, 5 constructions and 32 theorem targets; 86 API items (previously 85), 78 definition/construction tests (previously 72), and 25 planets. Every definition/construction has at least three tests. All implementation statuses remain unchecked.

The packet is partial; RA.1 is planned, the other eight layers are partial, and none is closed. Twelve gaps and twelve requests state the outstanding contracts. Accepting these targets does not close those gaps, assert a general noncentral-compact theorem, or construct a global Arthur homomorphism. This is a finished independent review, not a review checkpoint.

## Mathematical corrections

1. **Purity and the centre (RA.0–RA.1, RA.4–RA.5).** Arithmetic Weil-number purity quantifies over all embeddings; fixed-ι boundedness does not. General reductive groups use adjoint essential temperedness, while the arithmetic weight-0 assertion is stated for semisimple groups. An arbitrary faithful representation does not detect a common weight: for G_m and Frobenius q the identity character is pure of weight 2, whereas identity ⊕ trivial has weights 2 and 0. Likewise, arbitrary WD subquotients need not retain the ambient weight: ker N in Sp(2) has weight 0 although Sp(2) is pure of weight 1. Direct summands do retain the weight. These distinctions were checked against Taylor–Yoshida §1, Lemma 1.4(3)–(6), pp.6–7, and Gan–Harris–Sawin §3, pp.8–11. Finite inertia and the geometric-Frobenius sign are explicit.
2. **Curve weights and real Satake parts (RA.1–RA.2).** Use Lafforgue Corollaire VII.8, pp.201–202, for the actual constant-twist decomposition; absence of Hom does not alone give splitting of extensions. Sawin–Templier Lemma 11.4, p.83 uses real ι-weights. The normalized pairing is 2⟨μ,ν⟩=Deligne weight, rather than equality without the factor 2. The fixed-ι tempered-anchor route and the arithmetic discrete-series route are now separate.
3. **Local parameters (RA.3).** Uniformization proceeds from framed local shtukas to global shtukas and does not identify every Picard component after forgetting the framing (Li-Huerta §5, Theorem 5.16 and §6). Removed the characteristic-zero GL_n comparison from an equal-characteristic argument. Coefficient automorphisms moving √q and normal-image restriction require the exact ES5/ES6 contracts. Number-field descent of finite-length constituents uses finite-dimensional Hecke images and the simple Hecke-module correspondence. Central characters are restricted to a smooth central torus; no L-group of a nonsmooth centre is formed.
4. **Nonsplit tori (RA.3).** The uniformizer criterion has a split-torus converse only. For Res_{E/F} G_m with E/F unramified quadratic and χ(ϖ_E)=q_F^{1/2}, the scalar condition over q_F is satisfied, but parameter eigenvalues at Frob_F are ±q_F^{1/4}, of weight 1/2. The induced-torus criterion uses q_E. This is source finding E2 against the preprint.
5. **Globalizations and conjugation (RA.4).** The arithmetic globalization chain is semisimple; central reduction for general reductive groups remains G8. Kloosterman vanishing of adjoint inertia invariants excludes a proper Levi without implying adjoint irreducibility. The pseudo-globalization gives the same cuspidal support, not the desired discrete series itself. Galois conjugation is proved here for number-field models, and Casselman’s criterion includes central unitarity and the actual Jacquet exponents. Arbitrary discrete-series descent remains G2.
6. **Lifts, genericity and scope (RA.5).** Use the actual central-isogeny kernel and the cocycle law for nonsplit lifts. Extend highest-weight test modules to the finite L-group using their Γ-orbits and finite induction. The outer Frobenius component need not be central. The passage to adjoint rational points and nonsplit spherical tempered-to-generic theorem are explicit SR.4 requests. The central-compact restriction remains visible throughout the endpoints.
7. **Elliptic cohomology (RA.6).** Lafforgue–Zhu Proposition 1.2, pp.2–3, takes full S_σ-invariants, including the connected centre, and retains a frozen auxiliary leg. Their GL_r Corollary 2.1, p.4 has W^{G_m}; a lone moving standard factor can give zero. Satake IC coefficients are not constant coefficients. G10 records that realization bridge; G5 separately records integer weights for stack direct images. Sun Theorem 2.11 and Remark 2.12, pp.14–15, were read with their real-weight convention and are not silently substituted for either missing contract. No unconditional dual-closure assertion remains for the realization predicate.
8. **Arthur and discrete quotients (RA.7–RA.8).** Weak Arthur homomorphism data do not imply boundedness; trivial SL₂ alone does not imply temperedness. Weight patterns and real parts do not construct one global ψ or establish its full Satake equality. Fixed-level rationality concerns π with π^U≠0 and uses the full Hecke algebra. Xue Theorem 3.6.7, pp.30–31, allows arbitrary finite-codimension coefficient-field ideals, so finite dimension alone does not imply algebraic eigenvalues. A number-field model supplies that condition. Li-Huerta Theorem 6.13, pp.47–48, gives ramified compatibility for the full compact-support quotients; bare good-place compatibility does not. The latter distinction is now an explicit anchor hypothesis in RA.8.
9. **Weight certificates (RA.8).** Recomputed the F₄/E₇/E₈ root counts independently using exact rational coordinates from Ciubotaru–Harris (6.21), (6.23)–(6.26), pp.22–23. F₄ B₃ gives top counts (1,0,2) at (10,9,8), versus central (1,0,1); the other F₄ point has top weight 4 with multiplicity 1. E₇ gives (1,1) at (10,9). E₈ D₆ gives (1,0,2) at (18,17,16); the other three top weights are 13,9,5, each of multiplicity 1, versus central maxima 12,8,4 in Table 2, p.36. Sp6 and F₄ explicit list calculations also elaborate in Lean. These computations do not identify named orbits with actual SL₂ triples: N3’s opaque profile interface and missing E₇ profile are G12. The final vanishing concerns each global weight-graded monodromy operator, not the entire local discrete-series monodromy.

## Baseline, suppliers and ownership

Both baseline references were retained and confirmed at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174:

| Declaration | Source and use |
| --- | --- |
| Finset.prod_eq_single | Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean, line 355; the generated additive theorem sum_eq_single gives diagonal-array row/column equality. |
| Finset.prod_comm | Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean, line 121; sum_comm exchanges the finite sums. |

Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369. The reviewed GS.0–GS.7 coverage audit was read. No proposed target duplicates an existing library declaration. All 87 original external node statements and hypotheses were read. The characteristic-zero ES7/all-irreducible-representations dependency was removed; the two additional SR.0 coefficient-change and SR.1 Hecke-module suppliers were read, leaving 88 distinct external node references.

The current read-only TauCetiRoadmap checkout was inspected at 0d144d044dacebca17b654695b6f1ad58f159b27, and the current Tau Ceti library at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. ReductiveGroups and SmoothRepresentationsOfLocalGroups were read for scope and interfaces; the latter already owns coefficient change, Hecke modules, induction/Jacquet base change, tempered support, Casselman and c-group normalization. The requests seek the missing extra contracts, not copies of those targets. No upstream file was edited and no upstream build was run.

## Source issues and provenance

The original E1 is confirmed, and E2–E4 were added with independent confirmed verdicts. E1 is a proof gap in the discrete-series descent argument of Ciubotaru–Harris §4.1, p.11. E2 is its nonsplit-torus assertion in Proposition 3.10(2), pp.10–11. E3 is the arbitrary-faithful common-weight criterion in the published Gan–Harris–Sawin Definitions 2.5/3.3(b), pp.7–8. E4 is the stronger adjoint-irreducibility assertion of their published Remark 3.10, p.11: in rank one and odd characteristic the normal wild-inertia subgroup has a one-dimensional toral Lie centralizer preserved by the Weil group, a proper subrepresentation of the three-dimensional adjoint representation. HNY Corollary 2.13, pp.17–18, supplies the inertia description. Zero inertia invariants and no proper Levi remain the valid inputs used here.

The findings include correction searches, reasons, effects, source hashes and version-specific locators. E1/E2 are scoped to arXiv:2311.15300v1, not to the uncollated 2026 Annals article. Gan–Harris–Sawin findings E3/E4 were checked in the published Cambridge PDF. Public author errata and version histories were checked; no correction was located for these findings. The published GHS removal of p>3 does not identify the reason for the separate residue-cardinality qualification in the CH abstract.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GlobalShtukasAndFunctionFieldLanglandsPartII.json`: zero errors and zero warnings.
- Source-issue checks: `source_issues.check_issues` and `check_errata.versions_checked`: valid. The standalone errata-file wrapper is not the packet format; its component validators were applied directly.
- `lean-check research/blueprint/suggested/GlobalShtukasAndFunctionFieldLanglandsPartII.lean`: exit 0 at pinned Mathlib 082e2d37e8; one `sorry` warning, no other warnings. Available memory was 86 GiB before starting. No language server or Lake build was used.
- Exact rational root enumeration confirms the numerical comparisons above. Suggested Lean remains 211 lines and only gives targets expressible at the pins.
- Reader and roadmap were synchronised from the final packet, preserving every node, API item, test, source locator, request, gap and route. `git diff --check` passes.

## Follow-up for the orchestrator

Route the twelve precise requests to their owners, especially FA.6 trace-formula/globalization, SRU.3 orthogonality, HS2 equal-characteristic moduli, ES5/ES6 coefficient/central transport, KB.6 étale invariant vanishing, SR.3/SR.4 central reduction and rational-point transfer, DWP.8 stack integrality and realization, and N3 exceptional orbit profiles. Collate the Annals article before asserting that preprint findings survive in the version of record. The five other continuations of the original brief remain separate directions, and the held supercuspidal-parameters continuation must import the GHS material owned here rather than duplicate it. These are recorded follow-ups, not unfinished review actions.

## Node-by-node audit

| Node | Verdict | Check or correction |
| --- | --- | --- |
| `RA.0/geometric-l-homomorphism` | corrected | Made finite inertia explicit; retained the arithmetic, all-embeddings definition of geometricity. |
| `RA.0/geometricity-is-intrinsic` | corrected | Used finite inertia explicitly and connected the faithful-representation converse to its existing RD.6 request. |
| `RA.0/pure-weil-deligne-parameter` | corrected | Separated arithmetic WD purity from fixed-ι purity and analytic essential temperedness; removed false common-weight faithfulness and subquotient claims. |
| `RA.0/pure-completion-uniqueness` | corrected | Restricted the purity/boundedness equivalence to a fixed embedding, and applied uniqueness in the adjoint centralizer. |
| `RA.1/constant-field-weight-decomposition` | corrected | Used the exact absolute decomposition theorem VII.8 rather than inferring Ext vanishing from a no-Hom supplier. |
| `RA.1/geometric-boundary-propagation` | verified | Checked the constant-twist argument at the boundary, residue-degree normalization, the integer weight filtration and local weight–monodromy conclusion against Proposition 2.7 and Corollaire VII.8. |
| `RA.1/sawin-templier-purity` | corrected | Distinguished real ι-mixed weights from integer weights and restricted the reductive common-weight assertion to irreducible τ. |
| `RA.1/local-purity-of-irreducible-parameters` | corrected | Made the semisimple hypothesis visible in the conclusion and kept the reductive assertion on the adjoint projection. |
| `RA.2/cuspidal-parameter-local-systems` | corrected | Added the FA.6 stage edge for the already requested nonsplit support/coefficient extension; the chosen-σ relation remains explicit. |
| `RA.2/rational-satake-parameters` | corrected | Added the stage edge for the nonsplit FA.6 extension already requested by this consumer. |
| `RA.2/satake-real-part` | corrected | Corrected the factor of two between real Satake exponents and Deligne weights. |
| `RA.3/shtuka-uniformization` | corrected | Corrected the direction and framing of the uniformization construction; checked formal and generic-fibre locators. |
| `RA.3/li-huerta-compatibility` | verified | Checked Li-Huerta Theorems A/C and §§5–7, including the full compact-support excursion comparison and equality of Bernstein-centre elements. |
| `RA.3/local-parametrization` | corrected | Removed the characteristic-zero GL_n supplier; recorded exact missing normal-image and coefficient-normalization contracts. |
| `RA.3/geometric-representation` | corrected | Replaced the equal-characteristic use of ES7 GL_n comparison by a direct normalized-induction/Steinberg test. |
| `RA.3/geometricity-galois-conjugates` | corrected | Made the requested normalization contract a hypothesis and reused current SR.0 coefficient transport. |
| `RA.3/geometric-torus-characters` | corrected | Corrected the nonsplit-torus converse and supplied an explicit unramified quadratic counterexample. |
| `RA.3/geometricity-stability` | corrected | Explained finite-length coefficient descent through finite-dimensional Hecke images; corrected the cross-Levi cuspidal-support wording. |
| `RA.3/geometric-central-characters` | corrected | Replaced an undefined L-group of a possibly nonsmooth centre by the central split-torus statement needed for exponents. |
| `RA.4/iota-tempered` | corrected | Kept the Salem control and made central-character unitarity explicit in Casselman’s criterion. Made the central-unitarity clause explicit in the API equivalence as well as in its proof. |
| `RA.4/supercuspidal-irreducible-globalization` | corrected | Restricted the arithmetic Galois globalization chain to semisimple G; recorded the reductive central reduction separately. Recorded the unused stronger adjoint-irreducibility claim as published-source issue E4, with HNY’s rank-one counterexample. |
| `RA.4/discrete-series-pseudo-globalization` | corrected | Checked the full appendix proof and pseudo-coefficient support condition; made the finiteness and central-torus convention explicit. |
| `RA.4/discrete-series-irreducible-globalization` | corrected | Restricted the arithmetic Galois globalization chain to semisimple G; recorded the reductive central reduction separately. |
| `RA.4/weil-deligne-purity-of-discrete-series` | corrected | Kept the reductive analytic theorem separate from semisimple arithmetic purity and exposed its missing central-reduction contract. |
| `RA.4/geometric-discrete-series` | corrected | Kept the justified semisimple geometricity theorem and moved the reductive extension to the precise central-reduction gap. |
| `RA.4/galois-conjugation-of-discrete-series` | corrected | Aligned the algebraic-model hypothesis with the number-field model required by geometricity; checked Casselman’s strict exponent inequalities. |
| `RA.4/embedding-independent-temperedness` | corrected | Added the central-character supplier and used actual Jacquet exponents in the embedding-independence proof. |
| `RA.5/test-representations` | corrected | Added finite induction to extend non-Galois-invariant highest-weight modules to the finite L-group. |
| `RA.5/adjoint-lift` | corrected | Corrected the isogeny kernel, the cocycle law, and the fixed-ι lifting assertion used by a tempered anchor. |
| `RA.5/integral-weights-from-anchor` | corrected | Separated the fixed-ι tempered route from arithmetic geometricity, and removed an overstrong elliptic-curve consequence. Added the direct SR.3 tempered-support edge and used a semisimple example. |
| `RA.5/generic-ramanujan` | corrected | Corrected nonsplit centrality and replaced the invalid passage to all adjoint rational points by an explicit transfer request. Specified the nonsplit compact-factor convention without requiring the outer Frobenius component to be central. |
| `RA.5/genericity-propagation` | corrected | Exposed the general spherical-generic theorem instead of treating a split-adjoint supplier as a nonsplit theorem. |
| `RA.6/elliptic-parameter` | corrected | Aligned the reductive examples with the hypotheses and corrected the fixed-centre calculation for nonsplit tori. |
| `RA.6/elliptic-implies-tempered` | corrected | Replaced a reductive GL_r example by an example satisfying the semisimple hypothesis. |
| `RA.6/lafforgue-zhu-decomposition` | corrected | Retained full centralizer invariants and the auxiliary frozen leg; separated Satake coefficients from the constant-coefficient realization claim. Corrected the source-match description to full centralizer invariants and recorded the conditional realization stage edge. |
| `RA.6/stack-realisability` | corrected | Removed unjustified dual closure, made the constant-coefficient bridge explicit, and fixed the ℓ-adic continuity condition in the negative test. |
| `RA.6/stack-purity` | corrected | Made the stack route conditional on its recorded integrality input and required realization of the lifted separator modules. |
| `RA.7/global-arthur-parameter` | corrected | Made the weak Arthur-data convention and coefficient topology explicit; repaired the false boundedness test. |
| `RA.7/arthur-weight-prediction` | corrected | Removed the claim that RA.8 constructs Arthur parameters or proves Satake matching; corrected the converse test. |
| `RA.7/compatible-global-parameter` | corrected | Aligned the Xue example with its necessary algebraic-model hypothesis. |
| `RA.7/discrete-spectrum-parametrization` | corrected | Restricted the semisimple Hecke action to the field-valued discrete-spectrum module, and imposed χ²=1 on the PGL₂ residual-character example. |
| `RA.7/conditional-discrete-rationality` | corrected | Added the fixed-level condition to number-field descent of discrete representations. |
| `RA.7/xue-hecke-quotient-parametrization` | corrected | Corrected the algebraicity hypothesis and supplied ramified-place compatibility via Li-Huerta’s full-C_c comparison. |
| `RA.8/global-weight-pattern` | corrected | Made compatibility at the anchor explicit; good-place Satake compatibility alone is not the stated hypothesis. |
| `RA.8/complementary-series-propagation` | corrected | Made compatibility at the anchor explicit; good-place Satake compatibility alone is not the stated hypothesis. Corrected the comparison for different residue cardinalities and made the adjoint product reduction explicit. |
| `RA.8/weight-array` | corrected | Made compatibility at the anchor explicit; good-place Satake compatibility alone is not the stated hypothesis. |
| `RA.8/property-a` | verified | Verified the downward-induction proof for a finitely supported symmetric array and the two-entry counterexample to equality of row and column sums. |
| `RA.8/extraneous-weight-certificates` | corrected | Separated checked numerical counts from missing orbit-to-triple identifications and the E7 supplier profile. |
| `RA.8/extraneous-point-elimination` | corrected | Made compatibility at the anchor explicit; good-place Satake compatibility alone is not the stated hypothesis. |
