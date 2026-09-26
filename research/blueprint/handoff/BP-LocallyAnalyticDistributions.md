# BP-LocallyAnalyticDistributions — operator-theory checkpoint

Issue: #641. Worker: ChatGPT Pro / GPT-6 Astra Pro. Session: `chatgpt-20260926-c8f4a1`. Date: 2026-09-26. Claim confirmed by the swarm bot in comment 5849311681, responding to claim comment 5849310758.

## Delivered

The four permitted deliverables are present: packet, roadmap document, suggested Lean file and this handoff. No application code, content, integrated data, queue, reserved IDs or another packet was edited.

The packet is **partial**. It has 31 nodes: 4 definitions, 5 constructions, 8 lemmas, 11 theorems and 3 comparisons. Its nine definitions/constructions have 27 API entries and 27 unit-test statements; there are six L4 planets, nine pinned baseline declarations, seven explicit gaps and four supplier requests. All five stage IDs are in scope. L0–L3 are `not_read`; L4 is `partial`; zero stages are closed. All implementation statuses remain unchecked.

All thirteen integrated L4 node IDs and their nineteen recorded prerequisite links are retained. This preserves external consumers of those IDs. The additions expose the c0 extension, finite-module topology, finite-coordinate detection, coefficient/tail estimates, Gauss convergence, (Pr) lifting, finite projectivity, direct sums, evaluated product identities, entire division, unit resultants, resolvent coefficients and the compact-identity finite-generation argument.

The substantive new proof is the evaluated determinant product identity over a Noetherian Banach algebra and then a (Pr) module. Finite output truncations of u,v and u+v-uv share the column majorant max(r_j(u),r_j(v),norm(v)r_j(u)). A finite-exception bound gives uniform entire coefficient tails; fixed-degree continuity plus those tails justifies evaluation at one. Finite matrix determinant multiplication then passes to the limit. The proof does not assume uv=vu and does not assert the false whole-series identity.

The finite-projective discussion guards against assuming constant rank: id on eA over A=K times K has determinant 1-eT, with a nonunit leading coefficient. Equality of residue-field polynomials alone also does not give equality over nonreduced A. These are proof-design warnings, not a claim of a new published error.

## Library and source checks

Freshly read pinned Mathlib declarations include the existing C0 carrier and completeness, nonarchimedean unconditional summability, norm-controlled preimages/open mapping over nontrivially normed fields, finite determinant multiplication and the distinct compact-image predicate. The aggregate library-coverage file was too large for the connector; the relevant LAD records and accepted review in AUDIT-25.result.json were read instead. Its Tau Ceti results are inherited audit evidence, not a fresh exhaustive Tau Ceti search.

Read public versions of Buzzard Section 2 through Lemmas 2.12–2.13 and Section 3 through Theorem 3.3; Serre's determinant estimates, product identity, resolvent and Riesz projector proof; and the relevant Coleman A3/A4 passages. Exact editions, sections and read date are in the packet. The small finite-coordinate detection argument in Buzzard Lemma 2.3(a) is accessible: write generators m_alpha in coordinates, take the finite span of the column vectors in A^r using Noetherianity, and select a finite generating subset of columns. Vanishing on that subset forces vanishing on all coordinates. It still needs declaration-sized algebraic interfaces, not a new analytic assumption.

BGR was not acquired. RJW arXiv:2309.15692 was identified, but its proof text was not read. No claim of complete source coverage is made. Relevant style/convention sections of the upstream ModularForms and AdicSpaces documents were read; neither entire roadmap was newly audited.

## Validation

JSON was sent as a complete UTF-8 file through the connector. The official checker source was inspected for schema, dependency, coverage and planet rules. **The official repository checker has not been run locally**, because there is no local repository/world or pinned declaration index; its authoritative run is requested through PR CI. Do not describe inspecting the checker as executing it. The PR discussion/checks should record its eventual result.

Local SymPy checks passed for finite noncommuting matrix determinant multiplication and rejection of the erroneous rank-one whole-series identity. These are finite regression calculations, not a proof or a Lean elaboration test.

**Suggested Lean file: NOT COMPILED.** Lean/lake are absent. The file uses actual Mathlib carriers, an explicit approximation predicate and explicit ultrametric assumptions on analytic theorem signatures. Three of the packet's tests (`potential_not_isometric`, `projective_not_free`, `variable_rank_projective`) are named in an omission worklist rather than transcribed as examples. The completed-base-change API and several high-level signatures likewise remain untranscribed. There are no Prop-valued placeholders pretending to express those missing conditions. Instance inference and helper-coordinate API still require auditing at the pin.

## Continuation, in dependency order

1. Acquire/decompose the BGR canonical finite-module topology and closed-submodule proofs, then choose exact algebraic declarations for finite-coordinate detection. Open mapping itself is already supplied by the pinned library.
2. Audit the finite free determinant comparison, rectangular Sylvester identity, monic quotient basis/adjugate and finite-projective determinant, fibre-rank and Cayley–Hamilton interfaces. Finish the normed endomorphism/Neumann-series and operator-valued adjugate estimates.
3. Select and construct the completed tensor carrier; prove c0 scalar extension, extension of retractions and the (Pr) exercise APIs. Do not import this from the foundational AdicSpaces roadmap without an actual supplying stage.
4. Construct the spectral resultant D(B,P) and transport Coleman A3.8–A3.9 to Noetherian Banach A and (Pr) modules. Check the normalization involving Q*(0). The new product theorem does not alone establish this spectral mapping or close Buzzard Lemma 3.1.
5. Expand Hasse calculus, projectors and exact finite-slope annihilation to declaration granularity, retaining the existing IDs as public targets. Do not stop at a power of Q*(u) annihilating the summand.
6. Read/decompose L0–L3; construct the actual affinoid distribution families, integral models, uniform-character-radius actions, operator estimates and specialization. Respect RS-16: scalar character-space construction stays with PadicMeasuresIwasawaAlgebras:L0a; the distribution-family action stays here.
7. Finish every API/test signature and compile the suggested file against the pin before asserting an elaborated interface. Re-run repository validation and obtain an independent mathematical review.

The four precise supplier requests are to PadicMeasuresIwasawaAlgebras:L0, :L2, :L0a and :L3. That supplier packet was absent when checked; no invented node IDs or wait-for-supplier dependency was introduced.
